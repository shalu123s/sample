import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Driver_list(),
    );
  }
}

Driver_list() {
  Container(
      width: 393,
      height: 932,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(children: <Widget>[
        Positioned(
            top: 121,
            left: 43,
            child: Container(
                width: 340,
                height: 110,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ))),
        Positioned(
            top: 601,
            left: 43,
            child: Container(
                width: 340,
                height: 110,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ))),
        Positioned(
            top: 441,
            left: 43,
            child: Container(
                width: 340,
                height: 110,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ))),
      ]));
}
