import 'dart:async';

import 'package:fi_as3_hira/screens/home/home.dart';
import 'package:fi_as3_hira/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const H1Home()),),);
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const H1login()),),);
    }
  }
}
