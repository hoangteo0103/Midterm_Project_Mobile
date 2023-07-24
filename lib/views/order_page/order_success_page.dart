import 'package:flutter/material.dart';
import 'package:flutter_test_2/config/themes/text_style.dart';
import 'package:flutter_test_2/views/cart/cart_screen.dart';
import 'package:flutter_test_2/views/history/historypage.dart';

import '../../theme.dart';
import '../home/homepage.dart';

class OrderSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
              children: [

          Padding(
          padding: const EdgeInsets.only(top : 150, bottom: 20),
          child: Center(
              child: Image.asset('assets/images/take_away.png', scale: 1.4,)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text('Order Success', style: TxtStyle.heading1SemiBold),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Center(child: Text('Your order has been placed successfully.',
            textAlign: TextAlign.center, style: TxtStyle.heading4Light2,)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:80),
          child: Center(child: Text(
            'For more details, go to my orders.', textAlign: TextAlign.center,
            style: TxtStyle.heading4Light2,)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(selectedIndex: 3)));
          },
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(30)),
            child: const Text('Tracked My Order',
                style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18)),
          ),
        )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white
      ),
    )),
    );
  }
}