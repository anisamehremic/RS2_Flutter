import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vjezbe2_app/models/Proizvodi.dart';
import 'package:vjezbe2_app/pages/ProductDetails.dart';
import 'package:vjezbe2_app/services/APIService.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proizvodi'),
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return FutureBuilder<List<Proizvodi>>(
      future: GetProduct(),
      builder: (BuildContext context, AsyncSnapshot<List<Proizvodi>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError)
            return Center(child: new Text('${snapshot.error}'));
          else
            return ListView(
                children: snapshot.data.map((e) => ProizvodiWidget(e)).toList());
        }
      },
    );
  }

  Future<List<Proizvodi>> GetProduct() async {
    var proizvodi = await APIService.GetProduct('Proizvodi');
    return (proizvodi).map((i) =>
        Proizvodi.fromJson(i)).toList();
  }

  Widget ProizvodiWidget(proizvod){
    return Card(
      child: TextButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(product: proizvod),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              // Image(
              //   image: proizvod.slika,
              // ),
              Text(proizvod.naziv, style: TextStyle(color: Colors.teal),),
              SizedBox(width: 10,),
              Text(proizvod.cijena)
            ],
          ),
        ),
      ),
    );
  }
}

