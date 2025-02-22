import 'package:flutter/material.dart';
import 'package:products_app/data/entity/products.dart';

class ProductDetails extends StatefulWidget {
  Product product;

  ProductDetails({ required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/${widget.product.image}'),
            Text(widget.product.name, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            Text(widget.product.description, style: const TextStyle(fontSize: 18),),
            Text(widget.product.price.toString() + ' ₺', style: const TextStyle(fontSize: 14, color: Colors.blue,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}