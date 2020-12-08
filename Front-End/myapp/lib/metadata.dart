import 'package:scrobblenaut/scrobblenaut.dart';

const API_KEY = "46919549c0aafc3f83332705193df0af";

void main() async {
  var lastFM = await LastFM.noAuth(
    apiKey: API_KEY,
  );

  var scrobblenaut = Scrobblenaut(lastFM: lastFM);

  final trackGetInfo = (await scrobblenaut.track.getInfo(
    track: 'faded',
    artist: 'alan walker',
    username: 'nebulino',
    autoCorrect: true,
  ));

  print('Track Name: ${trackGetInfo.name} |'
      ' Track Artist: ${trackGetInfo.artist.name}');
  print(trackGetInfo.album.images); // Gets all images of diff sizes from 0 to 3
  print(trackGetInfo.album.images[3].text); // Gets the largest image ki URL
  // print(trackGetInfo.album.images);
}
