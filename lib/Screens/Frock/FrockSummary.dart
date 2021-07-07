// import 'package:audio_wave/audio_wave.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:canable_user/Screens/Frock/FrockAddress.dart';
import 'package:canable_user/Screens/orderSuccess.dart';
import 'package:canable_user/Stitching/address_SS.dart';
import 'package:canable_user/extras/decorations.dart';
import 'package:canable_user/localization/demolocalization.dart';
import 'package:canable_user/localization/uiLang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:random_string/random_string.dart';

class FrockSummary extends StatefulWidget {
  final int sleevesPrice;
  final String sleevesAstar;
  final String measurementImageTopUrl;
  final String measurementImageBottomUrl;
  final int neckPrice;
  final int damanPrice;
  final int bottomPrice;
  final String neckN;
  final String measurementTopDocId;
  final String measurementBottomDocId;
  final bool neckPatchBool;
  final bool sleevesPatchBool;
  final bool damanPatchBool;
  final bool bottomPatchBool;
  final String sleevesLengthN;
  final String sleevesN;
  final String damanN;
  final String bottomN;
  final String deliveryDays;
  final String neckD;
  final String sleevesLengthD;
  final String flippedSleeveD;
  final int damanHeight;
  final int neckHeight;
  final int sleeveTopPadding;
  final bool isMeasurementSelected;
  final String sleevesD;
  final String damanD;
  final String bottomD;
  final String fabricImage;
  final List<Map> notesData;
  final bool topAstar;
  final bool bottomAstar;

  final String plan;
  final int price;
  FrockSummary(
      {this.neckN,
      this.bottomAstar,
      this.deliveryDays,
      this.isMeasurementSelected,
      this.neckPatchBool,
      this.sleevesPatchBool,
      this.measurementImageTopUrl,
      this.measurementImageBottomUrl,
      this.measurementBottomDocId,
      this.measurementTopDocId,
      this.damanPatchBool,
      this.bottomPatchBool,
      this.topAstar,
      this.fabricImage,
      this.notesData,
      this.bottomN,
      this.sleeveTopPadding,
      this.neckHeight,
      this.damanHeight,
      this.flippedSleeveD,
      this.sleevesAstar,
      this.sleevesLengthN,
      this.sleevesN,
      this.damanN,
      this.bottomPrice,
      this.plan,
      this.price,
      this.damanPrice,
      this.neckPrice,
      this.sleevesPrice,
      this.bottomD,
      this.damanD,
      this.neckD,
      this.sleevesD,
      this.sleevesLengthD});
  @override
  _FrockSummaryState createState() => _FrockSummaryState();
}

