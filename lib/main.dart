import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:pr_1_4/views/screens/stepper.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Splash(),
        'step': (context) => const HomePage(),
      },
    ),
  );
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'step'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
          child: FlutterLogo(size: 300,textColor: Colors.black,style: FlutterLogoStyle.horizontal),
        ),
      ),
    );
  }
}
