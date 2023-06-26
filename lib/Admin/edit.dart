import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projefct/Admin/dbfuntio.dart';
import 'package:projefct/admindatabase/product.dart';
import 'package:projefct/user/products/product.dart';

class ProductEditingPage extends StatefulWidget {
  final product;
  final int id;
  final int index;

  ProductEditingPage(
      {required this.product, required this.index, required this.id});

  @override
  _ProductEditingPageState createState() => _ProductEditingPageState();
}

class _ProductEditingPageState extends State<ProductEditingPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _productName;
  late TextEditingController _productCategory;
  late TextEditingController _productPrice;
  File? _selectedImage;
  late TextEditingController _productdis;

  @override
  void initState() {
    super.initState();
    _productName = TextEditingController(text: widget.product.name);
    _productCategory = TextEditingController(text: widget.product.category);
    _productPrice = TextEditingController(text: widget.product.price);
    _productdis = TextEditingController(text: widget.product.description);
  }

  // @override
  // void dispose() {
  //   _productName.dispose();
  //   _productCategory.dispose();
  //   _productPrice.dispose();
  //   _productdis.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final img = widget.product.image;
    final editimg = base64Decode(img);
    return Scaffold(
      backgroundColor: Color.fromARGB(218, 212, 212, 209),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Edit your product'),
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
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
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
                              : Image.memory(editimg)),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _productName,
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a product name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _productCategory,
                      decoration: InputDecoration(
                        labelText: 'Product Category',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a category';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _productPrice,
                      decoration: InputDecoration(
                        labelText: 'Product Price',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid price';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _productdis,
                      decoration: InputDecoration(
                        labelText: 'Product Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
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

                          widget.product.name = _productName.text;
                          widget.product.category = _productCategory.text;
                          widget.product.price = _productPrice.text;
                          widget.product.description = _productdis.text;
                          widget.product.image =
                              base64Encode(_selectedImage!.readAsBytesSync());

                          _updateProduct();
                          setState(() {});
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Save Changes'),
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
    final _selectedimg1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_selectedimg1 != null) {
      setState(() {
        _selectedImage = File(_selectedimg1.path);
      });
    }
  }

  Future<void> _updateProduct() async {
    final newlist = productlist.value;
    final updateBox = await Hive.openBox<Product>(dbname);
    final updatedProduct = Product(
        name: _productName.text,
        category: _productCategory.text,
        price: _productPrice.text,
        image: base64Encode(_selectedImage!.readAsBytesSync()),
        description: _productdis.text,
        id: widget.id);

    await updateBox.put(widget.id, updatedProduct);
    newlist[widget.index] = updatedProduct;
    productlist.notifyListeners();
  }
}
// class editpage1 extends StatefulWidget {
//   const editpage1({super.key});

//   @override
//   State<editpage1> createState() => _editpage1State();
// }

// class _editpage1State extends State<editpage1> {
//     final _formKey = GlobalKey<FormState>();
//       late TextEditingController _productName;
//   late TextEditingController _productCategory;
//   late TextEditingController _productPrice;
//   File? _selectedImage;
//   late TextEditingController _productdis;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( appBar: AppBar(
//         title: Text('Edit Product'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               GestureDetector(
//                 onTap: _selectImage,
//                 child: Container(
//                     width: 150,
//                     height: 150,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: _selectedImage != null
//                         ? Image.file(
//                             _selectedImage!,
//                             fit: BoxFit.cover,
//                           )
//                         : Image.memory(editimg)),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _productName,
//                 decoration: InputDecoration(
//                   labelText: 'Product Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a product name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _productCategory,
//                 decoration: InputDecoration(
//                   labelText: 'Product Category',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a category';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _productPrice,
//                 decoration: InputDecoration(
//                   labelText: 'Product Price',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a price';
//                   }
//                   if (double.tryParse(value) == null) {
//                     return 'Please enter a valid price';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _productdis,
//                 decoration: InputDecoration(
//                   labelText: 'Product Description',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();

//                     // widget.product.name = _productName.text;
//                     // widget.product.category = _productCategory.text;
//                     // widget.product.price = _productPrice.text;
//                     // widget.product.description = _productdis.text;
//                     // widget.product.image =
//                     //     base64Encode(_selectedImage!.readAsBytesSync());

//                     _updateProduct(widget.product);
//                     setState(() {});
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Save Changes'),
//               ),
//             ],
//           ),
//         ),
//       ),);
//   }
// }
