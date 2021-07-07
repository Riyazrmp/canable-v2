import 'package:canable_user/Screens/imageView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MeasurementDimensionsBottom.dart';
import 'MeasurementDimensionsTop.dart';

class OrderInfoSS extends StatefulWidget {
  final String sleeveImage;
  final String sleeveFlippedImage;
  final String neckImage;
  final String damanImage;
  final String bottomImage;
  final List<dynamic> notes;

  final DocumentSnapshot snapshot;
  OrderInfoSS(
      {this.damanImage,
      this.notes,
      this.neckImage,
      this.bottomImage,
      this.snapshot,
      this.sleeveFlippedImage,
      this.sleeveImage});
  @override
  _OrderInfoSSState createState() => _OrderInfoSSState();
}

class _OrderInfoSSState extends State<OrderInfoSS> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                        color: Colors.black,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return ImageView(
                              image: widget.snapshot['fabricImage'],
                            );
                          }));
                        },
                        child: Container(
                          height: 150,
                          child: Image.network(
                            widget.snapshot['fabricImage'],
                            fit: BoxFit.fill,
                          ),
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
              widget.snapshot['isMeasurementSelected'] == true
                  ? CupertinoButton(
                      child: Text(
                        'View Top Measurement',
                        style: TextStyle(fontFamily: 'CodePro'),
                      ),
                      onPressed: () async {
                        DocumentSnapshot docTop = await firestore
                            .collection("measurements")
                            .doc(widget.snapshot['userId'])
                            .collection('top')
                            .doc(widget.snapshot['measurementTopDocId'])
                            .get();
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return MeasurementInfoTop(
                            snapshot: docTop,
                          );
                        }));
                      })
                  : Container(),
              widget.snapshot['isMeasurementSelected'] == true
                  ? CupertinoButton(
                      child: Text(
                        'View Bottom Measurement',
                        style: TextStyle(fontFamily: 'CodePro'),
                      ),
                      onPressed: () async {
                        DocumentSnapshot docBottom = await firestore
                            .collection("measurements")
                            .doc(widget.snapshot['userId'])
                            .collection('bottom')
                            .doc(widget.snapshot
                                ['measurementBottomDocId'])
                            .get();
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return MeasurementInfoBottom(
                            snapshot: docBottom,
                          );
                        }));
                      })
                  : Container(),
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
                          color: Colors.black,
                          fontSize: 28),
                    ),
                  )),
              SizedBox(height: 20),
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
                                  color: Colors.black,
                                  fontSize: 22)),
                          Text(widget.snapshot['typeDisplay'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('OrderId',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['orderId'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('topAstar',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['topAstar'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('bottomAstar',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['bottomAstar'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('neckPatch',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(
                              widget.snapshot
                                  ['neckPatchBool']
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('damanPatch',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(
                              widget.snapshot
                                  ['damanPatchBool']
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('sleevesPatch',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(
                              widget.snapshot
                                  ['sleevesPatchBool']
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('bottomPatch',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(
                              widget.snapshot
                                  ['bottomPatchBool']
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('Neck',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['neckName'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('Sleeve\'s Astar',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['sleevesAstar'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('Daman',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['damanName'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('sleevesLength',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['sleevesLengthName'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('Sleeves',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['sleevesName'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('Bottom',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['bottomName'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('Plan',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['plan'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('coupon',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.snapshot['coupon'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
                          Text('Price',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 22)),
                          Text(widget.snapshot['price'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'CodeProlight',
                                  fontSize: 22)),
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, bottom: 10),
                      child: Container(
                        padding: EdgeInsets.all(2),
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: widget.notes[index]['image'] != 'null'
                                    ? () {
                                        Navigator.push(context,
                                            CupertinoPageRoute(
                                                builder: (context) {
                                          return ImageView(
                                            image: widget.notes[index]['image'],
                                          );
                                        }));
                                      }
                                    : () {},
                                child: Container(
                                  child: widget.notes[index]['image'] != 'null'
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          child: Image.network(
                                            widget.notes[index]['image'],
                                            frameBuilder: (context, child,
                                                frame, wasSynchronouslyLoaded) {
                                              if (wasSynchronouslyLoaded) {
                                                return child;
                                              } else {
                                                return AnimatedSwitcher(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  child: frame != null
                                                      ? child
                                                      : Container(
                                                          height: 80,
                                                          child: Center(
                                                              child:
                                                                  CupertinoActivityIndicator())),
                                                );
                                              }
                                            },
                                          ))
                                      : Container(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(widget.notes[index]['note'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'CodeProlight',
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontSize: 15)),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Booked on: ',
                          style: TextStyle(
                            fontFamily: 'CodeProlight',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.snapshot
                                  ['timeStamp']
                                  .toDate()
                                  .day
                                  .toString() +
                              '-' +
                              widget.snapshot
                                  ['timeStamp']
                                  .toDate()
                                  .month
                                  .toString() +
                              '-' +
                              widget.snapshot
                                  ['timeStamp']
                                  .toDate()
                                  .year
                                  .toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'CodeProlight',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
