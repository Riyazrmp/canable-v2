import 'package:canable_user/Tabs-screens/UserP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class Userdata with ChangeNotifier {
  String userName = " hii";
  String userImage;
  String userId;
  void getUser() async {
    currentUser = await FirebaseAuth.instance.currentUser;

    userName = currentUser.displayName;
    userImage = currentUser.photoURL;
    userId = currentUser.email;
    notifyListeners();
  }
}
