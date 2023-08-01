import 'package:flutter/material.dart';

import '../../constants/fi_as3_hira_spaces.dart';
import '../../widgets/core/button.dart';
import '../../widgets/core/textfield.dart';
import '../login/login.dart';

class H1Password extends StatefulWidget {
  H1Password({super.key});

  @override
  State<H1Password> createState() => _H1PasswordState();
}

class _H1PasswordState extends State<H1Password> {
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final confirmPasswardController = TextEditingController();

  final passwardController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwardController.dispose();
    confirmPasswardController.dispose();
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
              'Change Password',
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
                    helpertext: 'Enter your Email i.e @gmail.com',
                    child: const Text(
                      'Enter your Email',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your i.e @gmail.com';
                      }
                      return '';
                    },
                  ),
                  H1TextField(
                    keyboardType: TextInputType.text,
                    controller: passwardController,
                    opscuretext: false,
                    hinttext: 'password',
                    helpertext: 'Enter your new password',
                    child: const Text(
                      'New password',
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
                  H1TextField(
                    keyboardType: TextInputType.text,
                    controller: confirmPasswardController,
                    opscuretext: false,
                    hinttext: 'confirm password',
                    helpertext: 'Enter your confirm password',
                    child: const Text(
                      'Confirm password',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter confirm password';
                      }
                      return '';
                    },
                  ),
                ],
              ),
            ),
            Spaces.h30,
            H1Button(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {}
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => H1login()),
                  );
                },
                color: Colors.green,
                child: const Text(
                  'Create',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
