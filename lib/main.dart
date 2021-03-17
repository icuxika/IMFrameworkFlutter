import 'package:flutter/material.dart';
import 'package:im_framework_flutter/home.dart';

void main() {
  runApp(FrameworkApp());
}

class FrameworkApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
