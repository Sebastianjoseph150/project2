import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projefct/user/account.dart';
import 'package:projefct/user/address/address.dart';
import 'package:projefct/user/address/addresslist.dart';

class Details extends StatefulWidget {
  const Details({Key? key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Icons.favorite,
              color: Colors.black,
            ),
            onPressed: () {
              // // Perform search action
              // // final searchQuery = _searchController.text;
              // print('Search Query: $searchQuery');
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Image.asset(
                    'assets/user/cam1.png',
                    height: 300,
                    width: 500,
                    // fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Product 5',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Rs.45000',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'In The BoxMemory card, DK-25 Rubber Eyecup,\n BF-1B Body Cap, EN-EL14a Rechargeable \nLi-ion Battery (with Terminal Cover), AN-DC3 Strap, MH-24 Battery Charger \n(Plug Adapter Supplied in Countries or Regions where Required, Shape Depends on Country of Sale',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 18,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.black12),
                      height: 40,
                      width: 380,
                      // color: Colors.blue,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          // TODO: Add logic for adding the product to cart
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Product added to cart'),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Add to Cart'),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.black12),
                      height: 40,
                      width: 380,
                      // color: Colors.blue,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          // TODO: Add logic for adding the product to cart
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: Text('Buy Now'),
                          //       actions: [
                          //         TextButton(
                          //           child: Text('OK'),
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //           },
                          //         ),
                          //       ],
                          //     );

                          //   },
                          // );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => shippingaddress()),
                          );
                        },
                        child: Text('Buy Now'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//                     decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(10)),
//                     height: 40,
//                     width: 40,
//                     child: IconButton(
//                       onPressed: () {
//                         // TODO: Add logic for adding the product to favorites
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text('Product added to favorites'),
//                               actions: [
//                                 TextButton(
//                                   child: Text('OK'),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       icon: Icon(Icons.favorite_border_outlined),
//                     ),
//                   ),