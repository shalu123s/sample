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
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Dashboard")),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                ' SHOPS:',
               style: TextStyle(fontSize: 40, color: Colors.black38,
                  fontFamily: "Genos",
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.lightBlue,
                  decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.dashed,
                ),),
              GestureDetector(
                onTap: () {
                  print("Container was tapped");
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 4),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(6.0, 6.0),
                      ),
                    ],
                  ),
                  child: Image.network(
                    'https://www.shutterstock.com/shutterstock/photos/1852868299/display_1500/stock-photo--d-front-store-with-blank-store-signage-at-night-time-d-rendering-1852868299.jpg'),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
               const Text(' DRIVERS:',
               style: TextStyle(fontSize: 40, color: Colors.black38,
                  fontFamily: "Genos",
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.lightBlue,
                  decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.dashed,
                ),),
              GestureDetector(
                onTap: () {
                  print("Container was tapped");
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 4),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                        offset: Offset(6.0, 6.0),
                      ),
                    ],
                  ),
                  child: Image.network(
                    'https://www.shutterstock.com/shutterstock/photos/2176128311/display_1500/stock-vector--d-vector-delivery-van-with-box-cargo-delivery-and-online-shopping-concept-eps-vector-2176128311.jpg'
                  ),
                ),
              ),
            ],
          ),
        )
        );
  }
}
