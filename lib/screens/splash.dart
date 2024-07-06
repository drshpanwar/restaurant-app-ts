import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restraunt/screens/walkthrough.dart';
import 'package:restraunt/util/const.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    return Timer(Duration(seconds: 2), changeScreen);
  }

  void changeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Walkthrough();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Hide both the status bar and the navigation bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    startTimeout();
  }

  @override
  void dispose() {
    // Re-enable system overlays when the splash screen is disposed
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.fastfood,
              size: 150.0,
              color: Theme.of(context).primaryColorLight,
            ),
            SizedBox(height: 20.0),
            Text(
              Constants.appName,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColorLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
