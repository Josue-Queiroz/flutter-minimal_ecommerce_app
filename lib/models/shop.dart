import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale

  final List<Product> _shop = [
    Product(
        name: 'Shoes 1',
        price: 199.99,
        description: 'Item 1 description additional',
        imagePath: 'lib/images/shoes-1.jpg'),
    Product(
        name: 'Shoes 2',
        price: 199.99,
        description: 'Item 2 description additional',
        imagePath: 'lib/images/shoes-2.jpg'),
    Product(
        name: 'Shoes 3',
        price: 199.99,
        description: 'Item 3 description additional',
        imagePath: 'lib/images/shoes-3.jpg'),
    Product(
        name: 'Shoes 4',
        price: 199.99,
        description: 'Item 4 description additional',
        imagePath: 'lib/images/shoes-4.jpg'),
    Product(
        name: 'Shoes 5',
        price: 199.99,
        description: 'Item 5 description additional',
        imagePath: 'lib/images/shoes-5.jpg'),
    Product(
        name: 'Shoes 6',
        price: 199.99,
        description: 'Item 6 description additional',
        imagePath: 'lib/images/shoes-6.jpg'),
  ];

  // user cart
  final List<Product> _cart = [];

  //get products list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
