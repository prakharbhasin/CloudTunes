import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final nameList = ["Apoorva Nautiyal", "Prakhar Bhasin", "Kirtik Singh"];
final bioList = [
  "also known as Lao Anfu",
  "also known as slattkhar",
  "also known as ki2"
];
final imageList = [
  'assets/Appu.png',
  'assets/slattkhar.jpg',
  'assets/k2boi.jpg',
];

class AboutUs extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                      "Yeah, we made this.",
                      style: TextStyle(
                          color: Colors.blueGrey[200],
                          fontSize: 17.5,
                          letterSpacing: 0.5),
                    )),
                ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: nameList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      print(index);
                      print(nameList[index]);
                      return Container(
                          height: 175,
                          width: 375,
                          margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey[900],
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(12.0)),
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
                                        backgroundImage:
                                            AssetImage(imageList[index]),
                                      ),
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: 250,
                                          alignment: Alignment.center,
                                          child: Text(
                                            nameList[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.5,
                                                letterSpacing: 1),
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: Text(bioList[index],
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 12.5,
                                              ))),
                                    ])
                              ]));
                      // Container(
                      //     height: 175,
                      //     width: 375,
                      //     margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.rectangle,
                      //       color: Colors.grey[900],
                      //       borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
                      //     ),
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: <Widget>[
                      //           Padding(
                      //               padding: EdgeInsets.all(10),
                      //               child: CircleAvatar(
                      //                 radius: 47,
                      //                 backgroundColor: Colors.grey[500],
                      //                 child: CircleAvatar(
                      //                   radius: 45,
                      //                   backgroundImage: AssetImage('assets/slattkhar.jpg'),
                      //                 ),
                      //               )),
                      //           Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: <Widget>[
                      //                 Container(
                      //                     width: 250,
                      //                     alignment: Alignment.center,
                      //                     child: Text(
                      //                       "Prakhar Bhasin",
                      //                       style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold,
                      //                           fontSize: 17.5,
                      //                           letterSpacing: 1),
                      //                     )),
                      //                 Padding(
                      //                     padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      //                     child: Text("also known as slattkhar",
                      //                         style: TextStyle(
                      //                           color: Colors.grey[500],
                      //                           fontSize: 12.5,
                      //                         ))),
                      //               ])
                      //         ])),
                      // Container(
                      //     height: 175,
                      //     width: 375,
                      //     margin: EdgeInsets.fromLTRB(22.5, 0, 0, 12.5),
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.rectangle,
                      //       color: Colors.grey[900],
                      //       borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
                      //     ),
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: <Widget>[
                      //           Padding(
                      //               padding: EdgeInsets.all(10),
                      //               child: CircleAvatar(
                      //                 radius: 47,
                      //                 backgroundColor: Colors.grey[500],
                      //                 child: CircleAvatar(
                      //                   radius: 45,
                      //                   backgroundImage: NetworkImage(
                      //                       'https://avatars0.githubusercontent.com/u/42700919?s=400&v=4'),
                      //                 ),
                      //               )),
                      //           Column(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: <Widget>[
                      //                 Container(
                      //                     width: 250,
                      //                     alignment: Alignment.center,
                      //                     child: Text(
                      //                       "Kirtik Singh",
                      //                       style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold,
                      //                           fontSize: 17.5,
                      //                           letterSpacing: 1),
                      //                     )),
                      //                 Padding(
                      //                     padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      //                     child: Text("also known as k2boi",
                      //                         style: TextStyle(
                      //                           color: Colors.grey[500],
                      //                           fontSize: 12.5,
                      //                         ))),
                      //               ])
                      //         ])),
                    })
              ]),
        ));
  }
}
