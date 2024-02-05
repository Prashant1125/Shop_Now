import 'package:flutter/material.dart';
import 'package:shopping/modals/product.dart';

import '../customui/product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.productlist});
  final List<Product> productlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue.shade300,
          onPressed: () {},
          label: const Text(
            'Buy Now',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          icon: const Icon(
            Icons.shopping_cart,
            size: 25,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: productlist.length,
        itemBuilder: (ctx, i) {
          return ProductCard(
            product: productlist[i],
            onTap: () {},
          );
        },
      ),
    );
  }
}
