// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//importing packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:palette_generator/palette_generator.dart';
//import 'package:just_audio/just_audio.dart';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;

//importing files
import 'screens/NowplayingMain.dart';
import 'screens/homeScreen.dart';
import 'screens/albumScreen.dart';
import 'screens/artistScreen.dart';
import 'screens/recomScreen.dart';

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

  final tabs = [HomeScreen(), AlbumScreen(), ArtistScreen(), RecomScreen()];

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Player()),
          );
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
