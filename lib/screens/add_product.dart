import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/customui/product_card.dart';
import 'package:shopping/screens/cartscreen.dart';

import '../modals/product.dart';

// for getting device height and width
late Size mq;

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // Containg all the items or list of available products
  final List<Product> productlist = [
    Product(title: 'Bag', price: '249', image: 'assets/images/bag.png'),
    Product(title: 'Blazer', price: '2499', image: 'assets/images/blazer.png'),
    Product(
        title: 'Crickt Ball',
        price: '1999',
        image: 'assets/images/cricket.png'),
    Product(
        title: 'Shirt',
        price: '499',
        image: 'assets/images/hawaiian-shirt.png'),
    Product(
        title: 'Airbuds', price: '2500', image: 'assets/images/headphones.png'),
    Product(title: 'Laptop', price: '65000', image: 'assets/images/laptop.png'),
    Product(
        title: 'Shoes', price: '799', image: 'assets/images/running-shoes.png'),
    Product(
        title: 'Mobile', price: '25000', image: 'assets/images/smartphone.png'),
    Product(title: 'Tshirt', price: '250', image: 'assets/images/tshirt.png'),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Add Product',
          style: TextStyle(color: Colors.white),
        ),
        // Add home icon
        leading: const Icon(
          Icons.home,
          size: 25,
          color: Colors.white,
        ),
        actions: [
          //Add shopping cart button
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(
                        builder: (_) => CartScreen(
                              productlist: productlist
                                  .where((e) => e.isAdded == true)
                                  .toList(),
                            )))
                    .then((value) {
                  setState(() {
                    productlist;
                  });
                });
              },
              tooltip: 'Shopping Cart',
              icon: const Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.white,
              ))
        ],
      ),

      // open cart button at bottom
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue.shade300,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (_) => CartScreen(
                          productlist: productlist
                              .where((e) => e.isAdded == true)
                              .toList(),
                        )))
                .then((value) {
              setState(() {
                productlist;
              });
            });
          },
          label: const Text(
            'Cart',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          icon: const Icon(
            Icons.shopping_cart,
            size: 25,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // for showing product list
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return ProductCard(
            product: productlist[i],
          );
        },
        itemCount: productlist.length,
      ),
    );
  }
}
