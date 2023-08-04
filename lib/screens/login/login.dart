import 'package:fi_as3_hira/constants/fi_as3_hira_spaces.dart';
import 'package:fi_as3_hira/services/firebase_read_data.dart';
import 'package:fi_as3_hira/utils/utilities.dart';
import 'package:fi_as3_hira/widgets/core/button.dart';
import 'package:fi_as3_hira/widgets/core/textfield.dart';
import 'package:fi_as3_hira/screens/password/passward.dart';
import 'package:fi_as3_hira/screens/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class H1login extends StatefulWidget {
  const H1login({super.key});

  @override
  State<H1login> createState() => _H1loginState();
}

class _H1loginState extends State<H1login> {
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

  login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwardController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const H1Home()),
      );
      setState(() {
        loading = false;
      });
      UserProvider.uid = value.user!.uid;
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
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
                        'Enter your Email i.e @gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your Email i.e @gmail.com';
                        }
                        return '';
                      },
                    ),
                    H1TextField(
                      keyboardType: TextInputType.text,
                      controller: passwardController,
                      opscuretext: true,
                      hinttext: 'Password',
                      helpertext: 'Enter password',
                      child: const Text(
                        'Enter your password',
                        style: TextStyle(color: Colors.grey),
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
              Spaces.h25,
              H1Button(
                loading: loading,
                onPressed: () {
                  if (_formkey.currentState!.validate()) {}
                  login();
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
                    MaterialPageRoute(builder: (context) => H1Password()),
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
