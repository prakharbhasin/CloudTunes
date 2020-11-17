import 'package:scrobblenaut/scrobblenaut.dart';

const API_KEY = "46919549c0aafc3f83332705193df0af";

void main() async {
  var lastFM = await LastFM.noAuth(
    apiKey: API_KEY,
  );

  var scrobblenaut = Scrobblenaut(lastFM: lastFM);

  final albumGetInfo = (await scrobblenaut.album.getInfo(
    album: 'astroworld',
    artist: 'travis scott',
    username: 'nebulino',
    autoCorrect: true,
  ));

  print('Album Name: ${albumGetInfo.name} |'
      ' Album Artist: ${albumGetInfo.artist.name}');
}
