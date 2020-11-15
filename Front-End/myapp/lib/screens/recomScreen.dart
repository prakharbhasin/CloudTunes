import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecomScreen(),
  ));
}

class RecomScreen extends StatefulWidget {
  @override
  _RecomScreenState createState() => _RecomScreenState();
}

class _RecomScreenState extends State<RecomScreen> {
  double sliderValue = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: <Widget>[
          Container(
              height: 85,
              width: 375,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[900],
                borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "HIGHEST IN THE ROOM",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.5,
                              letterSpacing: 1),
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "Travis Scott",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.5,
                          ),
                        )),
                  ])),
        ]));
  }
}
