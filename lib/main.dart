import 'package:flutter_test_2/models/history.dart';
import 'package:flutter_test_2/models/history_order.dart';
import 'package:flutter_test_2/models/information.dart';
import 'package:flutter_test_2/theme.dart';
import 'package:flutter_test_2/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:shopping_cart/shopping_cart.dart';

import 'models/cart.dart';
import 'models/product.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    ShoppingCart.init<FoodModel>();
    ShoppingCart.init<InfoModel>();
    ShoppingCart.init<HistoryModel>();
    ShoppingCart.init<HistoryOrderModel>();

    final instance = ShoppingCart.getInstance<InfoModel>();
    final instanceHistoryOrder = ShoppingCart.getInstance<HistoryOrderModel>();
    var item = InfoModel(
        id : 1,
        price: 0,
        quantity: 4,
        name: "loyaltycard",
    );
    instance.addItemToCart(item);
    item = InfoModel(
      id : 2,
      price: 0,
      quantity: 2750,
      name: "point",
    );

    var itemHistoryOrder = HistoryOrderModel(
      id : ++HistoryModel.index,
      price: products[0].price,
      quantity: 1,
      name: products[0].name,
    );
    instanceHistoryOrder.addItemToCart(itemHistoryOrder);
    itemHistoryOrder = HistoryOrderModel(
      id : ++HistoryModel.index,
      price: products[3].price,
      quantity: 1,
      name: products[3].name,
    );

    instanceHistoryOrder.addItemToCart(itemHistoryOrder);
    instance.addItemToCart(item);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          scaffoldBackgroundColor: AppTheme.whiteColor,
          inputDecorationTheme: FilledOrOutlinedTextTheme(
          radius: 8,
          contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          errorStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          fillColor: Colors.transparent,
          prefixIconColor: AppTheme.primaryColor,
          enabledColor: Colors.grey,
          focusedColor: Colors.green,
          floatingLabelStyle: const TextStyle(color: AppTheme.primaryColor),
          width: 1.5,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.black),)),
      home: const SplashScreen(),
    );
  }
}
