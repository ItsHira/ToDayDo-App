import 'package:fi_as3_hira/constants/fi_as3_hira_spaces.dart';
import 'package:fi_as3_hira/utils/utilities.dart';
import 'package:fi_as3_hira/widgets/core/button.dart';
import 'package:fi_as3_hira/widgets/core/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';

class H1SignUp extends StatefulWidget {
  const H1SignUp({super.key});

  @override
  State<H1SignUp> createState() => _H1SignUpState();
}

class _H1SignUpState extends State<H1SignUp> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwardController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwardController.dispose();
  }

  void Signup() {
    if (_formkey.currentState!.validate()) {}
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwardController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const H1login()),
      );
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

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
            Form(
              key: _formkey,
              child: Column(
                children: [
                  H1TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    opscuretext: false,
                    hinttext: 'Email',
                    helpertext: 'Enter your Email',
                    child: const Text(
                      'Enter your Email',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      } else if (!value.endsWith('.com')) {
                        return '.com is missing try again';
                      } else if (!value.contains("@")) {
                        return '@ is missing try again';
                      }
                      return '';
                    },
                  ),
                  H1TextField(
                    keyboardType: TextInputType.text,
                    controller: passwardController,
                    opscuretext: false,
                    hinttext: 'password',
                    helpertext: 'your password must be atleast 6 letters',
                    child: const Text(
                      'your password',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      }
                      return '';
                    },
                  ),
                ],
              ),
            ),
            Spaces.h30,
            H1Button(
              loading: loading,
              onPressed: () {
                Signup();
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
