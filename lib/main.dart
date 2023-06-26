import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projefct/admindatabase/product.dart';
import 'package:projefct/Admin/productdetails.dart';
import 'package:projefct/Admin/addproduct.dart';
import 'package:projefct/Admin/edit.dart';
import 'package:projefct/user/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Check if the adapter is already registered
  if (!Hive.isAdapterRegistered(ProductAdapter().typeId)) {
    // Register the ProductAdapter
    Hive.registerAdapter(ProductAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(),
      ),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getall();
    return Scaffold(
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}
