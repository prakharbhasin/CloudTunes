import 'package:flutter/material.dart';

final artistList = [
  "Travis Scott",
  "Ritviz",
  "Nas",
  "Kanye West",
  "Alan Walker",
  "The Weeknd",
  "The Weeknd"
];

final albumList = [
  "HITR",
  "Ved",
  "King's Disease",
  "MBDTF",
  "Faded",
  "After Hours",
  "After Hours"
];
final coverList = [
  'https://upload.wikimedia.org/wikipedia/en/thumb/b/b4/Travis_Scott_-_Highest_in_the_Room.png/330px-Travis_Scott_-_Highest_in_the_Room.png',
  'https://i.pinimg.com/originals/46/dd/39/46dd39b3e2c62b4e379ed6155449be28.jpg',
  'https://upload.wikimedia.org/wikipedia/en/1/1e/King%27s_Disease_by_Nas.jpg',
  'https://upload.wikimedia.org/wikipedia/en/b/be/MBDTF_ALT.jpg',
  'https://upload.wikimedia.org/wikipedia/en/d/da/Alan_Walker_-_Faded.png',
  'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png',
  'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png',
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Albums",
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
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        backgroundColor: Colors.black,
        body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            childAspectRatio: (itemWidth / itemHeight),
            // Generate 100 widgets that display their index in the List.
            children: List.generate(artistList.length, (index) {
              return Container(
                  height: 175,
                  width: 145,
                  // margin: EdgeInsets.fromLTRB(1, 5, 0, 1),
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(22.0)),
                    shape: BoxShape.rectangle,
                    color: Colors.grey[900],
                  ),
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Container(
                        height: 155,
                        width: 155,
                        decoration: BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(22.0)),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(coverList[index]),
                                fit: BoxFit.fitWidth)),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            albumList[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.5,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text(artistList[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )))
                    ]),
                  ));
            })));
  }
}
