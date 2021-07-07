import 'package:canable_user/Screens/CategorySelecter.dart';
import 'package:canable_user/Screens/pakistaniSuit.dart';
import 'package:canable_user/Screens/startScreen.dart';
import 'package:canable_user/Stitching/SalwarSuitEdititingScreen.dart';
import 'package:canable_user/Stitching/SalwarSuit_1.dart';
import 'package:canable_user/Stitching/category.dart';
import 'package:canable_user/Stitching/measurement.dart';
import 'package:canable_user/Stitching/pak_1.dart';
import 'package:canable_user/Stitching/sendYourDesign.dart';
import 'package:canable_user/Stitching/sendYourDesign_1.dart';
import 'package:canable_user/Stitching/stitchingServicePage.dart';
import 'package:canable_user/localization/demolocalization.dart';
import 'package:canable_user/localization/uiLang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StitchingScreen extends StatefulWidget {
  @override
  _StitchingScreenState createState() => _StitchingScreenState();
}

class _StitchingScreenState extends State<StitchingScreen> {
  showsheet(context, QuerySnapshot designList) {
    showCupertinoModalBottomSheet(
        context: context,
        builder: (context) =>
            StatefulBuilder(builder: (context, sheetSetState) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: CupertinoNavigationBar(
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CupertinoButton(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'CodePro',
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  middle: Text(
                      DemoLocalizations.of(context)
                          .getTranslatedValue("priceList"),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CodeProlight')),
                ),
                body: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: list.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (index + 1) % 2 == 0
                                ? Colors.black54
                                : Color(0xFFF5F5F5),
                            // border: Border(
                            //     bottom: BorderSide(
                            //         width: 3, color: Colors.black12),
                            //     top: BorderSide(
                            //         width: 3, color: Colors.black12),
                            //     right: BorderSide(
                            //         width: 3, color: Colors.black12),
                            //     left: BorderSide(
                            //         width: 3, color: Colors.black12)),
                            // boxShadow: <BoxShadow>[
                            //   BoxShadow(
                            //     color: Colors.black.withOpacity(0.09),
                            //     blurRadius: 4,
                            //     offset: Offset(0, 0),
                            //   ),
                            // ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, top: 9, bottom: 7, right: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    list.docs[index]['name'],
                                    style: TextStyle(
                                      fontFamily: 'CodePro',
                                      fontSize: 20,
                                      color: (index + 1) % 2 == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "₹ " +
                                        list.docs[index]
                                            ['price']
                                            .toString(),
                                    style: TextStyle(
                                      fontFamily: 'CodePro',
                                      fontSize: 20,
                                      color: (index + 1) % 2 == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                      // return ListTile(
                      //   trailing: Text(
                      //     "₹ " + list.docs[index]['price'].toString(),
                      //     style: TextStyle(fontFamily: 'CodePro', fontSize: 20),
                      //   ),
                      //   title: Text(
                      //     list.docs[index]['name'],
                      //     style: TextStyle(fontFamily: 'CodePro', fontSize: 20),
                      //   ),
                      // );
                    },
                  ),

                  // child: StaggeredGridView.countBuilder(
                  //   crossAxisCount: 4,
                  //   staggeredTileBuilder: (int index) =>
                  //       new StaggeredTile.fit(2),
                  //   physics: BouncingScrollPhysics(),
                  //   itemCount: designList.docs.length,
                  //   itemBuilder: (context, index) {
                  //     return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             backId = designList.docs[index]['id'];
                  //             backTempId = designList.docs[index]['id'];
                  //             backHeight =
                  //                 designList.docs[index]['height'];
                  //             sleeveTopPadding = designList.docs[index]
                  //                 ['sleevePadding'];
                  //             backName = designList.docs[index]
                  //                 ['${widget.languageCode}name'];

                  //             backD = designList.docs[index]['image'];
                  //             backPrice =
                  //                 designList.docs[index]['price'];
                  //           });
                  //           sheetSetState(() {
                  //             backId = designList.docs[index]['id'];
                  //             backTempId = designList.docs[index]['id'];
                  //             backHeight =
                  //                 designList.docs[index]['height'];
                  //             sleeveTopPadding = designList.docs[index]
                  //                 ['sleevePadding'];
                  //             backName = designList.docs[index]
                  //                 ['${widget.languageCode}name'];

                  //             backD = designList.docs[index]['image'];
                  //             backPrice =
                  //                 designList.docs[index]['price'];
                  //           });
                  //         },
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Material(
                  //             borderRadius: BorderRadius.circular(10),
                  //             elevation: backTempId ==
                  //                     designList.docs[index]['id']
                  //                 ? 6
                  //                 : 0,
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 border: backTempId ==
                  //                         designList.docs[index]['id']
                  //                     ? Border(
                  //                         bottom: BorderSide(
                  //                           width: 3,
                  //                           color: Colors.blue,
                  //                         ),
                  //                         top: BorderSide(
                  //                             width: 3, color: Colors.blue),
                  //                         left: BorderSide(
                  //                             width: 3, color: Colors.blue),
                  //                         right: BorderSide(
                  //                             width: 3, color: Colors.blue))
                  //                     : Border(),
                  //               ),
                  //               child: Column(
                  //                 children: [
                  //                   ClipRRect(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                     child: CachedNetworkImage(
                  //                       imageUrl: designList.docs[index]
                  //                           ['image'],
                  //                       placeholder: (context, url) => Container(
                  //                           height: 250,
                  //                           child:
                  //                               new CupertinoActivityIndicator()),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding:
                  //                         const EdgeInsets.only(bottom: 3.0),
                  //                     child: Center(
                  //                       child: Text(
                  //                         designList.docs[index][
                  //                             '${widget.languageCode}name'],
                  //                         textAlign: TextAlign.center,
                  //                         style: TextStyle(
                  //                             fontFamily: 'CodeProlight',
                  //                             fontSize: 20,
                  //                             fontWeight: FontWeight.bold),
                  //                       ),
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ));
                  //   },
                  // ),
                ),
              );
            }));
  }

  getSalwarImage(languageCode) {
    switch (languageCode) {
      case 'en':
        return 'assets/redhead.png';

        break;
      case 'hi':
        return 'assets/redhead.png';

        break;
      case 'ur':
        return 'assets/redhead.png';
        break;
      default:
        'assets/redhead.png';
    }
  }

  getPatchesImage(languageCode) {
    switch (languageCode) {
      case 'en':
        return 'assets/patchesSuitCard.png';

        break;
      case 'hi':
        return 'assets/patchesSuitCard2.png';

        break;
      case 'ur':
        return 'assets/patchesSuitCard1.png';
        break;
      default:
        'assets/patchesSuitCard.png';
    }
  }

  getSendImage(languageCode) {
    switch (languageCode) {
      case 'en':
        return 'assets/sendYourDesignCard.png';

        break;
      case 'hi':
        return 'assets/sendYourDesignCard2.png';

        break;
      case 'ur':
        return 'assets/sendYourDesignCard1.png';
        break;
      default:
        'assets/sendYourDesignCard.png';
    }
  }

  getButton(languageCode) {
    switch (languageCode) {
      case 'en':
        return 'assets/measurementCard.png';

        break;
      case 'hi':
        return 'assets/measurementCard2.png';

        break;
      case 'ur':
        return 'assets/measurementCard1.png';
        break;
      default:
        'assets/measurementCard.png';
    }
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _updateAppbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
            .copyWith(
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark)));
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  bool isLoading = true;
  QuerySnapshot list;
  getdata() async {
    QuerySnapshot listTemp = await firestore
        .collection('Plist')
        .orderBy('rank', descending: false)
        .get();

    setState(() {
      isLoading = false;
      list = listTemp;
    });
  }

  Locale myLocale;
  @override
  Widget build(BuildContext context) {
    myLocale = Localizations.localeOf(context);

    return Scaffold(
        appBar: CupertinoNavigationBar(
          leading: Image.asset('assets/12.png'),
          backgroundColor: Colors.white,
          transitionBetweenRoutes: false,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 12, top: 40, right: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("Experience",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'CodeProlight',
                              color: Colors.black,
                              letterSpacing: -.6,
                              fontWeight: FontWeight.w600,
                              fontSize: 46,
                            )),
                        Text("Stitching At Your Fingertips",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'CodeProlight',
                              color: Colors.black,
                              letterSpacing: -.7,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            )),
                        // Text("Get your dress stitched with \na few clicks!",
                        //     textAlign: TextAlign.left,
                        //     style: TextStyle(
                        //       fontFamily: 'CodeProlight',
                        //       color: Colors.black,
                        //       fontSize: 20,
                        //     )),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                            onTap: () {
                              showsheet(context, list);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white10,
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 3, color: Colors.black12),
                                      top: BorderSide(
                                          width: 3, color: Colors.black12),
                                      right: BorderSide(
                                          width: 3, color: Colors.black12),
                                      left: BorderSide(
                                          width: 3, color: Colors.black12)),
                                  // boxShadow: <BoxShadow>[
                                  //   BoxShadow(
                                  //     color: Colors.black.withOpacity(0.09),
                                  //     blurRadius: 4,
                                  //     offset: Offset(0, 0),
                                  //   ),
                                  // ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    'view pricing',
                                    style: TextStyle(
                                        fontFamily: 'CodePro',
                                        letterSpacing: -.7),
                                  ),
                                )))
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      child: Image.asset(
                        getSalwarImage(myLocale.languageCode),
                        fit: BoxFit.contain,
                      )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(right: 0, top: 0),
                child: Container(
                  height: 250,
                  width: 250,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return CategorySelecter();

                        //SalwarSuitEditingScreen(myLocale.languageCode);
                      }));
                    },
                    child: FlareActor(
                      'assets/start.flr',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      animation: 'play',
                    ),
                  ),
                ),
              ),
            ),
          ],
        )

        // // Padding(
        // //   padding: const EdgeInsets.all(9.0),
        // //   child: GestureDetector(
        // //       onTap: () {
        // //         Navigator.push(context,
        // //             CupertinoPageRoute(builder: (context) {
        // //           return SalwarSuit_1();
        // //         }));
        // //       },
        // //       child: Container(
        // //           decoration: BoxDecoration(
        // //             borderRadius: BorderRadius.circular(10),
        // //             color: Colors.grey[100],
        // //             boxShadow: <BoxShadow>[
        // //               BoxShadow(
        // //                 color: Colors.black.withOpacity(0.25),
        // //                 blurRadius: 5,
        // //                 offset: Offset(0, 0),
        // //               ),
        // //             ],
        // //           ),
        // //           child: ClipRRect(
        // //               borderRadius: BorderRadius.circular(9),
        // //               child: Container(
        // //                   child: Image.asset(
        // //                       getSalwarImage(myLocale.languageCode),
        // //                       fit: BoxFit.fill))))),
        // // ),
        // // SizedBox(
        // //   height: 7,
        // // ),
        // // Row(
        // //   children: [
        // //     Expanded(
        // //       child: Padding(
        // //         padding: const EdgeInsets.all(8.0),
        // //         child: GestureDetector(
        // //             onTap: () {
        // //               Navigator.push(context,
        // //                   CupertinoPageRoute(builder: (context) {
        // //                 return SendYourDesign_1();
        // //               }));
        // //             },
        // //             child: Container(
        // //                 decoration: BoxDecoration(
        // //                   borderRadius: BorderRadius.circular(10),
        // //                   color: Colors.grey[100],
        // //                   boxShadow: <BoxShadow>[
        // //                     BoxShadow(
        // //                       color: Colors.black.withOpacity(0.25),
        // //                       blurRadius: 5,
        // //                       offset: Offset(0, 0),
        // //                     ),
        // //                   ],
        // //                 ),
        // //                 child: Container(
        // //                     child: Image.asset(
        // //                   getSendImage(myLocale.languageCode),
        // //                 )))),
        // //       ),
        // //     ),
        // //     Expanded(
        // //       child: Padding(
        // //         padding: const EdgeInsets.all(8.0),
        // //         child: GestureDetector(
        // //             onTap: () {
        // //               Navigator.push(context,
        // //                   CupertinoPageRoute(builder: (context) {
        // //                 return Pak_1();
        // //               }));
        // //             },
        // //             child: Container(
        // //                 decoration: BoxDecoration(
        // //                   borderRadius: BorderRadius.circular(20),
        // //                   color: Colors.grey[100],
        // //                   boxShadow: <BoxShadow>[
        // //                     BoxShadow(
        // //                       color: Colors.black.withOpacity(0.25),
        // //                       blurRadius: 5,
        // //                       offset: Offset(0, 0),
        // //                     ),
        // //                   ],
        // //                 ),
        // //                 child: Container(
        // //                     child: Image.asset(
        // //                   getPatchesImage(myLocale.languageCode),
        // //                 )))),
        // //       ),
        // //     ),
        // //   ],
        // // ),
        // // SizedBox(
        // //   height: 7,
        // // ),
        // // Padding(
        // //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
        // //   child: GestureDetector(
        // //     onTap: () {
        // //       Navigator.push(context,
        // //           CupertinoPageRoute(builder: (context) {
        // //         return BrowseByCategory();
        // //       }));
        // //     },
        // //     child: Container(
        // //       decoration: BoxDecoration(
        // //         borderRadius: BorderRadius.circular(10),
        // //         color: Color(0xFFECECEC),
        // //         boxShadow: <BoxShadow>[
        // //           BoxShadow(
        // //             color: Colors.black.withOpacity(0.2),
        // //             blurRadius: 6,
        // //             offset: Offset(0, 0),
        // //           ),
        // //         ],
        // //       ),
        // //       child: Container(
        // //         padding: EdgeInsets.all(10),
        // //         child: Row(
        // //           mainAxisAlignment: MainAxisAlignment.center,
        // //           children: [
        // //             Image.asset('assets/stack.png'),
        // //             SizedBox(width: 6),
        // //             Text(
        // //               DemoLocalizations.of(context)
        // //                   .getTranslatedValue("browse"),
        // //               style: TextStyle(
        // //                   fontFamily: 'CodeProlight',
        // //                   fontWeight: FontWeight.bold,
        // //                   fontSize: 22),
        // //             ),
        // //           ],
        // //         ),
        // //       ),
        // //     ),
        // //   ),
        // // ),
        // // SizedBox(height: 14),
        // // Align(
        // //   alignment: Alignment.centerRight,
        // //   child: Padding(
        // //     padding: const EdgeInsets.only(right: 8.0),
        // //     child: GestureDetector(
        // //       onTap: () {
        // //         Navigator.push(context,
        // //             CupertinoPageRoute(builder: (context) {
        // //           return MeasurementScreen();
        // //         }));
        // //       },
        // //       child: Container(
        // //         width: MediaQuery.of(context).size.width / 2,
        // //         decoration: BoxDecoration(
        // //           borderRadius: BorderRadius.circular(20),
        // //           boxShadow: <BoxShadow>[
        // //             BoxShadow(
        // //               color: Colors.black.withOpacity(0.2),
        // //               blurRadius: 4,
        // //               offset: Offset(0, 0),
        // //             ),
        // //           ],
        // //         ),
        // //         child: Image.asset(
        // //           getMeasureImage(myLocale.languageCode),
        // //         ),
        // //       ),
        // //     ),
        // //   ),
        // )

        );
  }
}
