import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DashboaedScreen extends StatefulWidget {
  const DashboaedScreen({super.key});

  @override
  State<DashboaedScreen> createState() => _DashboaedScreenState();
}

class _DashboaedScreenState extends State<DashboaedScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dashboard")),
        backgroundColor: Colors.lightBlueAccent,
        ),

        body: Container(
         
          child: Column(),
        ),
    );
  }
}