import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projefct/Admin/dbfuntio.dart';
import 'package:projefct/admindatabase/product.dart';
// import 'package:projefct/user/products/product.dart';

class ProductAddingPage extends StatefulWidget {
  @override
  _ProductAddingPageState createState() => _ProductAddingPageState();
}

class _ProductAddingPageState extends State<ProductAddingPage> {
  final _formKey = GlobalKey<FormState>();
  final _productName = TextEditingController();
  final _productCategory = TextEditingController();
  final _productPrice = TextEditingController();
  File? _selectedImage;
  final _productdis = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(218, 212, 212, 209),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
              color: const Color.fromARGB(193, 255, 255, 255),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _selectImage,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: _selectedImage != null
                            ? Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.add_photo_alternate,
                                size: 50,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _productName,
                      decoration: InputDecoration(
                        fillColor: Color(0xABFFFEFE),
                        labelText: 'product name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a product name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _productName.text = value!;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _productCategory,
                      decoration: InputDecoration(
                        fillColor: Color(0xABFFFEFE),
                        labelText: 'product category',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a category';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _productCategory.text = value!;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _productPrice,
                      decoration: InputDecoration(
                        fillColor: Color(0xABFFFEFE),
                        labelText: 'product price',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter price';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _productdis.text = value!;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _productdis,
                      decoration: InputDecoration(
                        fillColor: Color(0xABFFFEFE),
                        labelText: 'product discrption',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter discribtion';
                        }
                        // if (double.tryParse(value) == null) {
                        //   return 'Please enter discribtion';
                        // }
                        return null;
                      },
                      onSaved: (value) {
                        _productdis.text = value!;
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.black), // Set the background color
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Set the text color
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          // Product product = Product(
                          //     name: _productName.text,
                          //     category: _productCategory.text,
                          //     price: _productPrice.text,
                          //     image: _selectedImage
                          //     description: _productdis.text);

                          _addProduct();
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Add Product'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _addProduct() async {
    final name = _productName.text;
    final cat = _productCategory.text;
    final price = _productPrice.text;
    final discrib = _productdis.text;

    final bytes = await _selectedImage!.readAsBytes();
    final String base64img = base64Encode(bytes);

    final details = Product(
        name: name,
        category: cat,
        price: price,
        description: discrib,
        image: base64img);
    _save(details);
  }

  Future<void> _save(Product value) async {
    final save = await Hive.openBox<Product>(dbname);
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
        id,
        Product(
            name: data!.name,
            category: data.category,
            price: data.price,
            description: data.description,
            image: data.image,
            id: id));
    getall();
  }
}

Future<void> getall() async {
  final save = await Hive.openBox<Product>(dbname);
  productlist.value.clear();
  productlist.value.addAll(save.values);
  productlist.notifyListeners();
}
