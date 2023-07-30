import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_2/config/themes/text_style.dart';
import 'package:flutter_test_2/models/information.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../models/cart.dart';
import '../views/gift/redeempage.dart';

class PointCard extends StatefulWidget {
  const PointCard({
    super.key,
    required this.instance,
  });

  final Cart<FoodModel> instance;

  @override
  State<PointCard> createState() => _PointCardState();
}

class _PointCardState extends State<PointCard> {
  BehaviorSubject<String> _dataSubject = BehaviorSubject<String>();
  String data =
      "Data will be displayed here"; // Default data if file reading fails

  @override
  void initState() {
    super.initState();
    _readDataFromFile();
    _startFileWatcher();
  }

  Future<void> _readDataFromFile() async {
    try {
      Directory appDocumentsDirectory =
      await getApplicationDocumentsDirectory();
      String filePath = "${appDocumentsDirectory.path}/num_loyalty.txt";
      // Read the data from the file.
      File file = File(filePath);
      if (!file.existsSync()) {
        await file.create();
        await file.writeAsString('0'); // Write "0" into the file.
      }
      data = await file.readAsString();
      _dataSubject.add(data);
    } catch (e) {
      print("Error reading file: $e");
    }
  }

  Future<void> _startFileWatcher() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String filePath = "${appDocumentsDirectory.path}/num_loyalty.txt";
    print(filePath);
    // You can adjust the debounce duration as needed to avoid too frequent updates.
    File file = File(filePath);
    file.watch(events: FileSystemEvent.modify).listen((event) {
      _readDataFromFile();
    });
  }

  @override
  void dispose() {
    _dataSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final instanceInfo = ShoppingCart.getInstance<InfoModel>();
    return Padding(
      padding: EdgeInsets.all(16), // Adding overall padding
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        // Adding padding for the container
        decoration: BoxDecoration(
          color: Color(0xFF324A59),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 12.0, top: 19, left: 15),
                      child: Text(
                        "My Points:",
                        style: TxtStyle.heading21,
                      ),
                    ),
                    Obx( () => Text(
                      "${instanceInfo.cartItems[1].quantity}",
                      style: TxtStyle.heading22,
                    ))
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: -10,
              right: -10,
              child: SvgPicture.asset(
                'assets/flower.svg',
                // Replace with the actual path to your SVG asset
                width: 50,
                height: 50,
              ),
            ),
            Positioned(
              height: 30,
              bottom: 25,
              right: 20,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  primary: Colors.white,
                  backgroundColor: Color(0xffA2CDE9).withOpacity(0.19),
                ),
                child: Text(
                  "Redeem drinks",
                  style: TextStyle(
                    fontSize: 9,
                    height: 0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => RedeemPage(),
                ),
                )},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
