import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'SecondPage.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MyHomePage(),
    );
  }
}
