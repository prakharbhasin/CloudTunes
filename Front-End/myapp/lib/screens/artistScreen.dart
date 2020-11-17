import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

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
      body: Column(children: <Widget>[
        Row(children: <Widget>[
          Container(
              height: 175,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://lastfm.freetls.fastly.net/i/u/770x0/2fb9deb1b31042fa291f1997389d93ea.webp#2fb9deb1b31042fa291f1997389d93ea'),
                      fit: BoxFit.cover)),
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.6),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              'https://lastfm.freetls.fastly.net/i/u/770x0/2fb9deb1b31042fa291f1997389d93ea.webp#2fb9deb1b31042fa291f1997389d93ea'),
                                        ),
                                      )),
                                  Container(
                                      width: 125,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Travis Scott",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            letterSpacing: 1),
                                      ))
                                ]),
                          ))))),
          Container(
              height: 175,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://lastfm.freetls.fastly.net/i/u/770x0/d4a00a9d9d5bcf16b8bb5e3ea4169181.webp#d4a00a9d9d5bcf16b8bb5e3ea4169181'),
                      fit: BoxFit.cover)),
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                            'https://lastfm.freetls.fastly.net/i/u/770x0/d4a00a9d9d5bcf16b8bb5e3ea4169181.webp#d4a00a9d9d5bcf16b8bb5e3ea4169181'),
                                      ),
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: 130,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "The Weeknd",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          )),
                                    ])
                              ])))))
        ]),
        Row(children: <Widget>[
          Container(
              height: 175,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://lastfm.freetls.fastly.net/i/u/770x0/50028f4627cb9f0d6ec60434646b2bb8.webp#50028f4627cb9f0d6ec60434646b2bb8"),
                      fit: BoxFit.cover)),
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                            "https://lastfm.freetls.fastly.net/i/u/770x0/50028f4627cb9f0d6ec60434646b2bb8.webp#50028f4627cb9f0d6ec60434646b2bb8"),
                                      ),
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Frank Ocean",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          )),
                                    ])
                              ]))))),
          Container(
              height: 175,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://lastfm.freetls.fastly.net/i/u/770x0/437d3def4c0dedd076de8d3a5e31527b.webp#437d3def4c0dedd076de8d3a5e31527b"),
                      fit: BoxFit.cover)),
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                            "https://lastfm.freetls.fastly.net/i/u/770x0/437d3def4c0dedd076de8d3a5e31527b.webp#437d3def4c0dedd076de8d3a5e31527b"),
                                      ),
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Ritviz",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          )),
                                    ])
                              ])))))
        ]),
        Row(children: <Widget>[
          Container(
              height: 175,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://lastfm.freetls.fastly.net/i/u/770x0/3fbb4a220ea9e8e04efc174e0f7e77c6.webp#3fbb4a220ea9e8e04efc174e0f7e77c6"),
                      fit: BoxFit.cover)),
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                            "https://lastfm.freetls.fastly.net/i/u/770x0/3fbb4a220ea9e8e04efc174e0f7e77c6.webp#3fbb4a220ea9e8e04efc174e0f7e77c6"),
                                      ),
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Alan Walker",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          )),
                                    ])
                              ]))))),
          Container(
              height: 175,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://lastfm.freetls.fastly.net/i/u/770x0/c86b5eb66796245e7de90fb30f26f4eb.webp#c86b5eb66796245e7de90fb30f26f4eb"),
                      fit: BoxFit.cover)),
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                            "https://lastfm.freetls.fastly.net/i/u/770x0/c86b5eb66796245e7de90fb30f26f4eb.webp#c86b5eb66796245e7de90fb30f26f4eb"),
                                      ),
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "BTS",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          )),
                                    ])
                              ])))))
        ]),
      ]),
    );
  }
}
