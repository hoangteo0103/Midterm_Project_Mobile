import 'package:flutter_test_2/components/category_card.dart';
import 'package:flutter_test_2/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(
            iconData: 'assets/coffee-cup-coffee-svgrepo-com.svg',
            title: 'Cappucino',
            isSelected: true,
          ),
          CategoryItem(
            iconData: 'assets/coffee-svgrepo-com.svg',
            title: 'Coca cola',
            isSelected: false,
          ),
          CategoryItem(
            iconData: 'assets/coffee-svgrepo-com.svg',
            title: 'Expresso',
            isSelected: false,
          )
        ],
      ),
    );
  }
}
