import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/metadata.dart';

final coverList = [
  'https://upload.wikimedia.org/wikipedia/en/thumb/b/b4/Travis_Scott_-_Highest_in_the_Room.png/330px-Travis_Scott_-_Highest_in_the_Room.png',
  'https://i.pinimg.com/originals/46/dd/39/46dd39b3e2c62b4e379ed6155449be28.jpg',
  'https://upload.wikimedia.org/wikipedia/en/1/1e/King%27s_Disease_by_Nas.jpg',
  'https://upload.wikimedia.org/wikipedia/en/b/be/MBDTF_ALT.jpg',
  'https://upload.wikimedia.org/wikipedia/en/d/da/Alan_Walker_-_Faded.png',
  'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png',
  'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png',
];
final songList = [
  "HIGHEST IN THE ROOM",
  "Chalo Chalein",
  "Car#85",
  "Devil In a New Dress",
  "Faded",
  "After Hours",
  "After Hours"
];
final artistList = [
  "Travis Scott",
  "Ritviz",
  "Nas",
  "Kanye West",
  "Alan Walker",
  "The Weeknd",
  "The Weeknd"
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    title: "Songs",
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
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: dataList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 85,
                  width: 375,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 12.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey[900],
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(12.0)),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Image(
                                image: NetworkImage(
                                    dataList[index]['albumArtLink']),
                                width: 75,
                                height: 75)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                dataList[index]['trackName'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5,
                                    letterSpacing: 1),
                              ),
                              Text(
                                dataList[index]['artistName'],
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12.5,
                                ),
                              ),
                            ])
                      ]));
            }));
  }
}
