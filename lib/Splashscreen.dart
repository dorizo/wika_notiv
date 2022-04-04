import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wika/session.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Session().sessionku().then((value) {
        print(value);
        if (value != null) {
          print("Tidak Kosong");
          if (value.length > 7) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/loginlagi', (Route<dynamic> route) => false);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);
          }
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/login', (Route<dynamic> route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/batik.jpeg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
            child: Container(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorFiltered(
              child: new Image.asset('assets/images/logo.png', height: 40),
              colorFilter: ColorFilter.mode(Colors.blue, BlendMode.modulate),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ))),
      ),
    );
  }
}
