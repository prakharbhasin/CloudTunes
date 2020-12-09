// --------------------------------------------------APPU OKKAY HII ------------------------------------------------------------

// import 'package:flutter/material.dart';
// //import 'package:nowplay/nowPlayingScreen.dart';

// import '../components/albumart.dart';
// import '../components/navbar.dart';
// import '../components/colors.dart';
// import '../components/playerControls.dart';
// import '../components/nowPlayingScreen.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   ));
// }

// class Player extends StatefulWidget {
//   @override
//   _PlayerState createState() => _PlayerState();
// }

// class _PlayerState extends State<Player> {
//   double sliderValue = 2;

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: primaryColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           NavigationBar(),
//           Container(
//             height: height / 2.5,
//             child: ListView.builder(
//               itemBuilder: (context, index) {
//                 return AlbumArt();
//               },
//               itemCount: 3,
//               scrollDirection: Axis.horizontal,
//             ),
//           ),
//           Text(
//             'Highest in the room',
//             style: TextStyle(
//                 fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
//           ),
//           Text(
//             'Travis Scott ',
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white70),
//           ),
//           SliderTheme(
//             data: SliderThemeData(
//                 trackHeight: 5,
//                 thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
//             child: Slider(
//               value: sliderValue,
//               activeColor: darkPrimaryColor,
//               inactiveColor: darkPrimaryColor.withOpacity(0.3),
//               onChanged: (value) {
//                 setState(() {
//                   sliderValue = value;
//                 });
//               },
//               min: 0,
//               max: 20,
//             ),
//           ),
//           PlayerControls(),
//           SizedBox(
//             height: 100,
//           )
//         ],
//       ),
//     );
//   }
// }

// --------------------------------------------------APPU OKKAY BYE ------------------------------------------------------------

import 'dart:math';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

import 'package:myapp/main.dart';
import 'package:myapp/metadata.dart';

// void main() => runApp(newPlayer());

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: newPlayer(),
  ));
}

class newPlayer extends StatefulWidget {
  @override
  _newPlayerState createState() => _newPlayerState();
}

class _newPlayerState extends State<newPlayer> {
  AudioPlayer _player;

  ConcatenatingAudioSource _playlist = ConcatenatingAudioSource(children: [
    LoopingAudioSource(
      count: 2,
      child: ClippingAudioSource(
        start: Duration(seconds: 60),
        end: Duration(seconds: 65),
        child: AudioSource.uri(Uri.parse(
            "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")),
        tag: AudioMetadata(
          album: "Science Friday",
          title: "A Salute To Head-Scratching Science (5 seconds)",
          artwork:
              "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
        ),
      ),
    ),

    // AudioSource.uri(
    //   Uri.parse(dataList[0]['webContentLink']),
    //   tag: AudioMetadata(
    //     album: "Science Friday",
    //     title: "A Salute To Head-Scratching Science",
    //     artwork:
    //         "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
    //   ),
    // ),
    AudioSource.uri(
      Uri.parse(
          "https://docs.google.com/uc?export=download&id=1re4tYhSiagXNtdQkzLG39jOk8ujAAcHM"),
      tag: AudioMetadata(
        album: "Yandhi",
        title: "80 Degrees/Hurricane",
        artwork:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Yandhi_Cover_Art_%28Free_License%29.jpg/1200px-Yandhi_Cover_Art_%28Free_License%29.jpg",
      ),
    ),
    // New audioSource
  ]);

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  _init() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    try {
      await _player.load(_playlist);
    } catch (e) {
      // catch load errors: 404, invalid url ...
      print("An error occured $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child:
                                Center(child: Image.network(metadata.artwork)),
                          ),
                        ),
                        Text(metadata.title ?? '',
                            style: TextStyle(
                                color: Color(0xffff0055),
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                        Text(metadata.album ?? '',
                            style: TextStyle(color: Colors.grey, fontSize: 18)),
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
                        Icon(Icons.repeat, color: Colors.grey),
                        Icon(Icons.repeat_one, color: Colors.grey),
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
                            ? Icon(Icons.shuffle, color: Colors.orange)
                            : Icon(Icons.shuffle, color: Colors.grey),
                        onPressed: () {
                          _player.setShuffleModeEnabled(!shuffleModeEnabled);
                        },
                      );
                    },
                  ),
                ],
              ),
              // Container(
              //   height: 240.0,
              //   child: StreamBuilder<SequenceState>(
              //     stream: _player.sequenceStateStream,
              //     builder: (context, snapshot) {
              //       final state = snapshot.data;
              //       final sequence = state?.sequence ?? [];
              //       return ListView.builder(
              //         itemCount: sequence.length,
              //         itemBuilder: (context, index) => Material(
              //           color: index == state.currentIndex
              //               ? Colors.grey.shade300
              //               : null,
              //           child: ListTile(
              //             title: Text(sequence[index].tag.title),
              //             onTap: () {
              //               _player.seek(Duration.zero, index: index);
              //             },
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
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
                width: 64.0,
                height: 64.0,
                child: CircularProgressIndicator(),
              );
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
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("$_remaining")
                      ?.group(1) ??
                  '$_remaining',
              style: Theme.of(context).textTheme.caption),
        ),
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
