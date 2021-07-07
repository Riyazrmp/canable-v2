// import 'package:audio_wave/audio_wave.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:canable_user/Screens_men/PantShirt/PantShirtForm.dart';
import 'package:canable_user/localization/demolocalization.dart';
import 'package:canable_user/localization/uiLang.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PantShirtEditingDivision extends StatefulWidget {
  final String languageCode;
  PantShirtEditingDivision(this.languageCode);
  @override
  _PantShirtEditingDivisionState createState() => _PantShirtEditingDivisionState();
}

class _PantShirtEditingDivisionState extends State<PantShirtEditingDivision> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot neckSnapshots;
  QuerySnapshot frontSnapshots;

  QuerySnapshot damanSnapshots;
  QuerySnapshot sleevesLengthSnapshots;
  QuerySnapshot sleevesSnapshots;
  QuerySnapshot bottomSnapshots;
  QuerySnapshot ghair_choli;
  QuerySnapshot ghair_withoutCholi;
  QuerySnapshot angrakha;

  String neckD;
  String sleevesLengthD;
  String sleevesD;
  String damanD;
  String bottomD;
  int sleevesPrice;
  int neckPrice;
  int sleevesLengthPrice;
  int damanPrice;
  int bottomPrice;
  String frontName;
  String frontId;
  String frontD;
  int frontHeight;
  int frontPrice;

  String neckId;
  String sleevesId;
  String flippedSleeveD;
  String sleevesLengthId;
  String damanId;
  String sleevesName;
  String bottomId;
  String bottomName;
  String damanName;
  String neckName;
  String sleevesLengthName;
  QuerySnapshot _sleevesAboveElbow;
  QuerySnapshot _sleevesBelowElbow;
  QuerySnapshot _sleevesFullLength;
  QuerySnapshot ghairTypeImages;
  int neckHeight;
  int damanHeight;
  int sleeveTopPadding;
  String ghairId;
  int ghairHeight;
  String ghairD;
  String ghairName;
  int ghairPrice;
  @override
  void initState() {
    // play();
    loadNeckData();
    loadDamanData();
    loadBottomData();
    // loadAngrakha();
    loadFrontData();
    loadGhair();
    loadSleevesData();
    loadGhairType();
    loadSleevesLengthData();
    _updateAppbar();

    super.initState();
  }

  // play() async {
  //   player = await cache.play('editaudio.mp3');
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

  void _updateAppbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
            .copyWith(
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark)));
  }

  loadNeckData() async {
    QuerySnapshot neck = await firestore
        .collection('maleParts')
        .doc('shirt_neck')
        .collection('designs')
        .orderBy('rank')
        .get();
    setState(() {
      neckSnapshots = neck;
      neckId = neckSnapshots.docs[0]['id'];
      neckHeight = neckSnapshots.docs[0]['height'];
      sleeveTopPadding = neckSnapshots.docs[0]['sleevePadding'];
      neckD = neckSnapshots.docs[0]['image'];
      neckName = neckSnapshots.docs[0]['${widget.languageCode}name'];

      neckPrice = neckSnapshots.docs[0]['price'];
    });
  }

  // loadAngrakha() async {
  //   QuerySnapshot angrakhaT = await firestore
  //       .collection('salwarSuitParts')
  //       .doc('neck')
  //       .collection('designs')
  //       .orderBy('rank')
  //       .get();
  //   setState(() {
  //     angrakha = angrakhaT;
  //     neckId = angrakha.docs[0]['id'];
  //     neckHeight = angrakha.docs[0]['height'];
  //     sleeveTopPadding = angrakha.docs[0]['sleevePadding'];
  //     neckD = angrakha.docs[0]['image'];
  //     neckName = angrakha.docs[0]['${widget.languageCode}name'];

  //     neckPrice = angrakha.docs[0]['price'];
  //   });
  // }

  loadGhairType() async {
    QuerySnapshot ghairTypeT = await firestore
        .collection('salwarSuitParts')
        .doc('frock_ghair')
        .collection('Type')
        .orderBy('rank')
        .get();
    setState(() {
      ghairTypeImages = ghairTypeT;
    });
  }

  loadGhair() async {
    QuerySnapshot ghair_choliT = await firestore
        .collection('salwarSuitParts')
        .doc('frock_ghair')
        .collection('choli')
        .orderBy('rank')
        .get();
    QuerySnapshot ghair_withoutCholiT = await firestore
        .collection('salwarSuitParts')
        .doc('frock_ghair')
        .collection('withoutCholi')
        .orderBy('rank')
        .get();
    setState(() {
      ghair_choli = ghair_choliT;
      ghairSnapshots = ghair_choli;
      ghairTypeId = ghairType[0];
      ghair_withoutCholi = ghair_withoutCholiT;
      ghairId = ghair_choli.docs[0]['id'];
      ghairHeight = ghair_choli.docs[0]['height'];
      ghairD = ghair_choli.docs[0]['image'];
      ghairName = ghair_choli.docs[0]['${widget.languageCode}name'];
      ghairPrice = ghair_choli.docs[0]['price'];
    });
  }

  loadDamanData() async {
    QuerySnapshot daman = await firestore
        .collection('maleParts')
        .doc('shirt_hem')
        .collection('designs')
        .orderBy('rank')
        .get();
    setState(() {
      damanSnapshots = daman;
      damanId = damanSnapshots.docs[0]['id'];
      damanHeight = damanSnapshots.docs[0]['height'];
      damanD = damanSnapshots.docs[0]['image'];
      damanName = damanSnapshots.docs[0]['${widget.languageCode}name'];
      damanPrice = damanSnapshots.docs[0]['price'];
    });
  }

  loadFrontData() async {
    QuerySnapshot front = await firestore
        .collection('maleParts')
        .doc('shirt_front')
        .collection('designs')
        .orderBy('rank')
        .get();
    setState(() {
      frontSnapshots = front;
      frontId = frontSnapshots.docs[0]['id'];
      frontHeight = frontSnapshots.docs[0]['height'];
      frontD = frontSnapshots.docs[0]['image'];
      frontName = frontSnapshots.docs[0]['${widget.languageCode}name'];
      frontPrice = frontSnapshots.docs[0]['price'];
    });
  }

  loadBottomData() async {
    QuerySnapshot bottom = await firestore
        .collection('maleParts')
        .doc('bottom_m')
        .collection('designs')
        .orderBy('rank', descending: false)
        .get();
    setState(() {
      bottomSnapshots = bottom;
      bottomId = bottomSnapshots.docs[0]['id'];
      bottomName = bottomSnapshots.docs[0]['${widget.languageCode}name'];

      bottomD = bottomSnapshots.docs[0]['image'];
      bottomPrice = bottomSnapshots.docs[0]['price'];
    });
  }

  loadSleevesData() async {
    QuerySnapshot sleevesAboveElbow = await firestore
        .collection('maleParts')
        .doc('shirt_sleeves')
        .collection('aboveElbow')
        .orderBy('rank')
        .get();
    // QuerySnapshot sleevesBelowElbow = await firestore
    //     .collection('salwarSuitParts')
    //     .doc('sleeves')
    //     .collection('belowElbow')
    //     .orderBy('rank')
    //     .get();
    QuerySnapshot sleevesFullLength = await firestore
        .collection('maleParts')
        .doc('shirt_sleeves')
        .collection('fullLength')
        .orderBy('rank')
        .get();
    setState(() {
      sleevesSnapshots = sleevesFullLength;
      _sleevesAboveElbow = sleevesAboveElbow;
      _sleevesFullLength = sleevesFullLength;
      sleevesId = sleevesFullLength.docs[0]['id'];
      sleevesName = sleevesFullLength.docs[0]['${widget.languageCode}name'];
      flippedSleeveD = sleevesFullLength.docs[0]['flipped'];
      sleevesD = sleevesFullLength.docs[0]['image'];
      sleevesPrice = sleevesFullLength.docs[0]['price'];
    });
  }

  loadSleevesLengthData() async {
    QuerySnapshot sleevesLength = await firestore
        .collection('maleParts')
        .doc('sleevesLength')
        .collection('designs')
        .orderBy('rank')
        .get();
    setState(() {
      sleevesLengthSnapshots = sleevesLength;
      sleevesLengthId = sleevesLengthSnapshots.docs[0]['id'];
      sleevesLengthName =
          sleevesLengthSnapshots.docs[0]['${widget.languageCode}name'];
      sleevesLengthD = sleevesLengthSnapshots.docs[0]['image'];
    });
  }
   showfrontsheet(context, QuerySnapshot designList) {
    String frontTempId = frontId;

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
                          .getTranslatedValue("selectNeck"),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CodeProlight')),
                ),
                body: Container(
                  color: Colors.white,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(2),
                    physics: BouncingScrollPhysics(),
                    itemCount: designList.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              frontId = designList.docs[index]['id'];
                              frontTempId = designList.docs[index]['id'];
                              frontHeight =
                                  designList.docs[index]['height'];
                              // sleeveTopPadding = designList.docs[index]
                              //     ['sleevePadding'];
                              frontName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              frontD = designList.docs[index]['image'];
                              frontPrice =
                                  designList.docs[index]['price'];
                            });
                            sheetSetState(() {
                              frontId = designList.docs[index]['id'];
                              frontTempId = designList.docs[index]['id'];
                              frontHeight =
                                  designList.docs[index]['height'];
                              // sleeveTopPadding = designList.docs[index]
                              //     ['sleevePadding'];
                              frontName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              frontD = designList.docs[index]['image'];
                              frontPrice =
                                  designList.docs[index]['price'];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: frontTempId ==
                                      designList.docs[index]['id']
                                  ? 6
                                  : 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: frontTempId ==
                                          designList.docs[index]['id']
                                      ? Border(
                                          bottom: BorderSide(
                                            width: 3,
                                            color: Colors.blue,
                                          ),
                                          top: BorderSide(
                                              width: 3, color: Colors.blue),
                                          left: BorderSide(
                                              width: 3, color: Colors.blue),
                                          right: BorderSide(
                                              width: 3, color: Colors.blue))
                                      : Border(),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: designList.docs[index]
                                            ['image'],
                                        placeholder: (context, url) => Container(
                                            height: 250,
                                            child:
                                                new CupertinoActivityIndicator()),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 3.0),
                                      child: Center(
                                        child: Text(
                                          designList.docs[index][
                                              '${widget.languageCode}name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'CodeProlight',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              );
            }));
  }

  shownecksheet(context, QuerySnapshot designList) {
    String neckTempId = neckId;

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
                          .getTranslatedValue("selectNeck"),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CodeProlight')),
                ),
                body: Container(
                  color: Colors.white,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(2),
                    physics: BouncingScrollPhysics(),
                    itemCount: designList.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              neckId = designList.docs[index]['id'];
                              neckTempId = designList.docs[index]['id'];
                              neckHeight =
                                  designList.docs[index]['height'];
                              sleeveTopPadding = designList.docs[index]
                                  ['sleevePadding'];
                              neckName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              neckD = designList.docs[index]['image'];
                              neckPrice =
                                  designList.docs[index]['price'];
                            });
                            sheetSetState(() {
                              neckId = designList.docs[index]['id'];
                              neckTempId = designList.docs[index]['id'];
                              neckHeight =
                                  designList.docs[index]['height'];
                              sleeveTopPadding = designList.docs[index]
                                  ['sleevePadding'];
                              neckName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              neckD = designList.docs[index]['image'];
                              neckPrice =
                                  designList.docs[index]['price'];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: neckTempId ==
                                      designList.docs[index]['id']
                                  ? 6
                                  : 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: neckTempId ==
                                          designList.docs[index]['id']
                                      ? Border(
                                          bottom: BorderSide(
                                            width: 3,
                                            color: Colors.blue,
                                          ),
                                          top: BorderSide(
                                              width: 3, color: Colors.blue),
                                          left: BorderSide(
                                              width: 3, color: Colors.blue),
                                          right: BorderSide(
                                              width: 3, color: Colors.blue))
                                      : Border(),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: designList.docs[index]
                                            ['image'],
                                        placeholder: (context, url) => Container(
                                            height: 250,
                                            child:
                                                new CupertinoActivityIndicator()),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 3.0),
                                      child: Center(
                                        child: Text(
                                          designList.docs[index][
                                              '${widget.languageCode}name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'CodeProlight',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              );
            }));
  }

  showSleevesLengthSheet(context, QuerySnapshot designList) {
    showCupertinoModalBottomSheet(
        context: context,
        builder: (context) => Scaffold(
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
                middle: Text("Select SleevesLength",
                    style: GoogleFonts.quicksand(fontWeight: FontWeight.bold)),
              ),
              body: Container(
                color: Colors.white70,
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                  physics: BouncingScrollPhysics(),
                  itemCount: sleevesLengthSnapshots.docs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            sleevesLengthId =
                                designList.docs[index]['id'];

                            sleevesLengthD =
                                designList.docs[index]['image'];
                            sleevesLengthPrice =
                                designList.docs[index]['price'];
                            Navigator.pop(context);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: sleevesLengthSnapshots.docs[index]
                                  ['image'],
                              placeholder: (context, url) => Container(
                                  height: 250,
                                  child: new CupertinoActivityIndicator()),
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ));
  }

  showSleevesSheet(context, QuerySnapshot designList) {
    String sleevesLengthTempId = sleevesLengthId;
    String sleevesTempId = sleevesId;
    showCupertinoModalBottomSheet(
        context: context,
        builder: (context) =>
            StatefulBuilder(builder: (context, sheetSetState) {
              return Scaffold(
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
                          .getTranslatedValue("selectSleeves"),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CodeProlight')),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              DemoLocalizations.of(context)
                                  .getTranslatedValue("selectLength"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28),
                            ),
                          )),
                      Container(
                        color: Colors.white70,
                        child: StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(2),
                          physics: BouncingScrollPhysics(),
                          itemCount: sleevesLengthSnapshots.docs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    switch (sleevesLengthSnapshots.docs[index]
                                        ['id']) {
                                      case 'aboveElbow':
                                        sleevesSnapshots = _sleevesAboveElbow;
                                        sleevesId = _sleevesAboveElbow.docs[0]
                                            ['id'];
                                        sleevesTempId = _sleevesAboveElbow
                                            .docs[0]
                                            ['id'];
                                        sleevesName =
                                            _sleevesAboveElbow.docs[0][
                                                '${widget.languageCode}name'];

                                        flippedSleeveD = _sleevesAboveElbow
                                            .docs[0]
                                            ['flipped'];

                                        sleevesD = _sleevesAboveElbow.docs[0]
                                            ['image'];
                                        sleevesPrice = _sleevesAboveElbow
                                            .docs[0]
                                            ['price'];
                                        break;
                                      // case 'belowElbow':
                                      //   sleevesSnapshots = _sleevesBelowElbow;
                                      //   sleevesId = _sleevesBelowElbow.docs[0]
                                      //       ['id'];
                                      //   flippedSleeveD = _sleevesBelowElbow
                                      //       .docs[0]
                                      //       ['flipped'];
                                      //   sleevesTempId = _sleevesBelowElbow
                                      //       .docs[0]
                                      //       ['id'];
                                      //   sleevesName =
                                      //       _sleevesBelowElbow.docs[0][
                                      //           '${widget.languageCode}name'];
                                      //   sleevesD = _sleevesBelowElbow.docs[0]
                                      //       ['image'];
                                      //   sleevesPrice = _sleevesBelowElbow
                                      //       .docs[0]
                                      //       ['price'];
                                      //   break;
                                      case 'fullLength':
                                        sleevesSnapshots = _sleevesFullLength;
                                        sleevesId = _sleevesFullLength.docs[0]
                                            ['id'];
                                        flippedSleeveD = _sleevesFullLength
                                            .docs[0]
                                            ['flipped'];
                                        sleevesTempId = _sleevesFullLength
                                            .docs[0]
                                            ['id'];
                                        sleevesName =
                                            _sleevesFullLength.docs[0][
                                                '${widget.languageCode}name'];

                                        sleevesD = _sleevesFullLength.docs[0]
                                            ['image'];
                                        sleevesPrice = _sleevesFullLength
                                            .docs[0]
                                            ['price'];
                                        break;
                                    }
                                    sleevesLengthD = sleevesLengthSnapshots
                                        .docs[index]
                                        ['id'];
                                    sleevesLengthTempId = sleevesLengthSnapshots
                                        .docs[index]
                                        ['id'];
                                    sleevesLengthId = sleevesLengthSnapshots
                                        .docs[index]
                                        ['id'];

                                    sleevesLengthD = sleevesLengthSnapshots
                                        .docs[index]
                                        ['image'];
                                    sleevesLengthName = sleevesLengthSnapshots
                                        .docs[index]
                                        ['${widget.languageCode}name'];
                                  });
                                  sheetSetState(() {
                                    sleevesLengthId = sleevesLengthSnapshots
                                        .docs[index]
                                        ['id'];
                                    sleevesLengthName = sleevesLengthSnapshots
                                        .docs[index]
                                        ['${widget.languageCode}name'];

                                    switch (sleevesLengthSnapshots.docs[index]
                                        ['id']) {
                                      case 'aboveElbow':
                                        sleevesSnapshots = _sleevesAboveElbow;
                                        sleevesId = _sleevesAboveElbow.docs[0]
                                            ['id'];
                                        flippedSleeveD = _sleevesAboveElbow
                                            .docs[0]
                                            ['flipped'];
                                        sleevesTempId = _sleevesAboveElbow
                                            .docs[0]
                                            ['id'];
                                        sleevesName =
                                            _sleevesAboveElbow.docs[0][
                                                '${widget.languageCode}name'];

                                        sleevesD = _sleevesAboveElbow.docs[0]
                                            ['image'];
                                        sleevesPrice = _sleevesAboveElbow
                                            .docs[0]
                                            ['price'];
                                        break;
                                      // case 'belowElbow':
                                      //   sleevesSnapshots = _sleevesBelowElbow;
                                      //   sleevesId = _sleevesBelowElbow.docs[0]
                                      //       ['id'];
                                      //   flippedSleeveD = _sleevesBelowElbow
                                      //       .docs[0]
                                      //       ['flipped'];
                                      //   sleevesTempId = _sleevesBelowElbow
                                      //       .docs[0]
                                      //       ['id'];
                                      //   sleevesName =
                                      //       _sleevesBelowElbow.docs[0][
                                      //           '${widget.languageCode}name'];
                                      //   sleevesD = _sleevesBelowElbow.docs[0]
                                      //       ['image'];
                                      //   sleevesPrice = _sleevesBelowElbow
                                      //       .docs[0]
                                      //       ['price'];
                                      //   break;
                                      case 'fullLength':
                                        sleevesSnapshots = _sleevesFullLength;
                                        sleevesId = _sleevesFullLength.docs[0]
                                            ['id'];
                                        flippedSleeveD = _sleevesFullLength
                                            .docs[0]
                                            ['flipped'];
                                        sleevesTempId = _sleevesFullLength
                                            .docs[0]
                                            ['id'];
                                        sleevesName =
                                            _sleevesFullLength.docs[0][
                                                '${widget.languageCode}name'];
                                        sleevesD = _sleevesFullLength.docs[0]
                                            ['image'];
                                        sleevesPrice = _sleevesFullLength
                                            .docs[0]
                                            ['price'];
                                        break;
                                    }
                                    sleevesLengthD = sleevesLengthSnapshots
                                        .docs[index]
                                        ['id'];
                                    sleevesLengthTempId = sleevesLengthSnapshots
                                        .docs[index]
                                        ['id'];
                                    sleevesLengthD = sleevesLengthSnapshots
                                        .docs[index]
                                        ['image'];
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: sleevesLengthTempId ==
                                            sleevesLengthSnapshots.docs[index]
                                                ['id']
                                        ? 6
                                        : 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: sleevesLengthTempId ==
                                                sleevesLengthSnapshots
                                                    .docs[index]
                                                    ['id']
                                            ? Border(
                                                bottom: BorderSide(
                                                  width: 3,
                                                  color: Colors.blue,
                                                ),
                                                top: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue),
                                                left: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue),
                                                right: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue))
                                            : Border(),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                height: 80,
                                                imageUrl: sleevesLengthSnapshots
                                                    .docs[index]
                                                    ['image'],
                                                placeholder: (context, url) =>
                                                    Container(
                                                        height: 250,
                                                        child:
                                                            new CupertinoActivityIndicator()),
                                              ),
                                              // child: Image.network(
                                              //   sleevesLengthSnapshots
                                              //       .docs[index]
                                              //       ['image'],
                                              //   height: 80,
                                              //   frameBuilder: (context,
                                              //       child,
                                              //       frame,
                                              //       wasSynchronouslyLoaded) {
                                              //     if (wasSynchronouslyLoaded) {
                                              //       return child;
                                              //     } else {
                                              //       return AnimatedSwitcher(
                                              //         duration: const Duration(
                                              //             milliseconds: 500),
                                              //         child: frame != null
                                              //             ? child
                                              //             : Container(
                                              //                 height: 80,
                                              //                 child: Center(
                                              //                     child:
                                              //                         CupertinoActivityIndicator())),
                                              //       );
                                              //     }
                                              //   },
                                              // ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3.0),
                                            child: Center(
                                              child: Text(
                                                sleevesLengthSnapshots
                                                        .docs[index]
                                                        [
                                                    '${widget.languageCode}name'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'CodeProlight',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              DemoLocalizations.of(context)
                                  .getTranslatedValue("selectDesign"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'CodeProlight',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28),
                            ),
                          )),
                      Container(
                        color: Colors.white70,
                        child: StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(2),
                          physics: BouncingScrollPhysics(),
                          itemCount: sleevesSnapshots.docs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sleevesId = sleevesSnapshots.docs[index]
                                        ['id'];
                                    sleevesTempId = sleevesSnapshots.docs[index]
                                        ['id'];
                                    sleevesD = sleevesSnapshots.docs[index]
                                        ['image'];
                                    sleevesName = sleevesSnapshots.docs[index]
                                        ['${widget.languageCode}name'];
                                    flippedSleeveD = sleevesSnapshots
                                        .docs[index]
                                        ['flipped'];

                                    sleevesPrice = sleevesSnapshots.docs[index]
                                        ['price'];
                                  });
                                  sheetSetState(() {
                                    sleevesId = sleevesSnapshots.docs[index]
                                        ['id'];
                                    sleevesTempId = sleevesSnapshots.docs[index]
                                        ['id'];
                                    sleevesName = sleevesSnapshots.docs[index]
                                        ['${widget.languageCode}name'];
                                    sleevesD = sleevesSnapshots.docs[index]
                                        ['image'];
                                    flippedSleeveD = sleevesSnapshots
                                        .docs[index]
                                        ['flipped'];
                                    sleevesPrice = sleevesSnapshots.docs[index]
                                        ['price'];
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    elevation: sleevesTempId ==
                                            sleevesSnapshots.docs[index]
                                                ['id']
                                        ? 6
                                        : 0,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: sleevesTempId ==
                                                sleevesSnapshots.docs[index]
                                                    ['id']
                                            ? Border(
                                                bottom: BorderSide(
                                                  width: 3,
                                                  color: Colors.blue,
                                                ),
                                                top: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue),
                                                left: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue),
                                                right: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue))
                                            : Border(),
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl: sleevesSnapshots
                                                  .docs[index]
                                                  ['image'],
                                              placeholder: (context, url) =>
                                                  Container(
                                                      height: 250,
                                                      child:
                                                          new CupertinoActivityIndicator()),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3.0),
                                            child: Center(
                                              child: Text(
                                                sleevesSnapshots.docs[index]
                                                        [
                                                    '${widget.languageCode}name'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'CodeProlight',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  List ghairType = ['Choli', 'withoutCholi'];
  String ghairTypeId;
  QuerySnapshot ghairSnapshots;
  showGhairSheet(context, QuerySnapshot designList) {
    String ghairTempId = ghairId;
    showCupertinoModalBottomSheet(
        context: context,
        builder: (context) =>
            StatefulBuilder(builder: (context, sheetSetState) {
              return Scaffold(
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
                          .getTranslatedValue("select_ghair"),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CodeProlight')),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                        color: Colors.white70,
                        child: StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(2),
                          physics: BouncingScrollPhysics(),
                          itemCount: ghairTypeImages.docs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ghairTypeId = ghairType[index];

                                    switch (ghairType[index]) {
                                      case 'Choli':
                                        ghairSnapshots = ghair_choli;
                                        ghairId =
                                            ghair_choli.docs[0]['id'];
                                        ghairTempId =
                                            ghair_choli.docs[0]['id'];
                                        ghairName = ghair_choli.docs[0][
                                            '${widget.languageCode}name'];

                                        ghairD =
                                            ghair_choli.docs[0]['image'];
                                        ghairPrice =
                                            ghair_choli.docs[0]['price'];
                                        break;
                                      case 'withoutCholi':
                                        ghairSnapshots = ghair_withoutCholi;
                                        ghairId = ghair_withoutCholi.docs[0]
                                            ['id'];

                                        ghairTempId = ghair_withoutCholi.docs[0]
                                            ['id'];
                                        ghairName =
                                            ghair_withoutCholi.docs[0][
                                                '${widget.languageCode}name'];
                                        ghairD = ghair_withoutCholi.docs[0]
                                            ['image'];
                                        ghairPrice = ghair_withoutCholi.docs[0]
                                            ['price'];
                                        break;
                                    }
                                  });
                                  sheetSetState(() {
                                    ghairTypeId = ghairType[index];

                                    switch (ghairType[index]) {
                                      case 'Choli':
                                        ghairSnapshots = ghair_choli;
                                        ghairId =
                                            ghair_choli.docs[0]['id'];
                                        ghairTempId =
                                            ghair_choli.docs[0]['id'];
                                        ghairName = ghair_choli.docs[0][
                                            '${widget.languageCode}name'];

                                        ghairD =
                                            ghair_choli.docs[0]['image'];
                                        ghairPrice =
                                            ghair_choli.docs[0]['price'];
                                        break;
                                      case 'withoutCholi':
                                        ghairSnapshots = ghair_withoutCholi;
                                        ghairId = ghair_withoutCholi.docs[0]
                                            ['id'];
                                        ghairTempId = ghair_withoutCholi.docs[0]
                                            ['id'];

                                        ghairName =
                                            ghair_withoutCholi.docs[0][
                                                '${widget.languageCode}name'];
                                        ghairD = ghair_withoutCholi.docs[0]
                                            ['image'];
                                        ghairPrice = ghair_withoutCholi.docs[0]
                                            ['price'];
                                        break;
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    elevation:
                                        ghairTypeId == ghairType[index] ? 6 : 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: ghairTypeId == ghairType[index]
                                            ? Border(
                                                bottom: BorderSide(
                                                  width: 3,
                                                  color: Colors.blue,
                                                ),
                                                top: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue),
                                                left: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue),
                                                right: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue))
                                            : Border(),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  imageUrl: ghairTypeImages
                                                      .docs[index]
                                                      ['image'],
                                                  height: 120,
                                                  placeholder: (context, url) =>
                                                      Container(
                                                          height: 150,
                                                          child:
                                                              new CupertinoActivityIndicator()),
                                                )
                                                //       ['image'],),
                                                // child: Image.network(
                                                //   ghairTypeImages.docs[index]
                                                //       ['image'],
                                                //   height: 80,
                                                //   frameBuilder: (context,
                                                //       child,
                                                //       frame,
                                                //       wasSynchronouslyLoaded) {
                                                //     if (wasSynchronouslyLoaded) {
                                                //       return child;
                                                //     } else {
                                                //       return AnimatedSwitcher(
                                                //         duration: const Duration(
                                                //             milliseconds: 500),
                                                //         child: frame != null
                                                //             ? child
                                                //             : Container(
                                                //                 height: 80,
                                                //                 child: Center(
                                                //                     child:
                                                //                         CupertinoActivityIndicator())),
                                                //       );
                                                //     }
                                                //   },
                                                // ),
                                                ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3.0),
                                            child: Center(
                                              child: Text(
                                                ghairTypeImages.docs[index]
                                                        [
                                                    '${widget.languageCode}name'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'CodeProlight',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                DemoLocalizations.of(context)
                                    .getTranslatedValue("selectDesign"),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'CodeProlight',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28),
                              ),
                            )),
                      ),
                      Container(
                        color: Colors.white70,
                        child: StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(2),
                          physics: BouncingScrollPhysics(),
                          itemCount: ghairSnapshots.docs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ghairId =
                                        ghairSnapshots.docs[index]['id'];
                                    ghairTempId =
                                        ghairSnapshots.docs[index]['id'];
                                    ghairD = ghairSnapshots.docs[index]
                                        ['image'];
                                    ghairName = ghairSnapshots.docs[index]
                                        ['${widget.languageCode}name'];

                                    ghairPrice = ghairSnapshots.docs[index]
                                        ['price'];
                                  });
                                  sheetSetState(() {
                                    ghairId =
                                        ghairSnapshots.docs[index]['id'];
                                    ghairTempId =
                                        ghairSnapshots.docs[index]['id'];
                                    ghairName = ghairSnapshots.docs[index]
                                        ['${widget.languageCode}name'];
                                    ghairD = ghairSnapshots.docs[index]
                                        ['image'];

                                    ghairPrice = ghairSnapshots.docs[index]
                                        ['price'];
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    elevation: ghairTempId ==
                                            ghairSnapshots.docs[index]
                                                ['id']
                                        ? 6
                                        : 0,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: ghairTempId ==
                                                ghairSnapshots.docs[index]
                                                    ['id']
                                            ? Border(
                                                bottom: BorderSide(
                                                  width: 3,
                                                  color: Colors.blue,
                                                ),
                                                top: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue),
                                                left: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue),
                                                right: BorderSide(
                                                    width: 3,
                                                    color: Colors.blue))
                                            : Border(),
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl: ghairSnapshots
                                                  .docs[index]
                                                  ['image'],
                                              placeholder: (context, url) =>
                                                  Container(
                                                      height: 250,
                                                      child:
                                                          new CupertinoActivityIndicator()),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3.0),
                                            child: Center(
                                              child: Text(
                                                ghairSnapshots.docs[index]
                                                        [
                                                    '${widget.languageCode}name'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'CodeProlight',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  showDamanSheet(context, QuerySnapshot designList) {
    String damanTempId = damanId;
    showCupertinoModalBottomSheet(
        context: context,
        builder: (
          context,
        ) =>
            StatefulBuilder(builder: (context, sheetSetState) {
              return Scaffold(
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
                          .getTranslatedValue("selectDaman"),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CodeProlight')),
                ),
                body: Container(
                  color: Colors.white70,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(2),
                    physics: BouncingScrollPhysics(),
                    itemCount: designList.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              damanId = designList.docs[index]['id'];
                              damanTempId = designList.docs[index]['id'];
                              damanD = designList.docs[index]['image'];
                              damanHeight =
                                  designList.docs[index]['height'];
                              damanName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              damanPrice =
                                  designList.docs[index]['price'];
                            });
                            sheetSetState(() {
                              damanId = designList.docs[index]['id'];
                              damanTempId = designList.docs[index]['id'];
                              damanD = designList.docs[index]['image'];
                              damanHeight =
                                  designList.docs[index]['height'];
                              damanName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              damanPrice =
                                  designList.docs[index]['price'];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: damanTempId ==
                                      designList.docs[index]['id']
                                  ? 6
                                  : 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: damanTempId ==
                                          designList.docs[index]['id']
                                      ? Border(
                                          bottom: BorderSide(
                                            width: 3,
                                            color: Colors.blue,
                                          ),
                                          top: BorderSide(
                                              width: 3, color: Colors.blue),
                                          left: BorderSide(
                                              width: 3, color: Colors.blue),
                                          right: BorderSide(
                                              width: 3, color: Colors.blue))
                                      : Border(),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: designList.docs[index]
                                            ['image'],
                                        placeholder: (context, url) => Container(
                                            height: 250,
                                            child:
                                                new CupertinoActivityIndicator()),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 3.0),
                                      child: Center(
                                        child: Text(
                                          designList.docs[index][
                                              '${widget.languageCode}name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'CodeProlight',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              );
            }));
  }

  showBottomSheet(context, QuerySnapshot designList) {
    String bottomtempId = bottomId;

    showCupertinoModalBottomSheet(
        context: context,
        builder: (context) =>
            StatefulBuilder(builder: (context, sheetSetState) {
              return Scaffold(
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
                          .getTranslatedValue("selectBottom"),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CodeProlight')),
                ),
                body: Container(
                  color: Colors.white70,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(2),
                    physics: BouncingScrollPhysics(),
                    itemCount: designList.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              bottomId = designList.docs[index]['id'];
                              bottomtempId =
                                  designList.docs[index]['id'];
                              bottomD = designList.docs[index]['image'];
                              bottomPrice =
                                  designList.docs[index]['price'];
                              bottomName = designList.docs[index]
                                  ['${widget.languageCode}name'];
                            });
                            sheetSetState(() {
                              bottomId = designList.docs[index]['id'];
                              bottomtempId =
                                  designList.docs[index]['id'];
                              bottomD = designList.docs[index]['image'];
                              bottomName = designList.docs[index]
                                  ['${widget.languageCode}name'];
                              bottomPrice =
                                  designList.docs[index]['price'];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: bottomtempId ==
                                      designList.docs[index]['id']
                                  ? 6
                                  : 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: bottomtempId ==
                                          designList.docs[index]['id']
                                      ? Border(
                                          bottom: BorderSide(
                                            width: 3,
                                            color: Colors.blue,
                                          ),
                                          top: BorderSide(
                                              width: 3, color: Colors.blue),
                                          left: BorderSide(
                                              width: 3, color: Colors.blue),
                                          right: BorderSide(
                                              width: 3, color: Colors.blue))
                                      : Border(),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: designList.docs[index]
                                            ['image'],
                                        placeholder: (context, url) => Container(
                                            height: 250,
                                            child:
                                                new CupertinoActivityIndicator()),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 3.0),
                                      child: Center(
                                        child: Text(
                                          designList.docs[index][
                                              '${widget.languageCode}name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'CodeProlight',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              );
            }));
  }

//  QuerySnapshot neckSnapshots;
//   QuerySnapshot damanSnapshots;
//   QuerySnapshot sleevesLengthSnapshots;
//   QuerySnapshot sleevesSnapshots;
//   QuerySnapshot bottomSnapshots;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        trailing: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: CupertinoButton(
            padding: EdgeInsets.all(0),
            child: Text(
              DemoLocalizations.of(context).getTranslatedValue("next"),
              style: TextStyle(
                  fontFamily: 'CodePro',
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            onPressed: neckSnapshots != null &&
                    damanSnapshots != null &&
                    sleevesLengthSnapshots != null &&
                    sleevesSnapshots != null &&
                    bottomSnapshots != null
                ? () {
                    // player.stop();
                    // setState(() {
                    //   isAssistant = false;
                    // });

                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return PantShirtForm(frontD: frontD,
                      frontN:frontName,
                      frontPrice: frontPrice,
                          
                          damanPrice: ghairPrice,
                          neckPrice: neckPrice,
                          sleevesPrice: sleevesPrice,
                          damanD: ghairD,
                          neckD: neckD,
                          sleevesD: sleevesD,
                          damanHeight: ghairHeight,
                          neckHeight: neckHeight,
                          sleeveTopPadding: sleeveTopPadding,
                          damanN: ghairId,
                          neckN: neckName,
                          sleevesLengthN: sleevesLengthName,
                          sleevesN: sleevesName,
                          sleevesLengthD: sleevesLengthD,
                          flippedSleeveD: flippedSleeveD);
                    }));
                  }
                : () {},
          ),
        ),
        backgroundColor: Colors.white,
        middle: Text(
          DemoLocalizations.of(context).getTranslatedValue("pantShirt"),
          style: TextStyle(
              fontFamily: 'CodeProlight',
              fontWeight: FontWeight.w800,
              fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
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
                //                                 color: Colors
                //                                     .lightBlueAccent[200]),
                //                             AudioWaveBar(
                //                                 height: 30,
                //                                 color:
                //                                     Colors.lightBlueAccent[400],
                //                                 radius: 40),
                //                             AudioWaveBar(
                //                                 height: 70,
                //                                 color: Colors
                //                                     .lightBlueAccent[200]),
                //                             AudioWaveBar(
                //                                 height: 90,
                //                                 color: Colors
                //                                     .lightBlueAccent[400]),
                //                             AudioWaveBar(
                //                                 height: 90,
                //                                 color: Colors
                //                                     .lightBlueAccent[200]),

                //                             AudioWaveBar(
                //                                 height: 70,
                //                                 color: Colors
                //                                     .lightBlueAccent[400]),
                //                             AudioWaveBar(
                //                                 height: 30,
                //                                 color:
                //                                     Colors.lightBlueAccent[200],
                //                                 radius: 40),
                //                             AudioWaveBar(
                //                                 height: 10,
                //                                 color: Colors
                //                                     .lightBlueAccent[400]),

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
                        DemoLocalizations.of(context).getTranslatedValue("top"),
                        style: TextStyle(
                            fontFamily: 'CodePro',
                            fontWeight: FontWeight.w800,
                            fontSize: 28),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                StaggeredGridView.count(
                  mainAxisSpacing: 4,
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  staggeredTiles: [
                    StaggeredTile.fit(2),
                    StaggeredTile.fit(2),
                    StaggeredTile.fit(2),
                    StaggeredTile.fit(2),
                    // StaggeredTile.fit(4),
                  ],
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    neckSnapshots != null
                        ? Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                onTap: () {
                                  shownecksheet(context, neckSnapshots);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: ClipRRect(
                                            child: CachedNetworkImage(
                                              imageUrl: neckD,
                                              placeholder: (context, url) =>
                                                  Container(
                                                      height: 150,
                                                      child:
                                                          new CupertinoActivityIndicator()),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                neckName,
                                                style: TextStyle(
                                                    fontFamily: 'CodeProlight',
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          )
                        : CupertinoActivityIndicator(),
                    sleevesSnapshots != null
                        ? Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                onTap: () {
                                  showSleevesSheet(context, sleevesSnapshots);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ClipRRect(
                                            child: CachedNetworkImage(
                                              imageUrl: sleevesD,
                                              placeholder: (context, url) =>
                                                  Container(
                                                      height: 150,
                                                      child:
                                                          new CupertinoActivityIndicator()),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              sleevesName,
                                              style: TextStyle(
                                                  fontFamily: 'CodeProlight',
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          sleevesLengthName,
                                          style: TextStyle(
                                              fontFamily: 'CodeProlight',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          )
                        : CupertinoActivityIndicator(),
                    damanSnapshots != null
                        ? Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                onTap: () {
                                  showDamanSheet(context, damanSnapshots);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            child: CachedNetworkImage(
                                              imageUrl: damanD,
                                              placeholder: (context, url) =>
                                                  Container(
                                                      height: 150,
                                                      child:
                                                          new CupertinoActivityIndicator()),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              damanName,
                                              style: TextStyle(
                                                  fontFamily: 'CodeProlight',
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          )
                        : CupertinoActivityIndicator(),
                         frontSnapshots != null
                        ? Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                onTap: () {
                                  showfrontsheet(context, frontSnapshots);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            child: CachedNetworkImage(
                                              imageUrl: frontD,
                                              placeholder: (context, url) =>
                                                  Container(
                                                      height: 150,
                                                      child:
                                                          new CupertinoActivityIndicator()),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              frontName,
                                              style: TextStyle(
                                                  fontFamily: 'CodeProlight',
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          )
                        : CupertinoActivityIndicator(),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(
                    //         left: 0.0, top: 20, bottom: 0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text(
                    //           DemoLocalizations.of(context)
                    //               .getTranslatedValue("select_and_change"),
                    //           style: TextStyle(
                    //               fontFamily: 'CodeProlight',
                    //               fontSize: 26,
                    //               fontWeight: FontWeight.w700),
                    //         ),
                    //         Icon(
                    //           CupertinoIcons.color_filter,
                    //           size: 32,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // bottomSnapshots != null
                    //     ? Column(
                    //         children: [
                    //           Align(
                    //               alignment:
                    //                   getalignment(myLocale.languageCode),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.only(
                    //                     top: 15, left: 15.0, right: 15),
                    //                 child: Text(
                    //                   DemoLocalizations.of(context)
                    //                       .getTranslatedValue("bottom"),
                    //                   style: TextStyle(
                    //                       fontFamily: 'CodePro',
                    //                       fontWeight: FontWeight.w800,
                    //                       fontSize: 28),
                    //                 ),
                    //               )),
                    //           Padding(
                    //             padding: const EdgeInsets.all(4.0),
                    //             child: Material(
                    //               elevation: 0,
                    //               borderRadius: BorderRadius.circular(10),
                    //               child: GestureDetector(
                    //                 onTap: () {
                    //                   showBottomSheet(context, bottomSnapshots);
                    //                 },
                    //                 child: Container(
                    //                     decoration: BoxDecoration(
                    //                       color: Colors.grey[100],
                    //                       shape: BoxShape.rectangle,
                    //                       borderRadius:
                    //                           BorderRadius.circular(10.0),
                    //                     ),
                    //                     child: Column(
                    //                       children: [
                    //                         Padding(
                    //                           padding:
                    //                               const EdgeInsets.all(8.0),
                    //                           child: ClipRRect(
                    //                             child: CachedNetworkImage(
                    //                               imageUrl: bottomD,
                    //                               placeholder: (context, url) =>
                    //                                   Container(
                    //                                       height: 150,
                    //                                       child:
                    //                                           new CupertinoActivityIndicator()),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Row(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.center,
                    //                           children: [
                    //                             Text(
                    //                               bottomName,
                    //                               style: TextStyle(
                    //                                   fontFamily:
                    //                                       'CodeProlight',
                    //                                   fontWeight:
                    //                                       FontWeight.w300,
                    //                                   fontSize: 20),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ],
                    //                     )),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     : CupertinoActivityIndicator()
                  ],
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
            Align(
              alignment: getalignmentStackButtons(myLocale.languageCode),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, bottom: 20, left: 20),
                child: FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: neckSnapshots != null &&
                            damanSnapshots != null &&
                            sleevesLengthSnapshots != null &&
                            sleevesSnapshots != null &&
                            bottomSnapshots != null
                        ? () {
                            // player.stop();
                            // setState(() {
                            //   isAssistant = false;
                            // });

                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return PantShirtForm(
                                frontD: frontD,
                      frontN:frontName,
                      frontPrice: frontPrice,
                                  damanPrice: ghairPrice,
                                  neckPrice: neckPrice,
                                  sleevesPrice: sleevesPrice,
                                  damanD: ghairD,
                                  neckD: neckD,
                                  sleevesD: sleevesD,
                                  damanHeight: ghairHeight,
                                  neckHeight: neckHeight,
                                  sleeveTopPadding: sleeveTopPadding,
                                  damanN: ghairId,
                                  neckN: neckName,
                                  sleevesLengthN: sleevesLengthName,
                                  sleevesN: sleevesName,
                                  sleevesLengthD: sleevesLengthD,
                                  flippedSleeveD: flippedSleeveD);
                            }));
                          }
                        : () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            DemoLocalizations.of(context)
                                .getTranslatedValue("next"),
                            style: TextStyle(
                                fontFamily: 'CodePro',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                        ),
                        Icon(getarrow(myLocale.languageCode),
                            size: 22, color: Colors.white)
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
