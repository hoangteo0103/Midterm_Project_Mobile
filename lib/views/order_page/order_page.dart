import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/product.dart';
import 'package:flutter_test_2/views/cart/cart_screen.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../../models/cart.dart';
import 'components/details_screen_sections.dart';
import '../../theme.dart';
import './constants.dart';
import 'components/cup_size_container.dart';
import 'components/price_container.dart';
import 'components/sugar_container.dart';

class OrderPage extends StatefulWidget {
  final Product product;

  const OrderPage({Key? key, required this.product}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  int _num = 1 ;
  double _totalprice = 0;
  @override
  Widget build(BuildContext context) {
    _totalprice = widget.product.price;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset(widget.product.image,
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              fit: BoxFit.cover),
          DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              builder: (context, controller) {
                return Container(
                  child: ListView(
                    controller: controller,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PriceContainer(
                              property: "item_count",
                              itemCount: _num,
                              onChanged: _setValue,
                              product: widget.product,
                            ),
                            const CupSizeContainer(),
                            const SugarContainer(),
                            AddToCartCard(
                              totalPrice: _totalprice,
                              onChanged: _setPrice,
                              onPress: addItemToCart,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.circular(25)),
                );
              }),
          Positioned(
              top: 25,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                ),
              )),
          Positioned(
              top: 25,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ))
        ]),
      ),
    );
  }
  void _setValue(String property, int value) {
    setState(() {
      _num = (property == "item_count") ? value : _num;
      _setPrice();
    });
  }

  void _setPrice() {
    setState(() {
      _totalprice = widget.product.price * _num ;
    });
  }

  void addItemToCart()
  {
    final instance = ShoppingCart.getInstance<FoodModel>();
    final item = FoodModel(
      id : widget.product.id,
      price: widget.product.price,
      quantity: _num,
      name: widget.product.name,
      image:widget.product.image
    );
    instance.addItemToCart(item);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(),
      ),
    );
  }
}

