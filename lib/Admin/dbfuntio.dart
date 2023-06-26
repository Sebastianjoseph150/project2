import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:projefct/Admin/addproduct.dart';
import 'package:projefct/admindatabase/product.dart';
import 'package:projefct/user/products/product.dart';

ValueNotifier<List<Product>> productlist = ValueNotifier([]);
String dbname = 'dbname';

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
  _getall(value);
}

Future<void> _getall(Product value) async {
  final save = await Hive.openBox<Product>(dbname);
  productlist.value.clear();
  productlist.value.addAll(save.values);
  productlist.notifyListeners();
}

Future<void> delete(int id) async {
  final remove = await Hive.openBox<Product>(dbname);
  remove.delete(id);
  getall();
}
