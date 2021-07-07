// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:canable_user/Screens/alternation/AlternationForm.dart';
import 'package:canable_user/Screens_men/KurtaPajama/KurtaPajamaEditingDivision.dart';
import 'package:canable_user/Screens_men/PantShirt/PantShirtEditingDivision.dart';
import 'package:canable_user/Screens_men/pant2/PantEditingDivision.dart';
import 'package:canable_user/localization/demolocalization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:audio_wave/audio_wave.dart';

class StartScreenSelectMen extends StatefulWidget {
  @override
  _StartScreenSelectMenState createState() => _StartScreenSelectMenState();
}

class _StartScreenSelectMenState extends State<StartScreenSelectMen> {
  Locale myLocale;
  getAlterPhoto(languageCode) {
    switch (languageCode) {
      case 'en':
        return 'assets/alter.png';

        break;
      case 'hi':
        return 'assets/alter1.png';

        break;
      case 'ur':
        return 'assets/alter2.png';
        break;
      default:
        'assets/alter.png';
    }
  }

  @override
  void initState() {
    // play();
    _updateAppbar();
    super.initState();
  }

  void _updateAppbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
            .copyWith(
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark)));
  }

  // play() async {
  //   player = await cache.play('designSound.mp3');
  //   player.onPlayerCompletion.listen((val) {
  //     setState(() {
  //       isAssistant = false;
  //     });
  //   });

  //   // setState(() {
  //   //   isAssistant = false;
  //   // });
  // }

  // AudioPlayer player = new AudioPlayer();
  // AudioCache cache = new AudioCache();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   player.stop();
  //   super.dispose();
  // }

  // bool isAssistant = true;

  
  @override
  Widget build(BuildContext context) {
    myLocale = Localizations.localeOf(context);

    return  ListView(shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
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
          //                                 color: Colors.lightBlueAccent[200]),
          //                             AudioWaveBar(
          //                                 height: 30,
          //                                 color: Colors.lightBlueAccent[400],
          //                                 radius: 40),
          //                             AudioWaveBar(
          //                                 height: 70,
          //                                 color: Colors.lightBlueAccent[200]),
          //                             AudioWaveBar(
          //                                 height: 90,
          //                                 color: Colors.lightBlueAccent[400]),
          //                             AudioWaveBar(
          //                                 height: 90,
          //                                 color: Colors.lightBlueAccent[200]),

          //                             AudioWaveBar(
          //                                 height: 70,
          //                                 color: Colors.lightBlueAccent[400]),
          //                             AudioWaveBar(
          //                                 height: 30,
          //                                 color: Colors.lightBlueAccent[200],
          //                                 radius: 40),
          //                             AudioWaveBar(
          //                                 height: 10,
          //                                 color: Colors.lightBlueAccent[400]),

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
          //                     bottom:
          //                         BorderSide(width: 3, color: Colors.black12),
          //                     top: BorderSide(width: 3, color: Colors.black12),
          //                     right:
          //                         BorderSide(width: 3, color: Colors.black12),
          //                     left:
          //                         BorderSide(width: 3, color: Colors.black12)),
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

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () async {
                // player.stop();
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return KurtaPajamaEditingDivision(myLocale.languageCode);
                }));
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[50],
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        DemoLocalizations.of(context)
                            .getTranslatedValue("kurtaPajama"),
                        style: TextStyle(
                            fontFamily: "CodeProlight",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                     padding: const EdgeInsets.fromLTRB(0, 3, 10, 3),
                      child: Image.asset('assets/kurtaPajamaC.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(context, CupertinoPageRoute(builder: (context) {
          //         return GararaEditingDivision(myLocale.languageCode);
          //       }));
          //     },
          //     child: Container(
          //       height: 80,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Colors.grey[50],
          //         boxShadow: <BoxShadow>[
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.09),
          //             blurRadius: 4,
          //             offset: Offset(0, 0),
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10.0),
          //             child: Text(
          //               'Garara/Sharara',
          //               style: TextStyle(
          //                   fontFamily: "CodeProlight",
          //                   fontSize: 25,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(12.0),
          //             child: Image.asset('assets/frockImage.png'),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return PantShirtEditingDivision(myLocale.languageCode);
                }));
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[50],
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        DemoLocalizations.of(context)
                            .getTranslatedValue("pantShirt"),
                        style: TextStyle(
                            fontFamily: "CodeProlight",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 4, 6),
                      child: Image.asset('assets/shirtC.png'),
                    )
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return PantEditingDivision(myLocale.languageCode);
                }));
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[50],
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        DemoLocalizations.of(context)
                            .getTranslatedValue("pant"),
                        style: TextStyle(
                            fontFamily: "CodeProlight",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 3, 3, 3),
                      child: Image.asset('assets/pantC.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(context, CupertinoPageRoute(builder: (context) {
          //         return LehengaEditingDivision(myLocale.languageCode);
          //       }));
          //     },
          //     child: Container(
          //       height: 80,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Colors.grey[50],
          //         boxShadow: <BoxShadow>[
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.09),
          //             blurRadius: 4,
          //             offset: Offset(0, 0),
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10.0),
          //             child: Text(
          //               DemoLocalizations.of(context)
          //                   .getTranslatedValue("lehenga"),
          //               style: TextStyle(
          //                   fontFamily: "CodeProlight",
          //                   fontSize: 25,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          //             child: Image.asset('assets/lehengaimage.png'),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(context, CupertinoPageRoute(builder: (context) {
          //         return GararaEditingDivision(myLocale.languageCode);
          //       }));
          //     },
          //     child: Container(
          //       height: 80,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Colors.grey[50],
          //         boxShadow: <BoxShadow>[
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.09),
          //             blurRadius: 4,
          //             offset: Offset(0, 0),
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10.0),
          //             child: Text(
          //               DemoLocalizations.of(context)
          //                   .getTranslatedValue("gararaFarara"),
          //               style: TextStyle(
          //                   fontFamily: "CodeProlight",
          //                   fontSize: 25,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          //             child: Image.asset('assets/gararaImage.png'),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(context, CupertinoPageRoute(builder: (context) {
          //         return BlouseEditingDivision(myLocale.languageCode);
          //       }));
          //     },
          //     child: Container(
          //       height: 80,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Colors.grey[50],
          //         boxShadow: <BoxShadow>[
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.09),
          //             blurRadius: 4,
          //             offset: Offset(0, 0),
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10.0),
          //             child: Text(
          //               DemoLocalizations.of(context)
          //                   .getTranslatedValue("blouse"),
          //               style: TextStyle(
          //                   fontFamily: "CodeProlight",
          //                   fontSize: 25,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(
          //                 left: 20.0, right: 5, top: 24, bottom: 23),
          //             child: Image.asset('assets/blouse.png'),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return AlternationForm();
                }));
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(getAlterPhoto(myLocale.languageCode)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      );
    
  }
}
