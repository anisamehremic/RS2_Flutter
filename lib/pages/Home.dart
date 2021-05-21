import 'package:flutter/material.dart';
import 'package:vjezbe2_app/models/Proizvodi.dart';
import 'package:vjezbe2_app/services/APIService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sidemenu'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('eProdaja'),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            ),
            ListTile(
              title: Text('Proizvodi'),
              onTap: () async{
                    Navigator.of(context).pushNamed('/products');
              },
            )
          ],
        ),
      ),
    );
  }
}
