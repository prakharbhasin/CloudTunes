import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AlbumScreen(),
  ));
}

class AlbumScreen extends StatefulWidget {
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  double sliderValue = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: <Widget>[
        Row(children: <Widget>[
          Container(
              height: 205,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                shape: BoxShape.rectangle,
                color: Colors.redAccent[400],
              ),
              child: Column(children: <Widget>[
                Container(
                  height: 160,
                  width: 175,
                  decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(24.0)),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://lastfm.freetls.fastly.net/i/u/770x0/dfd01019404313399f77999285f78aa9.webp#dfd01019404313399f77999285f78aa9"),
                          fit: BoxFit.fitWidth)),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: 160,
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Text(
                                "Starboy",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.5,
                                ),
                              ))),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text("The Weeknd",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ))),
                    ])
              ])),
          Container(
              height: 205,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                shape: BoxShape.rectangle,
                color: Colors.blueAccent[100],
              ),
              child: Column(children: <Widget>[
                Container(
                  height: 160,
                  width: 175,
                  decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(24.0)),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://lastfm.freetls.fastly.net/i/u/770x0/0fa89808a82367bed2ea11e16868c50b.webp#0fa89808a82367bed2ea11e16868c50b"),
                          fit: BoxFit.fitWidth)),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: 160,
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Text(
                                "Astroworld",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.5,
                                ),
                              ))),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text("Travis Scott",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ))),
                    ])
              ])),
        ]),
        Row(children: <Widget>[
          Container(
              height: 205,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                shape: BoxShape.rectangle,
                color: Colors.green[900],
              ),
              child: Column(children: <Widget>[
                Container(
                  height: 160,
                  width: 175,
                  decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(24.0)),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://lastfm.freetls.fastly.net/i/u/770x0/03ce096b2ac8b6625bb5a08333e4c2fd.webp#03ce096b2ac8b6625bb5a08333e4c2fd"),
                          fit: BoxFit.fitWidth)),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: 160,
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Text(
                                "ZUU",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.5,
                                ),
                              ))),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text("Denzel Curry",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ))),
                    ])
              ])),
          Container(
              height: 205,
              width: 175,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(24.0)),
                shape: BoxShape.rectangle,
                color: Colors.yellow[900],
              ),
              child: Column(children: <Widget>[
                Container(
                  height: 160,
                  width: 175,
                  decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(24.0)),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://lastfm.freetls.fastly.net/i/u/770x0/52a7f32bdc99238080b0f17e859b3b4d.webp#52a7f32bdc99238080b0f17e859b3b4d"),
                          fit: BoxFit.fitWidth)),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: 160,
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Text(
                                "Flower Boy",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.5,
                                ),
                              ))),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text("Tyler, the Creator",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ))),
                    ])
              ])),
        ]),
      ]),
    );
  }
}
