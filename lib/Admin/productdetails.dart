
import 'package:projefct/Admin/edit.dart';
import 'package:projefct/Admin/addproduct.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projefct/admindatabase/product.dart';
import 'package:projefct/Admin/dbfuntio.dart';

class ProductListingPage extends StatefulWidget {
  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  late Box<Product> _productBox = Hive.box<Product>('products');

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    _productBox = await Hive.openBox<Product>('products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: ValueListenableBuilder(
        valueListenable: productlist,
        builder: (context, List<Product> adminlist, Widget? child) {
          return ListView.builder(
            itemCount: adminlist.length,
            itemBuilder: (context, index) {
              final product = adminlist[index];
              final img = product.image;
              final imageready = img != null ? base64Decode(img) : null;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 241, 240, 240),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: (){
  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductEditingPage(
                                product: product,
                                index: index,
                                id: product.id!,
                              ),
                            ),
                          );
                      
                    },
                    child: ListTile(
                      leading: product.image != null
                          ? Image.memory(
                              imageready!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.image),
                            ),
                      title: Text(product.name),
                      subtitle: Text(product.category),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                        
                          delete(product.id!);
                        },
                      ),
                      //     IconButton(
                      //   icon: Icon(Icons.delete),
                      //   onPressed: () {
                      //     _productBox.delete(product.id);
                      //   },
                      // ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _navigateToAddPage();
        },
      ),
    );
  }

  void _navigateToAddPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductAddingPage()),
    );
  }
}
