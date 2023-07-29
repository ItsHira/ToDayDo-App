import 'package:fi_as3_hira/constants/fi_as3_hira_spaces.dart';
import 'package:fi_as3_hira/widgets/core/fi_as3_hira_button.dart';
import 'package:fi_as3_hira/widgets/core/fi_as3_hira_textfield.dart';
import 'package:fi_as3_hira/screens/login/fi_as3_hira_login.dart';
import 'package:flutter/material.dart';

class H1SignUp extends StatelessWidget {
  const H1SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Spaces.h50,
            const Text(
              'Create Account',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            Spaces.h30,
            const H1TextField(
              child: Text(
                'Enter your name',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const H1TextField(
              child: Text(
                'Enter your password',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const H1TextField(
              child: Text(
                'Confirm password',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Spaces.h30,
            H1Button(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const H1login()),
                );
              },
              color: Colors.green,
              child: const Text(
                'Sign up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
