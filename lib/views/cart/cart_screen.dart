import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/cart.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_cart/shopping_cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final instance = ShoppingCart.getInstance<FoodModel>();
    return Scaffold(
      appBar: buildAppBar(context , instance),
      body: Body(instance : instance),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context , instance) {

    return AppBar(
      automaticallyImplyLeading : true,

      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Obx(() => Text(
            "${instance.cartItems.length} items",
            style: Theme.of(context).textTheme.caption,
          )),
        ],
      ),
    );
  }
}
