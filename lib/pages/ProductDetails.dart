import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:vjezbe2_app/models/Proizvodi.dart';

class ProductDetails extends StatelessWidget {
  final Proizvodi product;
  ProductDetails({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<int> bytesList = base64.decode(product.slika);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalji proizvoda'),
      ),
      body: Center(
        child: Column(
            children:
            [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.cover, image: MemoryImage(bytesList, scale: 0.5)),
            ),
        ),
          ),
              Text(product.naziv, style: TextStyle(fontSize: 18),),
            ]
        ),
      ),
    );
  }
}
