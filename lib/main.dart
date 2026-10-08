import 'package:flutter/material.dart';
import 'package:printflow/resources/textplaceholder.dart';
import 'package:printflow/resources/themeresource.dart';
import 'package:printflow/screens/appflow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: apptheme(),
      home: const AppFlow(),
    );
  }
}
