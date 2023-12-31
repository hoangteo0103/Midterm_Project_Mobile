import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_2/components/default_button.dart';
import 'package:flutter_test_2/constants/constants.dart';
import 'package:flutter_test_2/constants/size_config.dart';
import 'package:flutter_test_2/models/history.dart';
import 'package:flutter_test_2/models/information.dart';
import 'package:flutter_test_2/views/order_page/order_success_page.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../../../models/cart.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    final instance = ShoppingCart.getInstance<FoodModel>();
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(15),
            horizontal: getProportionateScreenWidth(30),
          ),
          // height: 174,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15),
              )
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: getProportionateScreenWidth(40),
                      width: getProportionateScreenWidth(40),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset("assets/icons/receipt.svg"),
                    ),
                    Spacer(),
                    Text("Add voucher code"),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kTextColor,
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text: "\$${instance.cartTotal}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(190),
                      child: DefaultButton(
                        text: "Check Out",
                        press: () {
                          if(instance.totalCartPriceInt != 0) {
                            final instanceInfo = ShoppingCart.getInstance<InfoModel>();
                            final instanceHistory = ShoppingCart.getInstance<HistoryModel>();
                            int totalQuantity = 0 ;
                            String totalName = "";
                            for(var i in instance.cartItems)
                            {
                              totalQuantity+= i.quantity;
                              totalName+=" " + i.name;
                            }
                            instanceInfo.cartItems[1].quantity+=totalQuantity * 12 ;
                            instanceInfo.cartItems[0].quantity = min ( 8 , instanceInfo.cartItems[0].quantity +totalQuantity);
                            HistoryModel.index++;
                            final item = HistoryModel(
                                id : HistoryModel.index,
                                price: instance.cartTotal,
                                quantity: 1,
                                name: totalName,
                            );
                            instanceHistory.addItemToCart(item);
                            instance.clearCart();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderSuccessPage(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
