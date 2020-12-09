import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/metadata.dart';

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
                                    dataList[index]['recomImageLink']),
                                width: 75,
                                height: 75)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                dataList[index]['recomTrack'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5,
                                    letterSpacing: 1),
                              ),
                              Text(
                                dataList[index]['recomArtist'],
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
