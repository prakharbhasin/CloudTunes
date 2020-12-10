import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/main.dart';
import 'package:myapp/metadata.dart';

final artistList = [
  "Alan Walker",
  "Green Day",
  "Jon Bellion",
  "Lukas Graham",
  "Maroon 5",
  "Marshmello",
  "Martin Garrix"
];
final artistImageList = [
  "https://lastfm.freetls.fastly.net/i/u/770x0/3fbb4a220ea9e8e04efc174e0f7e77c6.webp#3fbb4a220ea9e8e04efc174e0f7e77c6",
  "https://lastfm.freetls.fastly.net/i/u/770x0/63a2f9bdd8fc389123b8b8db8a95cc6d.webp#63a2f9bdd8fc389123b8b8db8a95cc6d",
  "https://lastfm.freetls.fastly.net/i/u/770x0/40e133c5f7a49d34cd3bc786d0eb0937.webp#40e133c5f7a49d34cd3bc786d0eb0937",
  "https://lastfm.freetls.fastly.net/i/u/770x0/a96e2620f0b01f34cc5c2893545aeb6a.webp#a96e2620f0b01f34cc5c2893545aeb6a",
  "https://lastfm.freetls.fastly.net/i/u/770x0/0d5eb4f51e0189e5b58c2a35517ef68e.webp#0d5eb4f51e0189e5b58c2a35517ef68e",
  "https://lastfm.freetls.fastly.net/i/u/770x0/a89459d5fcd3a73f367708c194c285f4.webp#a89459d5fcd3a73f367708c194c285f4",
  "https://lastfm.freetls.fastly.net/i/u/770x0/5cd16868a1e01103fcc98afb52ffb9e8.webp#5cd16868a1e01103fcc98afb52ffb9e8",
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ArtistScreen(),
    title: "Artists",
  ));
}

class ArtistScreen extends StatefulWidget {
  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  double sliderValue = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(artistList.length, (index) {
              return Container(
                  height: 175,
                  width: 175,
                  margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
                  decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(24.0)),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(artistImageList[index]),
                          fit: BoxFit.cover)),
                  child: ClipRRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.black.withOpacity(0.6),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: CircleAvatar(
                                            radius: 51.5,
                                            backgroundColor: Colors.grey[500],
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  artistImageList[index]),
                                            ),
                                          )),
                                      Container(
                                          width: 125,
                                          alignment: Alignment.center,
                                          child: Text(
                                            artistList[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          ))
                                    ]),
                              )))));
            })));
  }
}
