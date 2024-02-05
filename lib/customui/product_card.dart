import 'package:flutter/material.dart';

import '../modals/product.dart';
import '../screens/add_product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: widget.product.isAdded ? Colors.green.withOpacity(0.8) : null,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: mq.height * .010),

      // creating rounded creation
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        // for adding Space by using media query
        contentPadding: EdgeInsets.only(
            left: mq.width * .04,
            top: mq.height * .01,
            bottom: mq.height * .01,
            right: mq.height * .01),

        // Product Image
        leading: Image.asset(widget.product.image),

        //Product name
        title: Text(widget.product.title),

        //Product Price
        subtitle: Text('₹ ${widget.product.price}.00'),

        // button for adding product
        trailing: widget.product.isAdded
            ?
            // icon to confirm for Product add in cart
            IconButton(
                onPressed: () {
                  widget.onTap();
                  setState(() {
                    widget.product.isAdded = false;
                  });
                },
                icon: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 6, color: Colors.green),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.done,
                      size: 25,
                      color: Colors.white,
                    )))
            :
            // Button for adding a product into cart
            ElevatedButton.icon(

                //Styling a Button
                style: ElevatedButton.styleFrom(
                    elevation: 5, shape: const StadiumBorder()),
                onPressed: () {
                  widget.onTap();

                  setState(() {
                    widget.product.isAdded = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green.withOpacity(0.8),
                      behavior: SnackBarBehavior.floating,
                      content: const Text('Item Added Successfully')));
                },
                icon: const Icon(Icons.shopping_cart_checkout_outlined),
                label: const Text('Add')),
      ),
    );
  }
}
