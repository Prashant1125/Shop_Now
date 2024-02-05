import 'package:adaptive_theme/adaptive_theme.dart';
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
        leading: Tooltip(
          message: 'Theme',
          child: Transform.scale(
            scale: 0.9,
            child: Switch(
              value: AdaptiveTheme.of(context).mode.isDark,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeThumbImage: const AssetImage('assets/icon/sun.png'),
              inactiveThumbImage: const AssetImage('assets/icon/moon.png'),
              onChanged: (value) {
                if (value) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
            ),
          ),
        ),
        actions: [
          //Add shopping cart button
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
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
                    )),
                Positioned(
                  left: mq.width * .040,
                  bottom: mq.height * .01,
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red.shade600,
                    minWidth: 0,
                    padding: const EdgeInsets.all(8),
                    shape: const CircleBorder(),
                    child: Text(
                      '${productlist.where((e) => e.isAdded).length}',
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      // open cart button at bottom
      floatingActionButton: SizedBox(
        width: mq.width * .5,
        height: mq.height * .1,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: FloatingActionButton.extended(
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
            ),
            Positioned(
              right: mq.width * .07,
              bottom: mq.height * .045,
              child: MaterialButton(
                onPressed: () {},
                color: Colors.white.withOpacity(0.4),
                minWidth: 0,
                padding: const EdgeInsets.all(10),
                shape: const CircleBorder(),
                child: Text(
                  '${productlist.where((e) => e.isAdded).length}',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // for showing product list
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return ProductCard(
            onTap: () {
              setState(() {
                productlist;
              });
            },
            product: productlist[i],
          );
        },
        itemCount: productlist.length,
      ),
    );
  }
}
