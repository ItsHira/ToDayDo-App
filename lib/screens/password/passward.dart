import 'package:flutter/material.dart';

import '../../constants/fi_as3_hira_spaces.dart';
import '../../widgets/core/button.dart';
import '../../widgets/core/textfield.dart';
import '../login/login.dart';

class H1Password extends StatelessWidget {
  const H1Password({super.key});

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
                'New password',
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
