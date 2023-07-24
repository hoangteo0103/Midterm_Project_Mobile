import 'package:flutter/material.dart';
import 'package:flutter_test_2/theme.dart';

class AddToCartCard extends StatefulWidget {

  final double totalPrice;
  final Function onChanged;
  final VoidCallback onPress ;

  const AddToCartCard({
    required this.onChanged,
    required this.onPress,
    required this.totalPrice,
    Key? key,
  }) : super(key: key);

  @override
  State<AddToCartCard> createState() => _AddToCartCardState();
}

class _AddToCartCardState extends State<AddToCartCard> {
  double _totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    _totalPrice = widget.totalPrice;
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff027C18), borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('Add to cart     ',
                style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18)),
            SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: Colors.white,
                )),
            Text('\$${_totalPrice}',
                style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
