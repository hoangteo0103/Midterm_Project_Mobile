import 'package:flutter/material.dart';
import 'package:flutter_test_2/components/categories.dart';
import 'package:flutter_test_2/components/home_header.dart';
import 'package:flutter_test_2/components/product_card.dart';
import 'package:flutter_test_2/components/search_bar.dart';
import 'package:flutter_test_2/components/special_card.dart';
import 'package:flutter_test_2/models/product.dart';
import 'package:flutter_test_2/views/order_page/order_page.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../../components/loyaltycard.dart';
import '../../models/cart.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final instance = ShoppingCart.getInstance<FoodModel>();
    return ListView(

      children: [
        const Header(),
        LoyaltyCard(instance: instance),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            'Good Morning, David',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
        const searchBar(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            'Categories',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const Categories(),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF324A59),
            borderRadius: BorderRadius.circular(14)
          ),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                shrinkWrap: true, // You won't see infinite size error
                childAspectRatio: 0.64, // Adjust this value to change the height of the items

                children: products.map((e) {
                  return Builder(builder: (context) {
                    return ProductList(
                      product: e,
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderPage(product: e),
                          ),
                        );
                      },
                    );
                  });
                }).toList()),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            'Special Offer',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 24),
          ),
        ),
        const SpecialOfferCard()
      ],
    );
  }
}

