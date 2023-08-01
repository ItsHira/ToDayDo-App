import 'package:flutter/material.dart';

class H1TextField extends StatefulWidget {
  final Widget child;
  final bool opscuretext;
  final String hinttext;
  final String helpertext;
  final TextInputType keyboardType;
  final String Function(String?)? validator;
  final TextEditingController controller;
  const H1TextField(
      {super.key,
      required this.child,
      required this.controller,
      required this.helpertext,
      required this.hinttext,
      required this.opscuretext,required this.validator,required this.keyboardType});

  @override
  State<H1TextField> createState() => _H1TextFieldState();
}

class _H1TextFieldState extends State<H1TextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.opscuretext,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          helperText: widget.helpertext,
          label: widget.child,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.green, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.grey, width: 2)),
        ),
      validator:widget.validator,
      ),
    );
  }
}
