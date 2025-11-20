import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final Category category;

  const ProductListScreen({super.key, required this.category});

  final List<Product> products = const [
    Product(
      id: '1',
      name: 'Bakso Special',
      price: 25000,
      categoryId: '1',
      icon: Icons.restaurant_menu,
      color: Colors.orange,
    ),
    Product(
      id: '2',
      name: 'Mie Ayam',
      price: 18000,
      categoryId: '1',
      icon: Icons.ramen_dining,
      color: Colors.orange,
    ),
    Product(
      id: '3',
      name: 'Es Teh Manis',
      price: 8000,
      categoryId: '2',
      icon: Icons.local_cafe,
      color: Colors.blue,
    ),
    Product(
      id: '4',
      name: 'Kopi Latte',
      price: 25000,
      categoryId: '2',
      icon: Icons.coffee,
      color: Colors.brown,
    ),
    Product(
      id: '5',
      name: 'Smartphone',
      price: 2500000,
      categoryId: '3',
      icon: Icons.smartphone,
      color: Colors.green,
    ),
    Product(
      id: '6',
      name: 'Laptop Gaming',
      price: 12000000,
      categoryId: '3',
      icon: Icons.laptop,
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProducts = products
        .where((product) => product.categoryId == category.id)
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          category.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: category.color,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Daftar Produk ${category.name}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${categoryProducts.length} produk tersedia',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: categoryProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: categoryProducts[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: categoryProducts[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}