import 'package:flutter/material.dart';
import 'package:projefct/user/cart/button.dart';
// import 'package:ui_screens/ex.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(0, 211, 211, 211),
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
                  // final searchQuery = _searchController.text;
                  // print('Search Query: $searchQuery');
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                ProductCards(
                    image: 'assets/user/cam1.png',
                    productName: 'Nikon 5600| Dslr',
                    productPrice: '79999'),
                SizedBox(
                  height: 5,
                ),
                ProductCards(
                    image: 'assets/user/cam2.png',
                    productName: 'Nikon 5600| Dslr',
                    productPrice: '7999'),
                SizedBox(
                  height: 5,
                ),
                ProductCards(
                    image: 'assets/user/cam3.png',
                    productName: 'nikon 5600| Dslr ',
                    productPrice: '49999'),
                SizedBox(
                  height: 5,
                ),
                ProductCards(
                    image: 'assets/user/cam2.png',
                    productName: 'Nikon 5600| Dslr ',
                    productPrice: '49999'),
                SizedBox(
                  height: 10,
                ),
                ProductCards(
                    image: 'assets/user/cam3.png',
                    productName: 'Nikon 5600| Dslr ',
                    productPrice: '49999'),
                SizedBox(
                  height: 10,
                ),
                ProductCards(
                    image: 'assets/user/cam2.png',
                    productName: 'Nikon 5600| Dslr ',
                    productPrice: '49999'),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   height: 150,
                //   width: 360,
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: Colors.black,
                //       width: .0,
                //     ),
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCards extends StatefulWidget {
  late String image;
  late String productName;
  late String productPrice;
  ProductCards(
      {super.key,
      required this.image,
      required this.productName,
      required this.productPrice});

  @override
  State<ProductCards> createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    String image = widget.image;
    String productName = widget.productName;
    String productPrice = widget.productPrice;
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: Card(
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      height: 80,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text(
                          '1 piece',
                          style: TextStyle(fontSize: 10),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '₹$productPrice',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        const Text(
                          'In stock',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete)),
                      QuantityButton(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
