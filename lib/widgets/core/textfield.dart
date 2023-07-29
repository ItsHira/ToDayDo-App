import 'package:flutter/material.dart';

class H1TextField extends StatefulWidget {
  final Widget child;
  const H1TextField({super.key, required this.child});

  @override
  State<H1TextField> createState() => _H1TextFieldState();
}

class _H1TextFieldState extends State<H1TextField> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
            label: widget.child,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.green, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.grey, width: 2)),
          ),
        ),
      ),
    );
  }
}
