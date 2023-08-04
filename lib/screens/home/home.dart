import 'package:fi_as3_hira/constants/fi_as3_hira_spaces.dart';
import 'package:fi_as3_hira/screens/login/login.dart';
import 'package:fi_as3_hira/screens/home/widgets/action_button.dart';
import 'package:fi_as3_hira/screens/home/widgets/datalist.dart';
import 'package:fi_as3_hira/screens/home/widgets/header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/utilities.dart';

class H1Home extends StatefulWidget {
  const H1Home({super.key});

  @override
  State<H1Home> createState() => _H1HomeState();
}

class _H1HomeState extends State<H1Home> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Spaces.h50,
            const Header(),
            Spaces.h5,
            const DataList(),
            Spaces.h40,
            const ActionButton(),
            Row(
              children: [
                Spaces.w10,
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const H1login(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    auth.signOut().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const H1login()));
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
