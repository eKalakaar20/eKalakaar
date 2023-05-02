import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:novo/screens/home/home_screen.dart';
import 'menu_screen.dart';

 final zoomDrawerController = ZoomDrawerController();

 class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreenTapClose: true,
      //slideWidth: 300.0,
      //menuScreenWidth:100,
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: const HomeScreen(),
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      angle: 0,
      //isRtl: true,
    );
  }
}
