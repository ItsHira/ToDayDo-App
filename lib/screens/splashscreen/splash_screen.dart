import 'package:fi_as3_hira/screens/splashscreen/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ToDayDo',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
    );
  }
}
