import 'package:canable_user/Screens/StartScreenSelectMen.dart';
import 'package:canable_user/Screens/startScreen.dart';
import 'package:canable_user/Stitching/orders_stitching.dart';
import 'package:canable_user/localization/demolocalization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelecter extends StatefulWidget {

  @override
  _CategorySelecterState createState() => _CategorySelecterState();
}

class _CategorySelecterState extends State<CategorySelecter> {


  int selectedIndex = 0;

  List<Widget> childWidgets;

  Widget getChildWidget() => childWidgets[selectedIndex];
  void loadChildWidgets() {
    childWidgets = [StartScreenSelect(),StartScreenSelectMen()];
  }

  Map<int, Widget> map = new Map();
  void loadCupertinoTabs() {
    List tempTabs = ['Women', 'Men',];

    map = new Map();
    for (int i = 0; i < 2; i++) {
      map.putIfAbsent(
          i,
          () => Text(
                tempTabs[i],
                style: TextStyle(
                    fontFamily: 'CodeProlight',
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ));
    }
  }

  @override
  void initState() {
    loadChildWidgets();
    loadCupertinoTabs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Text(
          DemoLocalizations.of(context).getTranslatedValue("select_category"),
          style: TextStyle(
              fontFamily: 'CodePro', fontWeight: FontWeight.w800, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CupertinoSlidingSegmentedControl(
                  children: map,
                  onValueChanged: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  groupValue: selectedIndex,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              getChildWidget()
            ],
          ),
        ),
      ),
      
    );
  }
}