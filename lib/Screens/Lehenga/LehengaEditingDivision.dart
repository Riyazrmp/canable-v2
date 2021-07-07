// import 'package:audio_wave/audio_wave.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:canable_user/Screens/Frock/frockForm.dart';
import 'package:canable_user/Screens/Garara%20Farara/GararaForm.dart';
import 'package:canable_user/Screens/Lehenga/LehengaForm.dart';
import 'package:canable_user/Stitching/planSelect.dart';
import 'package:canable_user/Tabs-screens/BottomBar.dart';
import 'package:canable_user/localization/demolocalization.dart';
import 'package:canable_user/localization/uiLang.dart';
import 'package:canable_user/my_flutter_app_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:random_string/random_string.dart';

class LehengaEditingDivision extends StatefulWidget {
  final String languageCode;
  LehengaEditingDivision(this.languageCode);
  @override
  _LehengaEditingDivisionState createState() => _LehengaEditingDivisionState();
}

class _LehengaEditingDivisionState extends State<LehengaEditingDivision> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot neckSnapshots;
  QuerySnapshot backSnapshots;
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
  String backId;
  String backName;
  int backHeight;

  int backPrice;
  String backD;

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

  String u1D;
  String u2D;
  String u1N;
  String u2N;
  String u1Id;
  String u2Id;
  int u1Price;
  int u2Price;
  String u1Length;
  String u2Length;
  String u3Length;
  QuerySnapshot cutSnapshots;
  String cutId;
  String cutD;
  String cutName;
  int cutPrice;
  int cutHeight;
  QuerySnapshot u3Snapshots;
  String u3Id;
  String u3D;
  String u3Name;
  String topType;
  int u3Price;
  int u3Height;

  @override
  void initState() {
    // play();
    loadNeckData();

    loadDamanData();
    loadBottomData();
    loadBackData();
    loadAngrakha();
    loadGhair();
    loadCutData();
    loadSleevesData();
    loadGhairType();
    loadSleevesLengthData();
    _updateAppbar();
    topType = 'Kurti';
    super.initState();
  }

  // play() async {
  //   player = await cache.play('lehengaaudio.mp3');
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
        .collection('salwarSuitParts')
        .doc('neck')
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

  loadBackData() async {
    QuerySnapshot back = await firestore
        .collection('salwarSuitParts')
        .doc('back')
        .collection('designs')
        .orderBy('rank')
        .get();
    setState(() {
      backSnapshots = back;
      backId = backSnapshots.docs[0]['id'];
      backHeight = backSnapshots.docs[0]['height'];
      sleeveTopPadding = backSnapshots.docs[0]['sleevePadding'];
      backD = backSnapshots.docs[0]['image'];
      backName = backSnapshots.docs[0]['${widget.languageCode}name'];

      backPrice = backSnapshots.docs[0]['price'];
    });
  }

  loadAngrakha() async {
    QuerySnapshot angrakhaT = await firestore
        .collection('salwarSuitParts')
        .doc('neck')
        .collection('designs')
        .orderBy('rank')
        .get();
    setState(() {
      angrakha = angrakhaT;
      neckId = angrakha.docs[0]['id'];
      neckHeight = angrakha.docs[0]['height'];
      sleeveTopPadding = angrakha.docs[0]['sleevePadding'];
      neckD = angrakha.docs[0]['image'];
      neckName = angrakha.docs[0]['${widget.languageCode}name'];

      neckPrice = angrakha.docs[0]['price'];
    });
  }

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
        .collection('salwarSuitParts')
        .doc('daman_lehenga')
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
      u3Id = damanId;
      u3Name = damanName;
      u3Price = damanPrice;
      u3D = damanD;
      u3Snapshots = damanSnapshots;
    });
  }

  loadCutData() async {
    QuerySnapshot cut = await firestore
        .collection('salwarSuitParts')
        .doc('cut_blouse')
        .collection('designs')
        .orderBy('rank')
        .get();
    setState(() {
      cutSnapshots = cut;
      cutId = cutSnapshots.docs[0]['id'];
      cutHeight = cutSnapshots.docs[0]['height'];
      cutD = cutSnapshots.docs[0]['image'];
      cutName = cutSnapshots.docs[0]['${widget.languageCode}name'];
      cutPrice = cutSnapshots.docs[0]['price'];
    });
  }

  loadBottomData() async {
    QuerySnapshot bottom = await firestore
        .collection('salwarSuitParts')
        .doc('bottom_lehnga')
        .collection('designs')
        .orderBy('rank', descending: true)
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
        .collection('salwarSuitParts')
        .doc('sleeves')
        .collection('aboveElbow')
        .orderBy('rank')
        .get();
    QuerySnapshot sleevesBelowElbow = await firestore
        .collection('salwarSuitParts')
        .doc('sleeves')
        .collection('belowElbow')
        .orderBy('rank')
        .get();
    QuerySnapshot sleevesFullLength = await firestore
        .collection('salwarSuitParts')
        .doc('sleeves')
        .collection('fullLength')
        .orderBy('rank')
        .get();
    setState(() {
      u2Id = sleevesBelowElbow.docs[0]['id'];
      u2N = sleevesBelowElbow.docs[0]['${widget.languageCode}name'];
      u2D = sleevesBelowElbow.docs[0]['image'];
      u2Price = sleevesBelowElbow.docs[0]['price'];
      sleevesSnapshots = sleevesBelowElbow;
      _sleevesAboveElbow = sleevesAboveElbow;

      _sleevesBelowElbow = sleevesBelowElbow;
      _sleevesFullLength = sleevesFullLength;
      sleevesId = sleevesBelowElbow.docs[0]['id'];
      sleevesName =
          sleevesBelowElbow.docs[0]['${widget.languageCode}name'];
      flippedSleeveD = sleevesBelowElbow.docs[0]['flipped'];
      sleevesD = sleevesBelowElbow.docs[0]['image'];
      sleevesPrice = sleevesBelowElbow.docs[0]['price'];
    });
  }

  loadSleevesLengthData() async {
    QuerySnapshot sleevesLength = await firestore
        .collection('salwarSuitParts')
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

  showbacksheet(context, QuerySnapshot designList) {
    String backTempId = backId;

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
                          .getTranslatedValue("selectBack"),
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
                              u2Id = designList.docs[index]['id'];
                              u2N = designList.docs[index]
                                  ['${widget.languageCode}name'];
                              u2D = designList.docs[index]['image'];
                              u2Price = designList.docs[index]['price'];
                              backId = designList.docs[index]['id'];
                              backTempId = designList.docs[index]['id'];
                              backHeight =
                                  designList.docs[index]['height'];
                              sleeveTopPadding = designList.docs[index]
                                  ['sleevePadding'];
                              backName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              backD = designList.docs[index]['image'];
                              backPrice =
                                  designList.docs[index]['price'];
                            });
                            sheetSetState(() {
                              u2Id = designList.docs[index]['id'];
                              u2N = designList.docs[index]
                                  ['${widget.languageCode}name'];
                              u2D = designList.docs[index]['image'];
                              u2Price = designList.docs[index]['price'];
                              backId = designList.docs[index]['id'];
                              backTempId = designList.docs[index]['id'];
                              backHeight =
                                  designList.docs[index]['height'];
                              sleeveTopPadding = designList.docs[index]
                                  ['sleevePadding'];
                              backName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              backD = designList.docs[index]['image'];
                              backPrice =
                                  designList.docs[index]['price'];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: backTempId ==
                                      designList.docs[index]['id']
                                  ? 6
                                  : 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: backTempId ==
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
                                        u2Id = _sleevesAboveElbow.docs[0]
                                            ['id'];
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
                                      case 'belowElbow':
                                        sleevesSnapshots = _sleevesBelowElbow;
                                        sleevesId = _sleevesBelowElbow.docs[0]
                                            ['id'];
                                        u2Id = _sleevesBelowElbow.docs[0]
                                            ['id'];
                                        flippedSleeveD = _sleevesBelowElbow
                                            .docs[0]
                                            ['flipped'];
                                        sleevesTempId = _sleevesBelowElbow
                                            .docs[0]
                                            ['id'];
                                        sleevesName =
                                            _sleevesBelowElbow.docs[0][
                                                '${widget.languageCode}name'];
                                        sleevesD = _sleevesBelowElbow.docs[0]
                                            ['image'];
                                        sleevesPrice = _sleevesBelowElbow
                                            .docs[0]
                                            ['price'];
                                        break;
                                      case 'fullLength':
                                        sleevesSnapshots = _sleevesFullLength;
                                        sleevesId = _sleevesFullLength.docs[0]
                                            ['id'];
                                        u2Id = _sleevesFullLength.docs[0]
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
                                        u2Id = _sleevesAboveElbow.docs[0]
                                            ['id'];
                                        u2N = _sleevesAboveElbow.docs[0][
                                            '${widget.languageCode}name'];
                                        u2D = _sleevesAboveElbow.docs[0]
                                            ['image'];
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
                                        u2Price = _sleevesAboveElbow.docs[0]
                                            ['price'];
                                        sleevesPrice = _sleevesAboveElbow
                                            .docs[0]
                                            ['price'];
                                        break;
                                      case 'belowElbow':
                                        sleevesSnapshots = _sleevesBelowElbow;
                                        sleevesId = _sleevesBelowElbow.docs[0]
                                            ['id'];
                                        u2Id = _sleevesBelowElbow.docs[0]
                                            ['id'];
                                        u2N = _sleevesBelowElbow.docs[0][
                                            '${widget.languageCode}name'];
                                        u2D = _sleevesBelowElbow.docs[0]
                                            ['image'];
                                        u2Price = _sleevesBelowElbow.docs[0]
                                            ['price'];
                                        flippedSleeveD = _sleevesBelowElbow
                                            .docs[0]
                                            ['flipped'];
                                        sleevesTempId = _sleevesBelowElbow
                                            .docs[0]
                                            ['id'];
                                        sleevesName =
                                            _sleevesBelowElbow.docs[0][
                                                '${widget.languageCode}name'];
                                        sleevesD = _sleevesBelowElbow.docs[0]
                                            ['image'];
                                        sleevesPrice = _sleevesBelowElbow
                                            .docs[0]
                                            ['price'];
                                        break;
                                      case 'fullLength':
                                        sleevesSnapshots = _sleevesFullLength;
                                        sleevesId = _sleevesFullLength.docs[0]
                                            ['id'];
                                        u2Id = _sleevesFullLength.docs[0]
                                            ['id'];
                                        u2N = _sleevesFullLength.docs[0][
                                            '${widget.languageCode}name'];
                                        u2D = _sleevesFullLength.docs[0]
                                            ['image'];
                                        u2Price = _sleevesFullLength.docs[0]
                                            ['price'];
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
                                    u2Id = sleevesSnapshots.docs[index]
                                        ['id'];
                                    u2N = sleevesSnapshots.docs[index]
                                        ['${widget.languageCode}name'];
                                    u2D = sleevesSnapshots.docs[index]
                                        ['image'];
                                    u2Price = sleevesSnapshots.docs[index]
                                        ['price'];
                                    sleevesPrice = sleevesSnapshots.docs[index]
                                        ['price'];
                                  });
                                  sheetSetState(() {
                                    u2Id = sleevesSnapshots.docs[index]
                                        ['id'];
                                    u2N = sleevesSnapshots.docs[index]
                                        ['${widget.languageCode}name'];
                                    u2D = sleevesSnapshots.docs[index]
                                        ['image'];
                                    u2Price = sleevesSnapshots.docs[index]
                                        ['price'];
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
                              u3Id = designList.docs[index]['id'];
                              u3Name = designList.docs[index]
                                  ['${widget.languageCode}name'];
                              u3D = designList.docs[index]['image'];
                              u3Price = designList.docs[index]['price'];
                              u3Snapshots = designList;
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
                              u3Id = designList.docs[index]['id'];
                              u3Name = designList.docs[index]
                                  ['${widget.languageCode}name'];
                              u3D = designList.docs[index]['image'];
                              u3Price = designList.docs[index]['price'];
                              u3Snapshots = designList;
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

  showCutSheet(context, QuerySnapshot designList) {
    String cutTempId = cutId;
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
                          .getTranslatedValue("selectCut"),
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
                              u3Id = designList.docs[index]['id'];
                              u3Name = designList.docs[index]
                                  ['${widget.languageCode}name'];
                              u3D = designList.docs[index]['image'];
                              u3Price = designList.docs[index]['price'];
                              u3Snapshots = designList;
                              cutId = designList.docs[index]['id'];
                              cutTempId = designList.docs[index]['id'];
                              cutD = designList.docs[index]['image'];
                              cutHeight =
                                  designList.docs[index]['height'];
                              cutName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              cutPrice = designList.docs[index]['price'];
                            });
                            sheetSetState(() {
                              u3Id = designList.docs[index]['id'];
                              u3Name = designList.docs[index]
                                  ['${widget.languageCode}name'];
                              u3D = designList.docs[index]['image'];
                              u3Price = designList.docs[index]['price'];
                              u3Snapshots = designList;
                              cutId = designList.docs[index]['id'];
                              cutTempId = designList.docs[index]['id'];
                              cutD = designList.docs[index]['image'];
                              cutHeight =
                                  designList.docs[index]['height'];
                              cutName = designList.docs[index]
                                  ['${widget.languageCode}name'];

                              cutPrice = designList.docs[index]['price'];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: cutTempId ==
                                      designList.docs[index]['id']
                                  ? 6
                                  : 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: cutTempId ==
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

  bool topSwitcher = true;
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
                      return LehengaForm(
                          bottomPrice: bottomPrice,
                          bottomId: bottomId,
                          damanPrice: u3Price,
                          neckPrice: neckPrice,
                          sleevesPrice: u2Price,
                          topType: topType,
                          bottomD: bottomD,
                          damanD: u3D,
                          neckD: neckD,
                          sleevesD: u2D,
                          damanHeight: u3Height,
                          neckHeight: neckHeight,
                          sleeveTopPadding: sleeveTopPadding,
                          bottomN: bottomName,
                          damanN: u3Name,
                          neckN: neckName,
                          sleevesLengthN: sleevesLengthName,
                          sleevesN: u2N,
                          sleevesLengthD: sleevesLengthD,
                          flippedSleeveD: flippedSleeveD);
                    }));
                  }
                : () {},
          ),
        ),
        backgroundColor: Colors.white,
        middle: Text(
          DemoLocalizations.of(context).getTranslatedValue("lehenga"),
          style: TextStyle(
              fontFamily: 'CodeProlight',
              fontWeight: FontWeight.w800,
              fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // isAssistant
                  //     ? Align(
                  //         alignment: Alignment.centerRight,
                  //         child: Padding(
                  //             padding:
                  //                 const EdgeInsets.only(right: 10.0, top: 9),
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
                  //                           beatRate:
                  //                               Duration(milliseconds: 60),
                  //                           bars: [
                  //                             AudioWaveBar(
                  //                                 height: 10,
                  //                                 color: Colors
                  //                                     .lightBlueAccent[200]),
                  //                             AudioWaveBar(
                  //                                 height: 30,
                  //                                 color: Colors
                  //                                     .lightBlueAccent[400],
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
                  //                                 color: Colors
                  //                                     .lightBlueAccent[200],
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
                  //             padding:
                  //                 const EdgeInsets.only(right: 10.0, top: 9),
                  //             child: Container(
                  //               child: Padding(
                  //                 padding: const EdgeInsets.only(
                  //                     top: 0.5,
                  //                     bottom: 3.5,
                  //                     right: 5,
                  //                     left: 2.5),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Text(
                                  DemoLocalizations.of(context)
                                      .getTranslatedValue("top"),
                                  style: TextStyle(
                                      fontFamily: 'CodePro',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 28),
                                ),
                              )),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Text("slide to switch",
                                  style: TextStyle(
                                    fontFamily: 'CodeProlight',
                                    color: Colors.black,
                                    fontSize: 16,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Container(
                            child: LiteRollingSwitch(
                          //initial value
                          value: true,
                          textOn: '   Kurti',
                          textOff: 'Blouse',
                          colorOn: Colors.green,
                          colorOff: Colors.green,
                          iconOn: MyFlutterApp.untitled24_20210130183605,
                          iconOff: MyFlutterApp.untitled23_20210130183011,
                          textSize: 18.0,
                          onChanged: (bool state) {
                            if (state == true) {
                              _sleevesBelowElbow != null
                                  ? setState(() {
                                      u2D = sleevesD;
                                      topType = 'Kurti--';
                                      topSwitcher = true;
                                      u2Id = sleevesId;
                                      u2N = sleevesName;
                                      u2Price = sleevesPrice;
                                      u3D = damanD;
                                      u3Name = damanName;
                                      u3Id = damanId;
                                      u3Price = damanPrice;
                                      u3Height = damanHeight;
                                    })
                                  : null;
                            } else if (state == false) {
                              setState(() {
                                u2D = backD;
                                u3D = cutD;
                                topType = 'Blouse';
                                u3Name = cutName;
                                u3Id = cutId;
                                u3Price = cutPrice;
                                u3Height = cutHeight;
                                topSwitcher = false;
                                u2Id = backId;
                                u2N = backName;
                                u2Price = backPrice;
                              });
                            }
                            //Use it to manage the different states
                            print('Current State of SWITCH IS: $state');
                          },
                        )),
                      ),
                    ],
                  ),

                  // LiteRollingSwitch(
                  //   //initial value
                  //   value: true,
                  //   textOn: 'disponible',
                  //   textOff: 'ocupado',
                  //   colorOn: Colors.greenAccent[700],
                  //   colorOff: Colors.redAccent[700],
                  //   iconOn: Icons.done,
                  //   iconOff: Icons.remove_circle_outline,
                  //   textSize: 16.0,
                  //   onChanged: (bool state) {
                  //     //Use it to manage the different states
                  //     print('Current State of SWITCH IS: $state');
                  //   },
                  // ),
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
                      StaggeredTile.fit(4),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                                      fontFamily:
                                                          'CodeProlight',
                                                      fontWeight:
                                                          FontWeight.w300,
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
                                    topSwitcher == true
                                        ? showSleevesSheet(
                                            context, sleevesSnapshots)
                                        : showbacksheet(context, backSnapshots);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ClipRRect(
                                              child: CachedNetworkImage(
                                                imageUrl: u2D,
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
                                                u2N,
                                                style: TextStyle(
                                                    fontFamily: 'CodeProlight',
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            topSwitcher == true
                                                ? sleevesLengthName
                                                : "Back",
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
                      ghairSnapshots != null
                          ? Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Material(
                                elevation: 0,
                                borderRadius: BorderRadius.circular(10),
                                child: GestureDetector(
                                  onTap: () {
                                    topSwitcher == true
                                        ? showDamanSheet(
                                            context, damanSnapshots)
                                        : showCutSheet(context, cutSnapshots);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                              child: CachedNetworkImage(
                                                imageUrl: u3D,
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
                                                u3Name,
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
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, top: 20, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DemoLocalizations.of(context)
                                    .getTranslatedValue("select_and_change"),
                                style: TextStyle(
                                    fontFamily: 'CodeProlight',
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700),
                              ),
                              Icon(
                                CupertinoIcons.color_filter,
                                size: 32,
                              )
                            ],
                          ),
                        ),
                      ),
                      bottomSnapshots != null
                          ? Column(
                              children: [
                                Align(
                                    alignment:
                                        getalignment(myLocale.languageCode),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15.0, right: 15),
                                      child: Text(
                                        DemoLocalizations.of(context)
                                            .getTranslatedValue("bottom"),
                                        style: TextStyle(
                                            fontFamily: 'CodePro',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 28),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Material(
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        showBottomSheet(
                                            context, bottomSnapshots);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  child: CachedNetworkImage(
                                                    imageUrl: bottomD,
                                                    placeholder: (context,
                                                            url) =>
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
                                                    bottomName,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'CodeProlight',
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : CupertinoActivityIndicator()
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
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
                              return LehengaForm(
                                  bottomPrice: bottomPrice,
                                  bottomId: bottomId,
                                  damanPrice: u3Price,
                                  neckPrice: neckPrice,
                                  sleevesPrice: u2Price,
                                  topType: topType,
                                  bottomD: bottomD,
                                  damanD: u3D,
                                  neckD: neckD,
                                  sleevesD: u2D,
                                  damanHeight: u3Height,
                                  neckHeight: neckHeight,
                                  sleeveTopPadding: sleeveTopPadding,
                                  bottomN: bottomName,
                                  damanN: u3Name,
                                  neckN: neckName,
                                  sleevesLengthN: sleevesLengthName,
                                  sleevesN: u2N,
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
