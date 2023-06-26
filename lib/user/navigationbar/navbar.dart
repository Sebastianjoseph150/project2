import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projefct/user/Home.dart';
import 'package:projefct/user/account.dart';
import 'package:projefct/cart.dart';
import 'package:projefct/user/products/product.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final screens = [
    Homepage(),
    CataloguePage(),
    AdditionalInformation(),
  ];

  @override
  Widget build(BuildContext context) {
    // getAllDetails();
    return Scaffold(
        backgroundColor: Colors.white,
        body: screens[_currentIndex],
        bottomNavigationBar: GNav(
          gap: 10,
          onTabChange: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          tabs: [
            GButton(
              // backgroundColor: Colors.amber,

              icon: Icons.home_outlined,
              iconActiveColor: Colors.black,
              text: 'Home',
              textColor: Colors.black,
            ),
            // GButton(
            //   icon: Icons.favorite_border_rounded,
            //   iconActiveColor: Colors.green.shade900,
            //   text: 'Wishlists',
            //   textColor: Colors.green.shade900,
            // ),
            GButton(
              icon: Icons.trolley,
              iconActiveColor: Colors.black,
              text: 'cart',
              textColor: Colors.black,
            ),
            GButton(
              icon: Icons.person,
              iconActiveColor: Colors.black,
              text: 'Accounts',
              textColor: Colors.black,
            ),
          ],
        ));
  }
}
