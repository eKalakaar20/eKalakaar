import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///backgroundColor: Colors.orange,
      body: Container(
        decoration: BoxDecoration(
          gradient:  LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft
      ,
    
      colors: [Colors.black, Color.fromARGB(255, 237, 16, 0),],
    ),
        ),
        //: Text('Menu Screen'),
      ),
    );
  }
}