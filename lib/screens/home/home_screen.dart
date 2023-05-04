import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:novo/utils/constants.dart';
import 'package:novo/screens/home/components/body.dart';
import 'package:novo/screens/home/components/my_bottom_nav_bar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'drawer_screen.dart';

  class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
       bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          zoomDrawerController.toggle!();
        },
        icon: SvgPicture.asset("assets/icons/menu.svg"),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft, // bttomleft
            end: Alignment.topRight,    // topright
            colors: [
              Colors.black,
              Colors.red,
            ],
          ),
        ),
      ),
      //backgroundColor: kPrimaryColor,
      elevation: 0,
    );
  }
}
