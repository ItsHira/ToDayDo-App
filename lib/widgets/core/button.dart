import 'package:flutter/material.dart';

class H1Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Widget child;
  final bool loading;
  const H1Button(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.color,
      this.loading = false});

      
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(12.0),
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : child,
        ),
      ),
    );
  }
}
