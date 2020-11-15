import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Text(
                "About Us",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 47.5,
                    letterSpacing: 1.2),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                "we made this, bitch.",
                style: TextStyle(
                    color: Colors.blueGrey[200],
                    fontSize: 17.5,
                    letterSpacing: 0.5),
              )),
          Container(
              height: 175,
              width: 375,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[900],
                borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 47,
                          backgroundColor: Colors.grey[500],
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage('assets/Appu.png'),
                          ),
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 250,
                              alignment: Alignment.center,
                              child: Text(
                                "Apoorva Nautiyal",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5,
                                    letterSpacing: 1),
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text("also known as Lao Anfu",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12.5,
                                  ))),
                        ])
                  ])),
          Container(
              height: 175,
              width: 375,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[900],
                borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 47,
                          backgroundColor: Colors.grey[500],
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage('assets/slattkhar.jpg'),
                          ),
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 250,
                              alignment: Alignment.center,
                              child: Text(
                                "Prakhar Bhasin",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5,
                                    letterSpacing: 1),
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text("also known as slattkhar",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12.5,
                                  ))),
                        ])
                  ])),
          Container(
              height: 175,
              width: 375,
              margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[900],
                borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 47,
                          backgroundColor: Colors.grey[500],
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                'https://avatars0.githubusercontent.com/u/42700919?s=400&v=4'),
                          ),
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 250,
                              alignment: Alignment.center,
                              child: Text(
                                "Kirtik Singh",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5,
                                    letterSpacing: 1),
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text("also known as k2boi",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12.5,
                                  ))),
                        ])
                  ])),
        ]));
  }
}