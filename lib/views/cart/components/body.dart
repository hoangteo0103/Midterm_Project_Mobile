import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_test_2/constants/size_config.dart';
import 'package:flutter_test_2/views/cart/components/cart_card.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../../../models/cart.dart';
//import 'cart_card.dart';

class Body extends StatefulWidget {
  dynamic instance ;
  Body({required this.instance});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final instance = ShoppingCart.getInstance<FoodModel>();

    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Obx( () => ListView.builder(
        itemCount: instance.itemCount,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(instance.cartItems[index].id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                instance.removeItemFromCart(instance.cartItems[index]);
                instance.refreshCart();
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart : instance.cartItems[index]),
          ),
        ),
      )),
    );
  }
}
