import 'package:flutter/material.dart';
import 'package:flutter_test_2/components/loyaltycard.dart';
import 'package:flutter_test_2/components/pointcard.dart';
import 'package:flutter_test_2/models/product.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../../models/cart.dart';

class GiftPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final instance = ShoppingCart.getInstance<FoodModel>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Rewards",
            style: TextStyle(
                color: Color(0xff324A59),
                fontWeight: FontWeight.w500,
                fontSize: 21),),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView(children: [
          LoyaltyCard(instance: instance),
          PointCard(instance: instance),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Text(
              'History Rewards',
              style: TextStyle(
                  color: Color(0xff324A59),
                  fontWeight: FontWeight.w500,
                  fontSize: 21),
            ),
          ),
           ListView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context , index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                products[index].name,
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF324A59),fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "+12pts",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xff324A59),fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Text(
                            "24 June | 12:30 PM",
                            style: TextStyle(fontSize: 10, color: Color(0xFF324A59).withOpacity(0.6)),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    );
                  }
                ),
        ])));
  }
}
