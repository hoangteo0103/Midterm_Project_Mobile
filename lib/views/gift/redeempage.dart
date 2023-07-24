import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';


class RedeemPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Redeem",
            style: TextStyle(
                color: Color(0xff324A59),
                fontWeight: FontWeight.w500,
                fontSize: 21),),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView.builder(itemBuilder: (context,index){
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          products[index].name,
                          style: TextStyle(fontSize: 15, color: Color(0xff324A59)),
                        ),
                        subtitle: Text(
                          "Valid until 25.07.23",
                          style: TextStyle(fontSize: 10),
                        ),
                        leading: Image.asset(products[index].image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add the action you want to perform when the button is pressed
                          // For example, you can use Navigator to navigate to another screen.
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF324A59), // Set the background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50), // Set the radius
                          ),
                        ),
                        child: Text(
                          '1340 pts',
                          style: TextStyle(color: Colors.white,fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                ),
              );


            },itemCount: products.length,)));
  }
}
