
import 'package:flutter_test_2/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_2/views/cart/cart_screen.dart';
import 'package:flutter_test_2/views/profile/profile_screen.dart';

import '../views/profile/stless/circle_avatar.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCircleAvatar(
              height: size.height / 13,
              width:  size.height / 13,
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProfileScreen()));              }
          ),
          Row(
            children: const [
              Icon(
                Icons.location_on_sharp,
                color: AppTheme.primaryColor,
              ),
              Text(
                'Ho Chi Minh City, Viet Nam',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>  CartScreen()));              },
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }
}
