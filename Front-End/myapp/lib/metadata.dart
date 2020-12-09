import 'package:scrobblenaut/scrobblenaut.dart';
import 'main.dart';

const API_KEY = "46919549c0aafc3f83332705193df0af";

fetchMetadata(List<Map<String, dynamic>> dataList) async {
  var lastFM = await LastFM.noAuth(
    apiKey: API_KEY,
  );

  // print(dataList[0]);
  // print(dataList[0]['trackName']);

  var scrobblenaut = Scrobblenaut(lastFM: lastFM);
  var artistImagesList = [];
  // print(dataList.length);

  for (int i = 0; i < dataList.length; i++) {
    var trackGetInfo = (await scrobblenaut.track.getInfo(
      track: dataList[i]['trackName'],
      artist: dataList[i]['artistName'],
      username: 'nebulino',
      autoCorrect: true,
    ));
    dataList[i]['trackName'] = trackGetInfo.name;
    dataList[i]['artistName'] = trackGetInfo.artist.name;
    dataList[i]['albumName'] = trackGetInfo.album.title;
    dataList[i]['albumArtLink'] = trackGetInfo.album.images[2].text;

    var artistGetinfo =
        (await scrobblenaut.artist.getInfo(artist: trackGetInfo.artist.name));
    dataList[i]['artistImageLink'] = artistGetinfo.images[2].text;
  }

  // print('Track Name: ${trackGetInfo.name} |'
  //     ' Track Artist: ${trackGetInfo.artist.name}');

  // print(trackGetInfo.album.title); // Get album name
  // print(trackGetInfo.album.images); // Gets all images of diff sizes from 0 to 3
  // print(trackGetInfo.album.images[3].text); // Gets the largest image ki URL
  // print(trackGetInfo.album.images);
}
