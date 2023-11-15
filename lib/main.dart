import 'package:flutter/material.dart';
import 'package:pagination_app/src/screens/login.dart';
import 'package:pagination_app/src/screens/signup.dart';

import 'src/screens/dashboard.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const DashboaedScreen(),
    );
  }

}
