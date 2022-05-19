import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({ Key? key }) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text("THIS IS FOR TESTING PURPOSE!"),
      )
    );
  }
}