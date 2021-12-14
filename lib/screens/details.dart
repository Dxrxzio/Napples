// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'transactions.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('N A P P L E S'),
      ),
      drawer: Drawer(
          child: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'N A P P L E S',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Transactions'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Transactions()));
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Details'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Details()));
              },
            ),
          ],
        ),
      )),
      body: Center(
        child: Text('D E T A I L S'),
      ),
    );
  }
}
