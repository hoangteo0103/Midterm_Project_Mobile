import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test_2/config/themes/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_2/models/history.dart';
import 'package:flutter_test_2/models/product.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../../models/history_order.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Widget build(BuildContext context) {
    final instanceHistory = ShoppingCart.getInstance<HistoryModel>();
    final instanceHistoryOrder = ShoppingCart.getInstance<HistoryOrderModel>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Color(0xff324A59),
            tabs: [
              Tab(
                  icon: Text(
                "On Going",
                style: TxtStyle.headingFINAL2,
              )),
              Tab(
                  icon: Text(
                "History",
                style: TxtStyle.headingFINAL2,
              )),
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "My Order",
            style: TxtStyle.headingFINAL,
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: instanceHistory.cartItems.length ,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20),
                child: Dismissible(
                  key: Key(instanceHistory.cartItems[index].id.toString()),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    setState(() {
                      HistoryOrderModel.index++;
                      final item = HistoryOrderModel(
                        id : HistoryOrderModel.index,
                        price: instanceHistory.cartItems[index].price,
                        quantity: 1,
                        name: instanceHistory.cartItems[index].name,
                      );
                      instanceHistoryOrder.addItemToCart(item);
                      instanceHistory.cartItems.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/arrow_right.svg"),
                      ],
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffF4F5F7),
                          // Customize the border color as needed
                          width: 1.0, // Adjust the border width as needed
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "24 June | 12:30 PM",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFF324A59).withOpacity(0.6)),
                            ),
                            Text(
                              "\$${instanceHistory.cartItems[index].price}",
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xff324A59),fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.coffee, color: Color(0xFF324A59)), // Replace with your desired icon
                            SizedBox(width: 8), // Adjust the spacing between the icon and the text
                            Text(
                              "${instanceHistory.cartItems[index].name}",
                              style: TextStyle(fontSize: 10, color: Color(0xFF324A59)),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF324A59)), // Replace with your desired icon
                            SizedBox(width: 8), // Adjust the spacing between the icon and the text
                            Text(
                              "3 Addersion Court Chino Hills, HO56824, United State",
                              style: TextStyle(fontSize: 10, color: Color(0xFF324A59)),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: instanceHistoryOrder.cartItems.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffF4F5F7),
                          // Customize the border color as needed
                          width: 1.0, // Adjust the border width as needed
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "24 June | 12:30 PM",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFF324A59).withOpacity(0.6)),
                            ),
                            Text(
                              "\$${instanceHistoryOrder.cartItems[index].price}",
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xff324A59).withOpacity(0.6),fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.coffee, color: Color(0xFF324A59)), // Replace with your desired icon
                            SizedBox(width: 8), // Adjust the spacing between the icon and the text
                            Text(
                              "${instanceHistoryOrder.cartItems[index].name}",
                              style: TextStyle(fontSize: 10, color: Color(0xFF324A59).withOpacity(0.6)),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF324A59)), // Replace with your desired icon
                            SizedBox(width: 8), // Adjust the spacing between the icon and the text
                            Text(
                              "3 Addersion Court Chino Hills, HO56824, United State",
                              style: TextStyle(fontSize: 10, color: Color(0xFF324A59).withOpacity(0.6)),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
