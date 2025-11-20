import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String categoryId;
  final IconData icon;
  final Color color;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.icon,
    required this.color,
  });
}