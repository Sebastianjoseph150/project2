import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projefct/user/account.dart';
import 'package:projefct/user/details.dart';
import 'package:projefct/user/favbutton.dart';
import 'package:projefct/user/products/product.dart';
import 'navigationbar/home_view_model.dart';
import 'package:projefct/cart.dart';
// import 'package:projefct/user/navigationbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  final page = [
    const Homepage(),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Center(child: Text('camera cart')),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
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
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Featured Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            height: 200,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Banner(imageUrl: 'assets/user/banner.jpg'),
                  SizedBox(
                    width: 10,
                  ),
                  Banner(imageUrl: 'assets/user/banner.jpg'),
                  SizedBox(
                    width: 10,
                  ),
                  Banner(imageUrl: 'assets/user/banner.jpg'),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                  child: Text(
                    'Popular brands',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: HorizontalListView1(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'New Arrivals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
            ],
          ),
        ],
      ),
    );
  }
  //navaigation bar

  //
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
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorChangingButton(),
              Image.asset(
                imageUrl,
                height: 100,
                width: double.infinity,
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

// list category

class HorizontalListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => product()),
          );
        },
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/user/banner.jpg',
                  ), // Replace with your own image path
                ),
                Text('nikon'),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/user/banner.jpg',
                  ), // Replace with your own image path
                ),
                Text('canon'),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/user/cam3.jpg',
                  ), // Replace with your own image path
                ),
                Text('Fujifilim'),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/user/banner.jpg',
                  ), // Replace with your own image path
                ),
                Text('Philips'),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/user/banner.jpg',
                  ), // Replace with your own image path
                ),
                Text('Sony'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// banner

class Banner extends StatelessWidget {
  final String imageUrl;

  Banner({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   // context,
          //   // MaterialPageRoute(builder: (context) => Details()),
          // );
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Image.asset(
                  imageUrl,
                  height: 200,
                  width: 500, // Adjust the width of each item as needed
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
