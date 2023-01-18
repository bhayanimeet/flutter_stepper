import 'package:flutter/material.dart';

import '../res/global.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your profile"),
        centerTitle: true,
        backgroundColor: const Color(0xfff54437),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${Global.name}"),
            Text("${Global.email}"),
            Text("${Global.password}"),
          ],
        ),
      ),
    );
  }
}