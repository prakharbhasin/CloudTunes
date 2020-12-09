// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myapp/metadata.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'dart:async';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http/io_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:loading_animations/loading_animations.dart';

//importing files
import 'metadata.dart';
import 'screens/NowplayingMain.dart';
import 'screens/homeScreen.dart';
import 'screens/albumScreen.dart';
import 'screens/artistScreen.dart';
import 'screens/recomScreen.dart';
import 'screens/aboutScreen.dart';

List<Map<String, dynamic>> dataList = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class GoogleHttpClient extends IOClient {
  Map<String, String> _headers;

  GoogleHttpClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(http.BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<http.Response> head(Object url, {Map<String, String> headers}) =>
      super.head(url, headers: headers..addAll(_headers));
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  var showElem = false;
  var showButton = false;

  // List of all data obtained from the google drive
  final storage = new FlutterSecureStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: ['https://www.googleapis.com/auth/drive.appdata']);
  GoogleSignInAccount googleSignInAccount;
  ga.FileList list;
  var signedIn = false;

  Future<void> _loginWithGoogle() async {
    print("Hello 1"); // PRINT TEST 1
    signedIn = await storage.read(key: "signedIn") == "true" ? true : false;
    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount googleSignInAccount) async {
      if (googleSignInAccount != null) {
        _afterGoogleLogin(googleSignInAccount);
      }
    });
    print("Hello 2"); // PRINT TEST 2
    if (signedIn) {
      try {
        googleSignIn.signInSilently().whenComplete(() => () {});
      } catch (e) {
        storage.write(key: "signedIn", value: "false").then((value) {
          setState(() {
            signedIn = false;
          });
        });
      }
    } else {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      _afterGoogleLogin(googleSignInAccount);
    }
  }

  Future<void> _afterGoogleLogin(GoogleSignInAccount gSA) async {
    print("After Google Login Init."); // PRINT TEST 3
    googleSignInAccount = gSA;
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    storage.write(key: "signedIn", value: "true").then((value) {
      setState(() {
        signedIn = true;
      });
    });
    _listGoogleDriveFiles();
  }

  Future<void> _listGoogleDriveFiles() async {
    // print("LINE 1");
    var client = GoogleHttpClient(await googleSignInAccount.authHeaders);
    var drive = ga.DriveApi(client);
    // print("LINE 2, drive:");
    // print(drive);
    drive.files
        .list(
            q: 'mimeType ="audio/mpeg"',
            $fields:
                "nextPageToken, files(id, name, webViewLink, webContentLink)")
        .then((value) {
      setState(() {
        list = value;
      });

      // // Gets all the file data Required for most purposes
      // for (var i = 0; i < list.files.length; i++) {
      //   print("Id: ${list.files[i].id} File Name:${list.files[i].name}");
      // }

      // Listing out everything to crosscheck
      // print(list.files[5].id);
      // print(list.files[5].name);
      // print(list.files[5].webViewLink); // For playing the file online.
      // print(list.files[5].webContentLink); // For downloading the file

      // For the Last fm API calls:
      // var tokenizerOutput = list.files[5].name.split("-");
      // String songName = tokenizerOutput[0];
      // String artistName = tokenizerOutput[1].split(".m")[0];
      // print(
      //     "The song is called $songName and the Artist for it is $artistName");

      // LIST CODE STARTS -------------------------------------------
      var myObject = null;
      // print(list.files.length);
      // Gets all the file data Required for most purposes
      for (var i = 0; i < list.files.length; i++) {
        var tokenizerOutput = list.files[i].name.split("-");
        String trackName = tokenizerOutput[0];
        String artistName = tokenizerOutput[1].split(".m")[0];
        String webContentLink = list.files[i].webContentLink;
        myObject = {
          'trackName': trackName,
          'artistName': artistName,
          'albumName': '',
          'webContentLink': webContentLink,
          'albumArtLink': '',
          'artistImageLink': ''
        };
        dataList.add(myObject);
      }
      fetchMetadata(dataList);
      print(dataList);
      // LIST CODE ENDS -------------------------------------------
    });
  }

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
                      color: Color(0xffff0055),
                      onPressed: () {
                        _loginWithGoogle();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Songs()),
                        // );
                      },
                      textColor: Colors.white,
                      splashColor: Colors.pink[400],
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Text("Sign in with Google",
                          style: TextStyle(fontSize: 15)),
                    ))),
            // LoadingFlipping.circle(
            //   borderColor: Colors.pink,
            //   size: 30.0,
            //   duration: Duration(milliseconds: 500),
            // ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: ButtonTheme(
                    minWidth: 220,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xffff0055),
                      onPressed: () {
                        // _listGoogleDriveFiles().then((value) {
                        Timer(Duration(seconds: 0), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Songs()),
                          );
                        });

                        // });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Songs()),
                        // );
                      },
                      textColor: Colors.white,
                      splashColor: Colors.pink[400],
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Text("Show files with Google",
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
    //_getImagePalette();
  }

  // _getImagePalette() async {
  //   colors = [];
  //   for (String album in albums) {
  //     final PaletteGenerator paletteGenerator =
  //         await PaletteGenerator.fromImageProvider(NetworkImage(album));
  //     colors.add(paletteGenerator.dominantColor);
  //   }
  //   setState(() {});
  // }

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
            MaterialPageRoute(builder: (context) => newPlayer()),
          );
          // Add your onPressed code here!
        },
        child: Icon(Icons.music_note),
        backgroundColor: Color(0xffff0055),
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
        backgroundColor: Color(0xffff0055),
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
