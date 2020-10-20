// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// Future<String> signInWithGoogle() async {
//   await Firebase.initializeApp();

//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final UserCredential authResult =
//       await _auth.signInWithCredential(credential);
//   final User user = authResult.user;

//   if (user != null) {
//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);

//     final User currentUser = _auth.currentUser;
//     assert(user.uid == currentUser.uid);

//     print('signInWithGoogle succeeded: $user');

//     return '$user';
//   }

//   return null;
// }

// Future<void> signOutGoogle() async {
//   await googleSignIn.signOut();

//   print("User Signed Out");
// }
Future<void> _signInWithGoogle() async {
  final googleSignIn =
      signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.DriveScope]);
  final signIn.GoogleSignInAccount account = await googleSignIn.signIn();
  print("User account $account");
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(children: <Widget>[
            // Icon(
            //   Icons.audiotrack,
            //   color: Colors.deepPurple,
            //   size: 100.0,
            // ),
            Image(
              image: AssetImage('assets/Logo.png'),
              height: 175,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  "Welcome to CloudTunes.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 1.125),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                child: Text(
                  "Start Jamming with your Music, Now!",
                  style: TextStyle(
                      color: Colors.blueGrey[200],
                      fontSize: 15,
                      letterSpacing: 0.5),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: ButtonTheme(
                    minWidth: 220,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.deepPurple[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Songs()),
                        );
                        //_signInWithGoogle();
                      },
                      textColor: Colors.white,
                      splashColor: Colors.deepPurpleAccent[200],
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Text("Sign in with Google",
                          style: TextStyle(fontSize: 15)),
                    )))
          ]),
        ));
  }
}

class Songs extends StatefulWidget {
  @override
  _SongsState createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  @override
  int _currentIndex = 0;
  final List<String> albums = [
    "https://lastfm.freetls.fastly.net/i/u/770x0/0fa89808a82367bed2ea11e16868c50b.webp#0fa89808a82367bed2ea11e16868c50b",
    "https://lastfm.freetls.fastly.net/i/u/770x0/dfd01019404313399f77999285f78aa9.webp#dfd01019404313399f77999285f78aa9",
  ];
  List<PaletteColor> colors;

  @override
  void initState() {
    super.initState();
    _getImagePalette();
  }

  _getImagePalette() async {
    colors = [];
    for (String album in albums) {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(NetworkImage(album));
      colors.add(paletteGenerator.dominantColor);
    }
    setState(() {});
  }

  final tabs = [
    Column(children: <Widget>[
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
    //Songs Tab
    Column(children: <Widget>[
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
    Column(children: <Widget>[
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
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width: 125,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Travis Scott",
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
    Column(children: <Widget>[
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
    ])
  ];

  Widget build(BuildContext context) {
    void handleClick(String value) {
      switch (value) {
        case 'About Us':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUs()),
          );
          break;
        case 'Settings':
          break;
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, actions: <Widget>[
        PopupMenuButton<String>(
          color: Colors.black,
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'About Us', 'Settings'}.map((String choice) {
              return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: TextStyle(color: Colors.white),
                  ));
            }).toList();
          },
        ),
      ]),
      body: tabs[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.music_note),
        backgroundColor: Colors.deepPurple[700],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.music_note, size: 25, color: Colors.white),
          Icon(Icons.album, size: 25, color: Colors.white),
          Icon(Icons.face, size: 25, color: Colors.white),
          Icon(Icons.star, size: 25, color: Colors.white),
        ],
        color: Colors.grey[900],
        buttonBackgroundColor: Colors.grey[900],
        backgroundColor: Colors.deepPurple[700],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

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
