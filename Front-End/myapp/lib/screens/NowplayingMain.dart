import 'dart:math';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

import 'package:myapp/main.dart';
import 'package:myapp/metadata.dart';

void main() => runApp(newPlayer(
      playsong: null,
    ));

class newPlayer extends StatefulWidget {
  @override
  final int playsong;
  // In the constructor, require a Todo.
  newPlayer({Key key, @required this.playsong}) : super(key: key);

  _newPlayerState createState() => _newPlayerState();
}

class _newPlayerState extends State<newPlayer> {
  AudioPlayer _player;
  var playList;
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    playList = dataList.sublist(widget.playsong);

    ConcatenatingAudioSource _playlist =
        ConcatenatingAudioSource(useLazyPreparation: true, children: [
      // Gave errors stating assignment of Set<Audio Source> in <AudioSource>
      // Due to working of maps such that they create a set. But, for individual items, use () instead of {}
      for (Map name in dataList.sublist(widget.playsong))
        (AudioSource.uri(
          Uri.parse(name["webContentLink"]),
          tag: AudioMetadata(
            album: name["albumName"],
            title: name["trackName"],
            artwork: name["albumArtLink"],
          ),
        )),

      // AudioSource.uri(
      //   Uri.parse(dataList[0]['webContentLink']),
      //   tag: AudioMetadata(
      //     album: dataList[0]["albumName"],
      //     title: dataList[0]["trackName"],
      //     artwork: dataList[0]["albumArtLink"],
      //   ),
      // ),
      // New audioSource
    ]);
    _init(_playlist);
  }

  _init(ConcatenatingAudioSource _playlist) async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    try {
      await _player.load(_playlist);
    } catch (e) {
      // catch load errors: 404, invalid url ...
      print("An error occured $e");
    }
  }

// What Closing the panel with back button does.
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var index = widget.playsong;
    print(index);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: StreamBuilder<SequenceState>(
                  stream: _player.sequenceStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    if (state?.sequence?.isEmpty ?? true) return SizedBox();
                    final metadata = state.currentSource.tag as AudioMetadata;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child:
                                Center(child: Image.network(metadata.artwork)),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(metadata.title ?? '',
                                style: TextStyle(
                                    color: Color(0xffff0055),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28))),
                        Padding(
                            padding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                            child: Text(metadata.album ?? '',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 22))),
                      ],
                    );
                  },
                ),
              ),
              ControlButtons(_player),
              StreamBuilder<Duration>(
                stream: _player.durationStream,
                builder: (context, snapshot) {
                  final duration = snapshot.data ?? Duration.zero;
                  return StreamBuilder<Duration>(
                    stream: _player.positionStream,
                    builder: (context, snapshot) {
                      var position = snapshot.data ?? Duration.zero;
                      if (position > duration) {
                        position = duration;
                      }
                      return SeekBar(
                        duration: duration,
                        position: position,
                        onChangeEnd: (newPosition) {
                          _player.seek(newPosition);
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  StreamBuilder<LoopMode>(
                    stream: _player.loopModeStream,
                    builder: (context, snapshot) {
                      final loopMode = snapshot.data ?? LoopMode.off;
                      const icons = [
                        Icon(Icons.repeat, color: Colors.grey),
                        Icon(Icons.repeat, color: Colors.pink),
                        Icon(Icons.repeat_one, color: Colors.pink),
                      ];
                      const cycleModes = [
                        LoopMode.off,
                        LoopMode.all,
                        LoopMode.one,
                      ];
                      final index = cycleModes.indexOf(loopMode);
                      return IconButton(
                        icon: icons[index],
                        onPressed: () {
                          _player.setLoopMode(cycleModes[
                              (cycleModes.indexOf(loopMode) + 1) %
                                  cycleModes.length]);
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      " ",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  StreamBuilder<bool>(
                    stream: _player.shuffleModeEnabledStream,
                    builder: (context, snapshot) {
                      final shuffleModeEnabled = snapshot.data ?? false;
                      return IconButton(
                        icon: shuffleModeEnabled
                            ? Icon(Icons.shuffle, color: Colors.pink)
                            : Icon(Icons.shuffle, color: Colors.grey),
                        onPressed: () {
                          _player.setShuffleModeEnabled(!shuffleModeEnabled);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  ControlButtons(this.player);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.volume_up),
          color: Colors.grey,
          onPressed: () {
            _showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),
        StreamBuilder<SequenceState>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            color: Color(0xffff0055),
            icon: Icon(Icons.skip_previous),
            onPressed: player.hasPrevious ? player.seekToPrevious : null,
          ),
        ),
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: EdgeInsets.all(8.0),
                width: 74.0,
                height: 74.0,
                child: CircularProgressIndicator(),
              );
              // player.play;
            } else if (playing != true) {
              return Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color(0xffff0055), shape: BoxShape.circle),
                  child: Center(
                      child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.play_arrow),
                    iconSize: 60.0,
                    onPressed: player.play,
                  )));
            } else if (processingState != ProcessingState.completed) {
              return Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color(0xffff0055), shape: BoxShape.circle),
                  child: Center(
                      child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.pause),
                    iconSize: 60.0,
                    onPressed: player.pause,
                  )));
            } else {
              return Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color(0xffff0055), shape: BoxShape.circle),
                  child: Center(
                      child: IconButton(
                    color: Color(0xffff0055),
                    icon: Icon(
                      Icons.replay,
                    ),
                    iconSize: 60.0,
                    onPressed: () => player.seek(Duration.zero, index: 0),
                  )));
            }
          },
        ),
        StreamBuilder<SequenceState>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            color: Color(0xffff0055),
            icon: Icon(Icons.skip_next, color: Color(0xffff0055)),
            onPressed: player.hasNext ? player.seekToNext : null,
          ),
        ),
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => IconButton(
            color: Color(0xffff0055),
            icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                )),
            onPressed: () {
              _showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 1.5,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Slider(
          activeColor: Color(0xffff0055),
          inactiveColor: Colors.pink[200],
          min: 0.0,
          max: widget.duration.inMilliseconds.toDouble(),
          value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
              widget.duration.inMilliseconds.toDouble()),
          onChanged: (value) {
            setState(() {
              _dragValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) {
            if (widget.onChangeEnd != null) {
              widget.onChangeEnd(Duration(milliseconds: value.round()));
            }
            _dragValue = null;
          },
        ),
        Positioned(
          right: 22.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("$_remaining")
                      ?.group(1) ??
                  '$_remaining',
              style: TextStyle(color: Colors.grey)
              //Theme.of(context).textTheme.caption),
              ),
        )
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}

_showSliderDialog({
  BuildContext context,
  String title,
  int divisions,
  double min,
  double max,
  String valueSuffix = '',
  Stream<double> stream,
  ValueChanged<double> onChanged,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => Container(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: TextStyle(
                      fontFamily: 'Fixed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? 1.0,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class AudioMetadata {
  final String album;
  final String title;
  final String artwork;

  AudioMetadata({this.album, this.title, this.artwork});
}
