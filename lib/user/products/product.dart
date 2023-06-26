import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projefct/user/account.dart';
import 'package:projefct/user/details.dart';
import 'package:projefct/user/favbutton.dart';
import 'package:projefct/user/navigationbar/home_view_model.dart';
// import 'package:projefct/user/navigationbar.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => productState();
}

class productState extends State<product> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  final page = [
    const product(),
  ];

  final List<Widget> _screens = [
    // Add more screens here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 244, 244),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'camera cart',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              // Perform search action
              final searchQuery = _searchController.text;
              print('Search Query: $searchQuery');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ProductCard(
                imageUrl: 'assets/user/cam1.png',
                name: 'Product 4',
                price: '\$12.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam2.png',
                name: 'Product 5',
                price: '\$8.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam3.png',
                name: 'Product 6',
                price: '\$24.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam1.png',
                name: 'Product 7',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam2.png',
                name: 'Product 8',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam3.png',
                name: 'Product 9',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam1.png',
                name: 'Product 10',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam2.png',
                name: 'Product 11',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam2.png',
                name: 'Product 12',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam3.png',
                name: 'Product 13',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam2.png',
                name: 'Product 14',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam2.png',
                name: 'Product 15',
                price: '\$17.99',
              ),
              ProductCard(
                imageUrl: 'assets/user/cam3.png',
                name: 'Product 16',
                price: '\$17.99',
              ),
            ],
          ),
        ],
      ),
    );
  }
  //navaigation bar
}

// product card

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all(width: 0.1)),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorChangingButton(),
              Image.asset(
                imageUrl,
                height: 100,
                width: 200,
                // fit: BoxFit.cover,
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  price,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
