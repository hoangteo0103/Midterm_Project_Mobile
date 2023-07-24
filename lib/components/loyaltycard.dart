import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_2/config/themes/text_style.dart';
import 'package:flutter_test_2/models/information.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../models/cart.dart';

class LoyaltyCard extends StatefulWidget {
  const LoyaltyCard({
    super.key,
    required this.instance,
  });

  final Cart<FoodModel> instance;

  @override
  State<LoyaltyCard> createState() => _LoyaltyCardState();
}

class _LoyaltyCardState extends State<LoyaltyCard> {
  @override
  Widget build(BuildContext context) {
    final instance = ShoppingCart.getInstance<InfoModel>();
    return Padding(
      padding: EdgeInsets.all(16), // Adding overall padding
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        // Adding padding for the container
        decoration: BoxDecoration(
          color: Color(0xFF324A59),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Loyalty Card', style: TxtStyle.heading3Light2),
                Text('5' + ' / 8',
                    style: TxtStyle.heading3Light2)
              ],
            ),
            SizedBox(height: 8),
            // Adding vertical spacing between the Row and the Container with SVG images
            Container(
              padding: EdgeInsets.all(15),
              // Adding padding for the SVG images container
              child: Center(
                child: Row(
                  children: [
                    for (int index = 0; index < 8; index++)
                      SvgPicture.asset(
                        index < 5 ? 'assets/cup_blur.svg' : 'assets/cup.svg',
                        height: 35,
                      ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
