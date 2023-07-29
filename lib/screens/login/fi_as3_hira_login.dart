import 'package:fi_as3_hira/constants/fi_as3_hira_spaces.dart';
import 'package:fi_as3_hira/widgets/core/fi_as3_hira_button.dart';
import 'package:fi_as3_hira/widgets/core/fi_as3_hira_textfield.dart';
import 'package:fi_as3_hira/screens/home/fi_as3_hira_home.dart';
import 'package:fi_as3_hira/screens/password/fi_as3_hira_passward.dart';
import 'package:fi_as3_hira/screens/signup/fi_as3_hira_signup.dart';
import 'package:flutter/material.dart';

class H1login extends StatelessWidget {
  const H1login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spaces.h50,
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              Spaces.h50,
              const H1TextField(
                child: Text(
                  'Enter your name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const H1TextField(
                child: Text(
                  'Enter your password',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Spaces.h25,
              H1Button(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const H1Home()),
                  );
                },
                color: Colors.green,
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spaces.h30,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const H1SignUp()),
                  );
                },
                child: const Text(
                  "Don't have an Account?",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spaces.h30,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const H1Password()),
                  );
                },
                child: const Text(
                  "Forgot Passward?",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
