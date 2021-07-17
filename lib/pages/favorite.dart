import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({ Key? key }) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Favorite',style: TextStyle(color: Colors.red),),
      )
    );

  }
}