import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyShopMini());
}

class MyShopMini extends StatelessWidget {
  const MyShopMini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}