import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:novo/constants.dart';
import 'package:novo/firebase_options.dart';
import 'package:novo/screens/home/home_screen.dart';
import 'package:novo/screens/home/menu_screen.dart';
import 'package:novo/screens/sign_up/register.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'screens/home/drawer_screen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DrawerScreen(),
      //  AnimatedSplashScreen(
      //   splash: Image.asset("assets/images/main.png"),
      //   nextScreen: HomeScreen(),
      //   splashTransition: SplashTransition.fadeTransition,
      //   splashIconSize: 250,
      //   backgroundColor: Colors.white,
      //   duration: 3000,
      //   ),
    );
  }
}
