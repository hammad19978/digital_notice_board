import 'package:digital_notice_board/Digital_notice_board.dart';
import 'package:digital_notice_board/admin.dart';
import 'package:digital_notice_board/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DigitalNoticeBoard(),
    );
  }
}

