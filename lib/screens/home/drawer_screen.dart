import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:novo/screens/artist/dashboard_screen.dart';
import 'package:novo/screens/findopprtunity/find_opportunity.dart';
import 'package:novo/screens/home/home_screen.dart';
import 'package:novo/utils/constants.dart';

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
      //slideWidth: 250.0,
      menuScreenWidth:240,
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

//======================================================================================================

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.only(top:25),
        decoration: BoxDecoration(
          
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.black,
              Color.fromARGB(255, 237, 16, 0),
            ],
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 40),
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              accountName: RichText(
                  text: TextSpan(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                           color: Colors.blue
                          ),
                      text: 'joes harley\n',
                      children: <InlineSpan>[
                    TextSpan(
                      text: '(Dancer)',
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          //fontWeight: FontWeight.bold,
                           color: Colors.black,
                          ),
                    )
                  ])),
              accountEmail: Text("johndoe@example.com",style: TextStyle(color: kBackgroundColor),),
              currentAccountPictureSize: Size.square(68.0),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            ListTile(
                onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
                },
                leading: Icon(Icons.person),
                title: Text("Dashboard"),
                iconColor: kBackgroundColor,
                contentPadding: EdgeInsets.only(left: 25)),
            ListTile(
                leading: Icon(Icons.diversity_1),
                title: Text("Art Lovers"),
                iconColor: kBackgroundColor,
                contentPadding: EdgeInsets.only(left: 25)),
            ListTile(
              onTap: () {
                 Navigator.push(context,
                MaterialPageRoute(builder: (context) => FindOpportunityScreen()));
              },
                leading: Icon(Icons.extension),
                title: Text("Find Opprtunity"),
                iconColor: kBackgroundColor,
                contentPadding: EdgeInsets.only(left: 25)),
            ListTile(
                leading: Icon(Icons.auto_awesome),
                title: Text("Artist"),
                iconColor: kBackgroundColor,
                contentPadding: EdgeInsets.only(left: 25)),
            ListTile(
                leading: Icon(Icons.whatshot),
                title: Text("Media"),
                iconColor: kBackgroundColor,
                contentPadding: EdgeInsets.only(left: 25)),
            ListTile(
                leading: Icon(Icons.mail),
                title: Text("Contact Us"),
                iconColor: kBackgroundColor,
                contentPadding: EdgeInsets.only(left: 25)),
            ListTile(
                leading: Icon(Icons.corporate_fare),
                title: Text("About"),
                iconColor: kBackgroundColor,
                contentPadding: EdgeInsets.only(left: 25)),
            Spacer(),
            ListTile(
                leading: Icon(Icons.arrow_back_ios),
                title: Text("Logout"),
                iconColor: kBackgroundColor,
                contentPadding: EdgeInsets.only(left: 25)),
          ],
        ),
      ),
    );
  }
}
