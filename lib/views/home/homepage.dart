import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_2/theme.dart';
import 'package:flutter_test_2/views/cart/cart_screen.dart';
import 'package:flutter_test_2/views/gift/gift_page.dart';
import 'package:flutter_test_2/views/history/historypage.dart';
import 'package:flutter_test_2/views/home/menupage.dart';
import 'package:flutter_test_2/views/profile/profile_screen.dart';

class HomePage extends StatefulWidget {
  int  selectedIndex = 0;
  HomePage({Key? key ,required this.selectedIndex}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(selectedIndexTab: selectedIndex);
}

class _HomePageState extends State<HomePage> {
  int selectedIndexTab ;
  _HomePageState({required this.selectedIndexTab});

  void _onItemTapped(int index) {
    setState(() {
      selectedIndexTab = index;
    });
  }

  initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
    });
  }

  static  List<Widget> _widgetOptions = <Widget>[
    MenuPage(),
    GiftPage(),
    CartScreen(),
    HistoryPage(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard_outlined,
                size: 28,
              ),
              label: 'Gift'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 28,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history_outlined,
                size: 28,
              ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
                size: 28,
              ),
              label: 'Profile'),
        ],
        currentIndex: selectedIndexTab,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(selectedIndexTab),
    );
  }
}
