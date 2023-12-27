import 'package:flutter/material.dart';

class BasicProfile extends StatefulWidget {
  const BasicProfile({Key? key}) : super(key: key);

  @override
  _BasicProfileState createState() => _BasicProfileState();
}

class _BasicProfileState extends State<BasicProfile> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Basic"),
    );
  }
}
