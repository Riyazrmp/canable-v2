import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeasurementInfoBottom extends StatefulWidget {
  final DocumentSnapshot snapshot;
  MeasurementInfoBottom({
    this.snapshot,
  });
  @override
  _MeasurementInfoBottomState createState() => _MeasurementInfoBottomState();
}

class _MeasurementInfoBottomState extends State<MeasurementInfoBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Text(
          'My Orders',
          style: TextStyle(
              fontFamily: 'CodePro', fontWeight: FontWeight.w800, fontSize: 24),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                  Text(
                    'Info',
                    style: TextStyle(
                        fontFamily: 'CodeProlight',
                        fontWeight: FontWeight.w800,
                        fontSize: 24),
                  ),
                  CupertinoButton(
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontFamily: 'CodePro',
                            fontWeight: FontWeight.w800,
                            fontSize: 22),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Divider(
                  height: 5,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 150,
                        child: Image.network(
                          widget.snapshot['image'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Column(
                  //           children: [
                  //             Container(
                  //               padding: EdgeInsets.only(
                  //                 top: widget.snapshot
                  //                     ['sleeveTopPadding']
                  //                     .toDouble(),
                  //               ),
                  //               height: 50,
                  //               child: Image.network(
                  //                 widget.sleeveFlippedImage,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             Container(
                  //               height: widget.snapshot
                  //                   ['neckHeight']
                  //                   .toDouble(),
                  //               child: Image.network(
                  //                 widget.neckImage,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             Container(
                  //               padding: EdgeInsets.only(
                  //                 top: widget.snapshot
                  //                     ['sleeveTopPadding']
                  //                     .toDouble(),
                  //               ),
                  //               height: 50,
                  //               child: Image.network(
                  //                 widget.sleeveImage,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //     Container(
                  //       height:
                  //           widget.snapshot['damanHeight'].toDouble(),
                  //       child: Image.network(
                  //         widget.damanImage,
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   children: [
                  //     Container(
                  //       height: 100,
                  //       child: Image.network(
                  //         widget.bottomImage,
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Divider(
                  height: 5,
                ),
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Information',
                      style: TextStyle(
                          fontFamily: 'CodeProlight',
                          fontWeight: FontWeight.w800,
                          fontSize: 28),
                    ),
                  )),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Id',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot.id,
                              style: TextStyle(
                                  fontFamily: 'CodeProlight', fontSize: 22)),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Bottom Length',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['bottomLength'],
                              style: TextStyle(
                                  fontFamily: 'CodeProlight', fontSize: 22)),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Kamar',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['kamar'],
                              style: TextStyle(
                                  fontFamily: 'CodeProlight', fontSize: 22)),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Thigh',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['thigh'],
                              style: TextStyle(
                                  fontFamily: 'CodeProlight', fontSize: 22)),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Mori',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['mori'],
                              style: TextStyle(
                                  fontFamily: 'CodeProlight', fontSize: 22)),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Type',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['Type'].toString(),
                              style: TextStyle(
                                  fontFamily: 'CodeProlight', fontSize: 22)),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // Center(
              //   child: Align(
              //     alignment: Alignment.center,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 8.0, right: 9),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             'Booked on: ',
              //             style: TextStyle(
              //               fontFamily: 'CodeProlight',
              //               fontWeight: FontWeight.bold,
              //               fontSize: ScreenUtil().setSp(kSpacingUnit * 2.1),
              //             ),
              //           ),
              //           Text(
              //             widget.snapshot
              //                     ['timeStamp']
              //                     .toDate()
              //                     .day
              //                     .toString() +
              //                 '-' +
              //                 widget.snapshot
              //                     ['timeStamp']
              //                     .toDate()
              //                     .month
              //                     .toString() +
              //                 '-' +
              //                 widget.snapshot
              //                     ['timeStamp']
              //                     .toDate()
              //                     .year
              //                     .toString(),
              //             style: TextStyle(
              //               fontFamily: 'CodeProlight',
              //               fontSize: ScreenUtil().setSp(kSpacingUnit * 2.1),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