class _FrockSummaryState extends State<FrockSummary> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool isOfferLoading = false;
  var currentUser = auth.FirebaseAuth.instance.currentUser;
  String coupon = 'no';
  QuerySnapshot freeStitchingCoupons;
  int price;
  bool isCouponEntered = false;
  DocumentSnapshot couponSnapshot;
  DocumentSnapshot demoSnapshot;
  void initState() {
    price = widget.price;
    auth.User user = auth.FirebaseAuth.instance.currentUser;
    setState(() {
      currentUser = user;
    });

    freeStitchingData();
    // play();
    super.initState();
  }

  // play() async {
  //   player = await cache.play('summaryaudio.mp3');
  //   player.onPlayerCompletion.listen((val) {
  //     setState(() {
  //       isAssistant = false;
  //     });
  //   });

  //   // setState(() {
  //   //   isAssistant = false;
  //   // });
  // }

  // bool isAssistant = true;

  // AudioPlayer player = new AudioPlayer();
  // AudioCache cache = new AudioCache();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   player.stop();
  //   super.dispose();
  // }

  freeStitchingData() async {
    isOfferLoading = true;
    var result = await firestore
        .collection('referralStitching')
        .doc(currentUser.uid)
        .collection('coupons')
        .orderBy('timeStamp', descending: false)
        .get();

    setState(() {
      freeStitchingCoupons = result;
      isOfferLoading = false;
    });
  }

  orderPlacement() async {
    setState(() {
      isLoading = true;
    });
    var user = auth.FirebaseAuth.instance.currentUser;

    await firestore
        .collection('order_stitching')
        .doc(user.uid)
        .collection('orders_stitching')
        .doc()
        .set({
      'price': widget.price,
      'plan': widget.plan,
      'damanImage': widget.damanD,
      'damanPrice': widget.damanPrice,
      'neckImage': widget.neckD,
      'neckPrice': widget.neckPrice,
      'sleevesImage': widget.sleevesD,
      'sleevesPrice': widget.sleevesPrice,
      'sleevesLengthImage': widget.sleevesLengthD,
      'bottomImage': widget.bottomD,
      'bottomPrice': widget.bottomPrice,
      'userId': user.uid,
      'userDisplayName': user.displayName,
      'userEmail': user.email,
      'timeStamp': Timestamp.now()
    }).whenComplete(() => Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (BuildContext context) => OrderSuccess())));

    setState(() {
      isLoading = false;
    });
  }

  widgetSwitcher(context1) {
    switch (coupon) {
      case 'no':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 10, left: 9, right: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue.withOpacity(0.09),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                      color: Colors.lightGreen,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8),
                      child: Text(
                          DemoLocalizations.of(context1)
                              .getTranslatedValue("offers"),
                          style: TextStyle(
                              fontFamily: 'CodeProlight',
                              fontWeight: FontWeight.w800,
                              fontSize: 22)),
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Align(
                  alignment: getalignment(myLocale.languageCode),
                  child: Text(
                      DemoLocalizations.of(context1)
                          .getTranslatedValue("enter_discount"),
                      style: TextStyle(
                          fontFamily: 'CodeProlight',
                          fontWeight: FontWeight.w800,
                          fontSize: 18)),
                ),
                isCouponEntered == false
                    ? Row(
                        children: [
                          Container(
                              width: deviceWidth / 1.3,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    blurRadius: 4,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Please Enter your name';
                                  }

                                  return null;
                                },
                                controller: controller,
                                onFieldSubmitted: (value) async {
                                  if (value.trim().isNotEmpty) {
                                    setState(() {
                                      isCouponEntered = true;
                                    });
                                    var result = await firestore
                                        .collection('Coupons')
                                        .doc(value)
                                        .get();
                                    if (result.exists) {
                                      setState(() {
                                        coupon = 'discount';
                                        price -= result['price'];
                                        couponSnapshot = result;
                                      });
                                    } else {
                                      setState(() {
                                        isCouponEntered = false;
                                      });
                                      showCupertinoDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CupertinoAlertDialog(
                                              actions: [
                                                CupertinoButton(
                                                  child: Text(
                                                      DemoLocalizations.of(
                                                              context1)
                                                          .getTranslatedValue(
                                                              "ok"),
                                                      style: TextStyle(
                                                        fontFamily: 'CodePro',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  onPressed: () {
                                                    return Navigator.pop(
                                                        context);
                                                  },
                                                )
                                              ],
                                              title: Text(
                                                  DemoLocalizations.of(context1)
                                                      .getTranslatedValue(
                                                          "wrongCode"),
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'CodeProlight',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black)),
                                            );
                                          });
                                    }
                                  }
                                },
                                style: TextStyle(
                                    fontFamily: 'CodeProlight',
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      top: 0.0, left: 20, right: 20),
                                  hintText: DemoLocalizations.of(context1)
                                      .getTranslatedValue("enter_here"),
                                  hintStyle: TextStyle(
                                      color: Colors.black45,
                                      fontFamily: 'CodeProlight',
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Expanded(
                            child: FlatButton(
                                height: 40,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                onPressed: () async {
                                  if (controller.text.trim().isNotEmpty) {
                                    setState(() {
                                      isCouponEntered = true;
                                    });
                                    var result = await firestore
                                        .collection('Coupons')
                                        .doc(controller.text)
                                        .get();
                                    if (result.exists) {
                                      setState(() {
                                        coupon = 'discount';
                                        price -= result['price'];
                                        couponSnapshot = result;
                                      });
                                    } else {
                                      setState(() {
                                        isCouponEntered = false;
                                      });
                                      showCupertinoDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CupertinoAlertDialog(
                                              actions: [
                                                CupertinoButton(
                                                  child: Text(
                                                      DemoLocalizations.of(
                                                              context1)
                                                          .getTranslatedValue(
                                                              "ok"),
                                                      style: TextStyle(
                                                        fontFamily: 'CodePro',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  onPressed: () {
                                                    return Navigator.pop(
                                                        context);
                                                  },
                                                )
                                              ],
                                              title: Text(
                                                  DemoLocalizations.of(context1)
                                                      .getTranslatedValue(
                                                          "wrongCode"),
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'CodeProlight',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black)),
                                            );
                                          });
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Icon(
                                    getTextFieldArrow(myLocale.languageCode),
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                )),
                          ),
                        ],
                      )
                    : Container(
                        height: 48,
                      ),
                SizedBox(
                  height: 10,
                ),
                isOfferLoading == false
                    ? freeStitchingCoupons.docs.isNotEmpty
                        ? Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'You have a \u{20B9} ' +
                                            freeStitchingCoupons.docs[0]
                                                ['price']
                                                .toString() +
                                            ' off coupon available',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'CodeProlight',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 17)),
                                  ),
                                ),
                                FlatButton(
                                    height: 30,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      setState(() {
                                        price -= freeStitchingCoupons.docs[0]
                                            ['price'];
                                        coupon = 'free';
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: Text(
                                        DemoLocalizations.of(context1)
                                            .getTranslatedValue("applyNow"),
                                        style: TextStyle(
                                            fontFamily: 'CodePro',
                                            color: Colors.lightBlue,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        : Container()
                    : CupertinoActivityIndicator(),
              ],
            ),
          ),
        );

        break;

      case 'discount':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 10, left: 9, right: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue.withOpacity(0.09),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCouponEntered = false;

                        price = widget.price;
                        coupon = 'no';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Icon(
                            CupertinoIcons.xmark_circle,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Remove\nCoupon',
                          style: TextStyle(
                              fontFamily: 'CodeProlight',
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/freeImage.png',
                          height: 100,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          'You Just Availed a discount of \u{20B9} ' +
                              couponSnapshot['price'].toString() +
                              '!',
                          style: TextStyle(
                              fontFamily: 'CodeProlight',
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

        break;

      case 'free':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 10, left: 9, right: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue.withOpacity(0.09),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        price = widget.price;
                        coupon = 'no';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Icon(
                            CupertinoIcons.xmark_circle,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Remove\nCoupon',
                          style: TextStyle(
                              fontFamily: 'CodeProlight',
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/freeImage.png',
                          height: 100,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          'You Just Availed a discount of \u{20B9} ' +
                              freeStitchingCoupons.docs[0]
                                  ['price']
                                  .toString() +
                              ' !',
                          style: TextStyle(
                              fontFamily: 'CodeProlight',
                              fontWeight: FontWeight.w800,
                              fontSize: 18)),
                    ),
                    freeStitchingCoupons.docs[0]
                            ['senderName']
                            .toString()
                            .isNotEmpty
                        ? Align(
                            alignment: Alignment.center,
                            child: Text(
                                'Thanks ' +
                                    freeStitchingCoupons.docs[0]
                                        ['senderName'],
                                style: TextStyle(
                                    fontFamily: 'CodeProlight', fontSize: 15)),
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    }
  }

  getFabricPhoto(languageCode) {
    switch (languageCode) {
      case 'en':
        return 'assets/measurementCloth.png';

        break;
      case 'hi':
        return 'assets/measurementCloth1.png';

        break;
      case 'ur':
        return 'assets/measurementCloth2.png';
        break;
      default:
        'assets/measurementCloth.png';
    }
  }

  TextEditingController controller = new TextEditingController();

  double deviceHeight;
  double deviceWidth;
  Locale myLocale;
  @override
  Widget build(BuildContext context) {
    myLocale = Localizations.localeOf(context);

    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        trailing: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: CupertinoButton(
            padding: EdgeInsets.all(0),
            child: Text(
              DemoLocalizations.of(context).getTranslatedValue("next"),
              style: TextStyle(
                  fontFamily: 'CodePro',
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            onPressed: () {
              // player.stop();
              // setState(() {
              //   isAssistant = false;
              // });

              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return FrockAddress(
                  bottomPrice: widget.bottomPrice,
                  sleevesAstar: widget.sleevesAstar,
                  isMeasurementSelected: widget.isMeasurementSelected,
                  measurementBottomDocId: widget.measurementBottomDocId,
                  measurementTopDocId: widget.measurementTopDocId,
                  damanPrice: widget.damanPrice,
                  neckPrice: widget.neckPrice,
                  sleevesPrice: widget.sleevesPrice,
                  bottomD: widget.bottomD,
                  damanD: widget.damanD,
                  neckD: widget.neckD,
                  sleevesD: widget.sleevesD,
                  notesData: widget.notesData,
                  snapshot: freeStitchingCoupons.docs.isNotEmpty
                      ? freeStitchingCoupons.docs[0]
                      : demoSnapshot,
                  fabricImage: widget.fabricImage,
                  sleevesLengthD: widget.sleevesLengthD,
                  discountSnapshot: couponSnapshot,
                  damanHeight: widget.damanHeight,
                  neckPatchBool: widget.neckPatchBool,
                  sleevesPatchBool: widget.sleevesPatchBool,
                  damanPatchBool: widget.damanPatchBool,
                  bottomPatchBool: widget.bottomPatchBool,
                  neckHeight: widget.neckHeight,
                  sleeveTopPadding: widget.sleeveTopPadding,
                  sleeveFlipped: widget.flippedSleeveD,
                  coupon: coupon,
                  price: price,
                  topAstar: widget.topAstar,
                  bottomAstar: widget.bottomAstar,
                  bottomN: widget.bottomN,
                  damanN: widget.damanN,
                  neckN: widget.neckN,
                  sleevesLengthN: widget.sleevesLengthN,
                  sleevesN: widget.sleevesN,
                  plan: widget.plan,
                );
              }));
            },
          ),
        ),
        backgroundColor: Colors.white,
        middle: Text(
          DemoLocalizations.of(context).getTranslatedValue("order_summary"),
          style: TextStyle(
              fontFamily: 'CodePro', fontWeight: FontWeight.w800, fontSize: 24),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: BouncingScrollPhysics(),
            children: [
              // isAssistant
              //     ? Align(
              //         alignment: Alignment.centerRight,
              //         child: Padding(
              //             padding: const EdgeInsets.only(right: 10.0, top: 9),
              //             child: InkWell(
              //                 onTap: () {
              //                   setState(() {
              //                     player.stop();
              //                     isAssistant = false;
              //                   });
              //                 },
              //                 child: Container(
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(30),
              //                     color: Colors.white10,
              //                     border: Border(
              //                         bottom: BorderSide(
              //                             width: 3, color: Colors.black12),
              //                         top: BorderSide(
              //                             width: 3, color: Colors.black12),
              //                         right: BorderSide(
              //                             width: 3, color: Colors.black12),
              //                         left: BorderSide(
              //                             width: 3, color: Colors.black12)),
              //                     // boxShadow: <BoxShadow>[
              //                     //   BoxShadow(
              //                     //     color: Colors.black.withOpacity(0.09),
              //                     //     blurRadius: 4,
              //                     //     offset: Offset(0, 0),
              //                     //   ),
              //                     // ],
              //                   ),
              //                   child: Row(
              //                     mainAxisSize: MainAxisSize.min,
              //                     mainAxisAlignment: MainAxisAlignment.end,
              //                     children: [
              //                       Icon(
              //                         CupertinoIcons.speaker_fill,
              //                         color: Colors.blue,
              //                       ),
              //                       Container(
              //                         child: AudioWave(
              //                           height: 32,
              //                           width: 60,
              //                           spacing: 5,
              //                           alignment: 'center',
              //                           animationLoop: 1000,
              //                           animation: true,
              //                           beatRate: Duration(milliseconds: 60),
              //                           bars: [
              //                             AudioWaveBar(
              //                                 height: 10,
              //                                 color:
              //                                     Colors.lightBlueAccent[200]),
              //                             AudioWaveBar(
              //                                 height: 30,
              //                                 color:
              //                                     Colors.lightBlueAccent[400],
              //                                 radius: 40),
              //                             AudioWaveBar(
              //                                 height: 70,
              //                                 color:
              //                                     Colors.lightBlueAccent[200]),
              //                             AudioWaveBar(
              //                                 height: 90,
              //                                 color:
              //                                     Colors.lightBlueAccent[400]),
              //                             AudioWaveBar(
              //                                 height: 90,
              //                                 color:
              //                                     Colors.lightBlueAccent[200]),

              //                             AudioWaveBar(
              //                                 height: 70,
              //                                 color:
              //                                     Colors.lightBlueAccent[400]),
              //                             AudioWaveBar(
              //                                 height: 30,
              //                                 color:
              //                                     Colors.lightBlueAccent[200],
              //                                 radius: 40),
              //                             AudioWaveBar(
              //                                 height: 10,
              //                                 color:
              //                                     Colors.lightBlueAccent[400]),

              //                             //   AudioWaveBar(height: 80, color: Colors.blue),
              //                             //   AudioWaveBar(height: 70, color: Colors.lightBlueAccent),
              //                             //   AudioWaveBar(height: 20, color: Colors.blue),
              //                             //   AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
              //                             //   AudioWaveBar(height: 30, color: Colors.blue),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ))),
              //       )
              //     : Align(
              //         alignment: Alignment.centerRight,
              //         child: InkWell(
              //           onTap: () async {
              //             player = await cache.play('designSound.mp3');
              //             player.onPlayerCompletion.listen((val) {
              //               setState(() {
              //                 isAssistant = false;
              //               });
              //             });

              //             setState(() {
              //               isAssistant = true;
              //             });
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.only(right: 10.0, top: 9),
              //             child: Container(
              //               child: Padding(
              //                 padding: const EdgeInsets.only(
              //                     top: 0.5, bottom: 3.5, right: 5, left: 2.5),
              //                 child: Icon(
              //                   CupertinoIcons.speaker_fill,
              //                   color: Colors.blue,
              //                   size: 27,
              //                 ),
              //               ),
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(18),
              //                 color: Colors.white10,
              //                 border: Border(
              //                     bottom: BorderSide(
              //                         width: 3, color: Colors.black12),
              //                     top: BorderSide(
              //                         width: 3, color: Colors.black12),
              //                     right: BorderSide(
              //                         width: 3, color: Colors.black12),
              //                     left: BorderSide(
              //                         width: 3, color: Colors.black12)),
              //                 // boxShadow: <BoxShadow>[
              //                 //   BoxShadow(
              //                 //     color: Colors.black.withOpacity(0.09),
              //                 //     blurRadius: 0,
              //                 //     offset: Offset(0, 0),
              //                 //   ),
              //                 // ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: getalignment(myLocale.languageCode),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Text(
                      widget.plan,
                      style: TextStyle(
                          fontFamily: 'CodePro',
                          fontWeight: FontWeight.w800,
                          fontSize: 28),
                    ),
                  )),
              StaggeredGridView.count(
                mainAxisSpacing: 4,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 10,
                crossAxisSpacing: 4,
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                staggeredTiles: [
                  StaggeredTile.count(4, 6),
                  StaggeredTile.count(3, 3),
                  StaggeredTile.count(3, 3),
                  StaggeredTile.count(6, 3),
                ],
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 2, top: 8, bottom: 8),
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 8, bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.deliveryDays,
                              style: TextStyle(
                                  fontFamily: 'CodePro', fontSize: 105),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'day delivery',
                              style: TextStyle(
                                  fontFamily: 'CodeProlight', fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, bottom: 2, top: 8, right: 2),
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 14, bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset('assets/COD.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, bottom: 2, top: 8, right: 8),
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 8, bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset('assets/QC.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 8, top: 4, bottom: 8),
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 0, bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset('assets/Group 17.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      children: [
                        Text(
                          DemoLocalizations.of(context)
                              .getTranslatedValue("price"),
                          style: TextStyle(
                              fontFamily: 'CodePro',
                              fontWeight: FontWeight.w800,
                              fontSize: 28),
                        ),
                        Text(
                          '\u{20B9} ' + price.toString(),
                          style: TextStyle(
                              fontFamily: 'CodeProlight', fontSize: 28),
                        ),
                      ],
                    ),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("The price may vary depending upon the design",
                      style: TextStyle(
                          letterSpacing: -.7,
                          fontFamily: 'CodeProlight',
                          color: Color(0xFFADADAD),
                          fontSize: 15)),
                ),
              ),
              SizedBox(height: 3),

              widgetSwitcher(context),
              SizedBox(height: 10),

              widget.isMeasurementSelected == false
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                getFabricPhoto(myLocale.languageCode))),
                      ),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      DemoLocalizations.of(context)
                                          .getTranslatedValue(
                                              "measurement_cloth"),
                                      style: TextStyle(
                                          fontFamily: 'CodePro',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 28),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              )),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      widget.measurementImageTopUrl),
                                ),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      widget.measurementImageBottomUrl),
                                ),
                              )),
                            ],
                          ),
                        ],
                      )),
                    ),
              SizedBox(height: 25),

              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      DemoLocalizations.of(context).getTranslatedValue("frock"),
                      style: TextStyle(
                          fontFamily: 'CodePro',
                          fontWeight: FontWeight.w800,
                          fontSize: 26),
                    ),
                  )),
              // SizedBox(
              //   height: 5,
              // ),
              // Directionality(
              //   textDirection: TextDirection.ltr,
              //   child: Row(
              //     textDirection: TextDirection.ltr,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Row(
              //             children: [
              //               Column(
              //                 children: [
              //                   Container(
              //                     padding: EdgeInsets.only(
              //                         top: widget.sleeveTopPadding.toDouble()),
              //                     height: 50.toDouble() + 12.toDouble(),
              //                     child: Image.network(
              //                       widget.flippedSleeveD,
              //                       fit: BoxFit.fill,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Column(
              //                 children: [
              //                   Container(
              //                     height: widget.neckHeight.toDouble() +
              //                         12.toDouble(),
              //                     child: Image.network(
              //                       widget.neckD,
              //                       fit: BoxFit.fill,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Column(
              //                 children: [
              //                   Container(
              //                     padding: EdgeInsets.only(
              //                         top: widget.sleeveTopPadding.toDouble()),
              //                     height: 50.toDouble() + 12.toDouble(),
              //                     child: Image.network(
              //                       widget.sleevesD,
              //                       fit: BoxFit.fill,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //           Container(
              //             height: widget.damanHeight.toDouble() + 12.toDouble(),
              //             child: Image.network(
              //               widget.damanD,
              //               fit: BoxFit.fill,
              //             ),
              //           ),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Container(
              //             height: 100.toDouble() + 12.toDouble(),
              //             child: Image.network(
              //               widget.bottomD,
              //               fit: BoxFit.fill,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 15),

              Align(
                  alignment: getalignment(myLocale.languageCode),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Text(
                      DemoLocalizations.of(context).getTranslatedValue("top"),
                      style: TextStyle(
                          fontFamily: 'CodePro',
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
                          Text(
                              DemoLocalizations.of(context)
                                  .getTranslatedValue("neck"),
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.neckN,
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
                          Text(
                              DemoLocalizations.of(context)
                                  .getTranslatedValue("sleeves"),
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.sleevesN,
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
                          Text(
                              DemoLocalizations.of(context)
                                  .getTranslatedValue("sleevesLength"),
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.sleevesLengthN.toString(),
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
                          Text(
                              DemoLocalizations.of(context)
                                  .getTranslatedValue("ghair"),
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.damanN,
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
              // Align(
              //     alignment: Alignment.centerLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 15.0),
              //       child: Text(
              //         'Top',
              //         style: TextStyle(
              //             fontFamily: 'CodePro',
              //             fontWeight: FontWeight.w800,
              //             fontSize: 28),
              //       ),
              //     )),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0, right: 15),
              //   child: Container(
              //     height: 100,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.grey[200],
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Image.network(
              //           widget.neckD,
              //           frameBuilder:
              //               (context, child, frame, wasSynchronouslyLoaded) {
              //             if (wasSynchronouslyLoaded) {
              //               return child;
              //             } else {
              //               return AnimatedSwitcher(
              //                 duration: const Duration(milliseconds: 500),
              //                 child: frame != null
              //                     ? child
              //                     : Container(
              //                         height: 80,
              //                         child: Center(
              //                             child: CupertinoActivityIndicator())),
              //               );
              //             }
              //           },
              //         ),
              //         Text(
              //           widget.neckN,
              //           textAlign: TextAlign.justify,
              //           style: TextStyle(
              //               fontFamily: 'CodeProlight',
              //               fontWeight: FontWeight.w300,
              //               fontSize: 21),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: 15),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0, right: 15),
              //   child: Container(
              //     height: 100,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.grey[200],
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Image.network(
              //           widget.sleevesD,
              //           frameBuilder:
              //               (context, child, frame, wasSynchronouslyLoaded) {
              //             if (wasSynchronouslyLoaded) {
              //               return child;
              //             } else {
              //               return AnimatedSwitcher(
              //                 duration: const Duration(milliseconds: 500),
              //                 child: frame != null
              //                     ? child
              //                     : Container(
              //                         height: 80,
              //                         child: Center(
              //                             child: CupertinoActivityIndicator())),
              //               );
              //             }
              //           },
              //         ),
              //         Text(widget.sleevesN,
              //             textAlign: TextAlign.justify,
              //             style: TextStyle(
              //                 fontFamily: 'CodeProlight',
              //                 fontWeight: FontWeight.w300,
              //                 fontSize: 21))
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: 15),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0, right: 15),
              //   child: Container(
              //     height: 100,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.grey[200],
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Image.network(
              //           widget.damanD,
              //           frameBuilder:
              //               (context, child, frame, wasSynchronouslyLoaded) {
              //             if (wasSynchronouslyLoaded) {
              //               return child;
              //             } else {
              //               return AnimatedSwitcher(
              //                 duration: const Duration(milliseconds: 500),
              //                 child: frame != null
              //                     ? child
              //                     : Container(
              //                         height: 80,
              //                         child: Center(
              //                             child: CupertinoActivityIndicator())),
              //               );
              //             }
              //           },
              //         ),
              //         Text(widget.damanN,
              //             textAlign: TextAlign.justify,
              //             style: TextStyle(
              //                 fontFamily: 'CodeProlight',
              //                 fontWeight: FontWeight.w300,
              //                 fontSize: 21))
              //       ],
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 40,
              ),
              Align(
                  alignment: getalignment(myLocale.languageCode),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Text(
                      DemoLocalizations.of(context)
                          .getTranslatedValue("bottom"),
                      style: TextStyle(
                          fontFamily: 'CodePro',
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
                          Text(
                              DemoLocalizations.of(context)
                                  .getTranslatedValue("type"),
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22)),
                          Text(widget.bottomN,
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
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Row(
              //           children: [
              //             Column(
              //               children: [
              //                 Container(
              //                   padding: EdgeInsets.only(
              //                       top: widget.sleeveTopPadding.toDouble()),
              //                   height: 50.toDouble() + 12.toDouble(),
              //                   child: Image.network(
              //                     widget.flippedSleeveD,
              //                     fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 Container(
              //                   height: widget.neckHeight.toDouble() +
              //                       12.toDouble(),
              //                   child: Image.network(
              //                     widget.neckD,
              //                     fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 Container(
              //                   padding: EdgeInsets.only(
              //                       top: widget.sleeveTopPadding.toDouble()),
              //                   height: 50.toDouble() + 12.toDouble(),
              //                   child: Image.network(
              //                     widget.sleevesD,
              //                     fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //         Container(
              //           height: widget.damanHeight.toDouble() + 12.toDouble(),
              //           child: Image.network(
              //             widget.damanD,
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Container(
              //           height: 100.toDouble() + 12.toDouble(),
              //           child: Image.network(
              //             widget.bottomD,
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth * 0.04,
                      vertical: deviceHeight * 0.03),
                  child: Material(
                    color: Colors.white60,
                    elevation: 0,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      child: Form(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'total : \u{20B9} ' + price.toString(),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'CodePro'),
                            ),
                            isLoading == false
                                ? FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    color: Colors.blue,
                                    onPressed: () {
                                      // player.stop();
                                      // setState(() {
                                      //   isAssistant = false;
                                      // });

                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                              builder: (context) {
                                        return FrockAddress(
                                          bottomPrice: widget.bottomPrice,
                                          sleevesAstar: widget.sleevesAstar,
                                          isMeasurementSelected:
                                              widget.isMeasurementSelected,
                                          measurementBottomDocId:
                                              widget.measurementBottomDocId,
                                          measurementTopDocId:
                                              widget.measurementTopDocId,
                                          damanPrice: widget.damanPrice,
                                          neckPrice: widget.neckPrice,
                                          sleevesPrice: widget.sleevesPrice,
                                          bottomD: widget.bottomD,
                                          damanD: widget.damanD,
                                          neckD: widget.neckD,
                                          sleevesD: widget.sleevesD,
                                          notesData: widget.notesData,
                                          snapshot: freeStitchingCoupons
                                                  .docs.isNotEmpty
                                              ? freeStitchingCoupons.docs[0]
                                              : demoSnapshot,
                                          fabricImage: widget.fabricImage,
                                          sleevesLengthD: widget.sleevesLengthD,
                                          neckPatchBool: widget.neckPatchBool,
                                          sleevesPatchBool:
                                              widget.sleevesPatchBool,
                                          damanPatchBool: widget.damanPatchBool,
                                          bottomPatchBool:
                                              widget.bottomPatchBool,
                                          discountSnapshot: couponSnapshot,
                                          damanHeight: widget.damanHeight,
                                          neckHeight: widget.neckHeight,
                                          sleeveTopPadding:
                                              widget.sleeveTopPadding,
                                          sleeveFlipped: widget.flippedSleeveD,
                                          coupon: coupon,
                                          price: price,
                                          topAstar: widget.topAstar,
                                          bottomAstar: widget.bottomAstar,
                                          bottomN: widget.bottomN,
                                          damanN: widget.damanN,
                                          neckN: widget.neckN,
                                          sleevesLengthN: widget.sleevesLengthN,
                                          sleevesN: widget.sleevesN,
                                          plan: widget.plan,
                                        );
                                      }));
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Text(
                                            DemoLocalizations.of(context)
                                                .getTranslatedValue("next"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'CodePro'),
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.location_fill,
                                          size: 20,
                                          color: Colors.white,
                                        )
                                      ],
                                    ))
                                : CupertinoActivityIndicator()
                          ],
                        ),
                      ),
                      height: deviceHeight * .07,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //         horizontal: deviceWidth * 0.04,
          //         vertical: deviceHeight * 0.03),
          //     child: Material(
          //       color: Colors.white60,
          //       elevation: 0,
          //       borderRadius: BorderRadius.circular(100),
          //       child: Container(
          //         child: Form(
          //           child: Row(
          //             mainAxisSize: MainAxisSize.max,
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Text(
          //                 'total : Rs ' + price.toString(),
          //                 style: TextStyle(
          //                     color: Colors.black87,
          //                     fontSize: 22,
          //                     fontWeight: FontWeight.bold,
          //                     fontFamily: 'CodePro'),
          //               ),
          //               isLoading == false
          //                   ? FlatButton(
          //                       shape: RoundedRectangleBorder(
          //                           borderRadius:
          //                               new BorderRadius.circular(30.0)),
          //                       color: Colors.blue,
          //                       onPressed: () {
          //                         Navigator.push(context,
          //                             CupertinoPageRoute(builder: (context) {
          //                           return Address_SS(
          //                             bottomPrice: widget.bottomPrice,
          //                             damanPrice: widget.damanPrice,
          //                             neckPrice: widget.neckPrice,
          //                             sleevesPrice: widget.sleevesPrice,
          //                             bottomD: widget.bottomD,
          //                             damanD: widget.damanD,
          //                             neckD: widget.neckD,
          //                             sleevesD: widget.sleevesD,
          //                             notesData: widget.notesData,
          //                             snapshot:
          //                                 freeStitchingCoupons.docs.isNotEmpty
          //                                     ? freeStitchingCoupons.docs[0]
          //                                     : demoSnapshot,
          //                             fabricImage: widget.fabricImage,
          //                             sleevesLengthD: widget.sleevesLengthD,
          //                             discountSnapshot: couponSnapshot,
          //                             damanHeight: widget.damanHeight,
          //                             neckHeight: widget.neckHeight,
          //                             sleeveTopPadding: widget.sleeveTopPadding,
          //                             sleeveFlipped: widget.flippedSleeveD,
          //                             coupon: coupon,
          //                             price: price,
          //                             topAstar: widget.topAstar,
          //                             bottomAstar: widget.bottomAstar,
          //                             bottomN: widget.bottomN,
          //                             damanN: widget.damanN,
          //                             neckN: widget.neckN,
          //                             sleevesLengthN: widget.sleevesLengthN,
          //                             sleevesN: widget.sleevesN,
          //                             plan: widget.plan,
          //                           );
          //                         }));
          //                       },
          //                       child: Row(
          //                         children: [
          //                           Padding(
          //                             padding: const EdgeInsets.only(top: 3.0),
          //                             child: Text(
          //                               'Next',
          //                               style: TextStyle(
          //                                   color: Colors.white,
          //                                   fontSize: 20,
          //                                   fontWeight: FontWeight.bold,
          //                                   fontFamily: 'CodePro'),
          //                             ),
          //                           ),
          //                           Icon(
          //                             CupertinoIcons.location_fill,
          //                             size: 20,
          //                             color: Colors.white,
          //                           )
          //                         ],
          //                       ))
          //                   : CupertinoActivityIndicator()
          //             ],
          //           ),
          //         ),
          //         height: deviceHeight * .07,
          //         decoration: BoxDecoration(
          //             color: Colors.white60,
          //             borderRadius: BorderRadius.circular(100)),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

// FirebaseFirestore firestore = FirebaseFirestore.instance;
//   bool isLoading = true;
//   QuerySnapshot snapshot;
//   var user = auth.FirebaseAuth.instance.currentUser;

//   getOrders() async {
//     QuerySnapshot _snapshot = await firestore
//         .collection('orders_stitching')
//         .doc(user.uid)
//         .collection('orders_stitching')
//         .get();
//     setState(() {
//       snapshot = _snapshot;
//       isLoading = false;
//       print(snapshot);
//     });
//   }

//   @override
//   void initState() {
//     getOrders();
//     super.initState();
//   }
