import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/en/thumb/b/b4/Travis_Scott_-_Highest_in_the_Room.png/330px-Travis_Scott_-_Highest_in_the_Room.png'),
                          width: 75,
                          height: 75)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HIGHEST IN THE ROOM",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.5,
                              letterSpacing: 1),
                        ),
                        Text(
                          "Travis Scott",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.5,
                          ),
                        ),
                      ])
                ])),
        Container(
            height: 85,
            width: 375,
            margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[900],
              borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                          image: NetworkImage(
                              'https://i.pinimg.com/originals/46/dd/39/46dd39b3e2c62b4e379ed6155449be28.jpg'),
                          width: 75,
                          height: 75)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 250,
                            child: Text(
                              "Chalo Chalein (feat. Seedhe Maut)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.5,
                                  letterSpacing: 1),
                            )),
                        Text(
                          "Ritviz",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.5,
                          ),
                        ),
                      ])
                ])),
        Container(
            height: 85,
            width: 375,
            margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[900],
              borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/en/1/1e/King%27s_Disease_by_Nas.jpg'),
                          width: 75,
                          height: 75)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 250,
                            child: Text(
                              "Car #85 (feat. Charlie Wilson)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.5,
                                  letterSpacing: 1),
                            )),
                        Text(
                          "Nas",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.5,
                          ),
                        ),
                      ])
                ])),
        Container(
            height: 85,
            width: 375,
            margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[900],
              borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/en/b/be/MBDTF_ALT.jpg'),
                          width: 75,
                          height: 75)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 250,
                            child: Text(
                              "Devil In A New Dress (feat. Rick Ross)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.5,
                                  letterSpacing: 1),
                            )),
                        Text(
                          "Kanye West",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.5,
                          ),
                        ),
                      ])
                ])),
        Container(
            height: 85,
            width: 375,
            margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[900],
              borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/en/d/da/Alan_Walker_-_Faded.png'),
                          width: 75,
                          height: 75)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 250,
                            child: Text(
                              "Faded",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.5,
                                  letterSpacing: 1),
                            )),
                        Text(
                          "Alan Walker",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.5,
                          ),
                        ),
                      ])
                ])),
        Container(
            height: 85,
            width: 375,
            margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[900],
              borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png'),
                          width: 75,
                          height: 75)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 250,
                            child: Text(
                              "After Hours",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.5,
                                  letterSpacing: 1),
                            )),
                        Text(
                          "The Weeknd",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.5,
                          ),
                        ),
                      ])
                ])),
      ]),
    );
  }
}
