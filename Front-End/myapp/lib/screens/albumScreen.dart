import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/metadata.dart';

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
            children: List.generate(dataList.length, (index) {
              return Container(
                  height: 165,
                  width: 155,
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
                        height: 175,
                        width: 165,
                        decoration: BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(22.0)),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    dataList[index]['albumArtLink']),
                                fit: BoxFit.fill)),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            dataList[index]['albumName'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.5,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text(dataList[index]['artistName'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )))
                    ]),
                  ));
            })));
  }
}
