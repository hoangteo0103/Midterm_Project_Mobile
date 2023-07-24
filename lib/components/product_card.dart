import 'package:flutter/material.dart';
import 'package:flutter_test_2/theme.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product ;

  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(3, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: MediaQuery.of(context).size.width / 2 - 24,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(4),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.all(4),
                  height: MediaQuery.of(context).size.width / 2 - 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      // Use AssetImage to load image from asset
                      fit: BoxFit
                          .cover, // Optional: Adjust the fit based on your use case
                    ),
                  )),
               Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 4),
                child: Text(
                  product.name  ,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
               Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'without sugar',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '\$'+'${product.price}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          const Positioned(
              bottom: 8,
              right: 8,
              child: CircleAvatar(
                  backgroundColor: AppTheme.primaryColor,
                  child: Icon(Icons.add))),
          Positioned(
              top: 14,
              right: 14,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme.secondaryColor.withOpacity(.8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.star, color: Colors.white),
                    Text(
                      '4,5',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final Product product;
  final VoidCallback onPress;

  const ProductList({
    Key? key,
    required this.onPress,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Flexible(child: ProductCard(product: this.product)),
    );
  }
}
