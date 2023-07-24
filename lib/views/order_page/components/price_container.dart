import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/product.dart';

import '../constants.dart';

class PriceContainer extends StatefulWidget {
  final String property;
  final Function onChanged;

  final int itemCount;
  final Product product;

  const PriceContainer({
    required this.property,
    Key? key,
    required this.onChanged,
    required this.itemCount,
    required this.product,
  }) : super(key: key);

  @override
  _PriceContainerState createState() => _PriceContainerState();
}

class _PriceContainerState extends State<PriceContainer> {
  int _item_count = 1;

  @override
  Widget build(BuildContext context) {
    _item_count = widget.itemCount;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name,
                style: kProductNameStyle,
              ),
              Row(
                children: [
                  Text(
                    '\$',
                    style: TextStyle(
                        color: kPrimaryColor, fontFamily: 'sen', fontSize: 24),
                  ),
                  Text(
                    '${widget.product.price}',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: 'sen',
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (_item_count > 1) {
                    setState(() {
                      _item_count--;
                      widget.onChanged(widget.property, _item_count);

                    });
                  }
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Color(0xff027C18),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                    ),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 36,
                width: 36,
                child: Center(
                    child: Text(
                  '$_item_count',
                  style: TextStyle(
                      fontFamily: 'sen',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
              ),
              GestureDetector(
                onTap: () {
                  if (_item_count < 9) {
                    setState(() {
                      _item_count++;
                      widget.onChanged(widget.property, _item_count);

                    });
                  }
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Color(0xff027C18),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(30),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
