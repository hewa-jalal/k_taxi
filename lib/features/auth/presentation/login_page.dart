import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math; // import this

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Lottie.asset(
                'assets/lottie/intro_taxi.json',
                // reverse: true
              ),
            ),
          ],
        ),
      ),
    );
  }
}
