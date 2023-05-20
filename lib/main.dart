
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:novo/screens/login/signin_screen.dart';
import 'package:novo/utils/constants.dart';
import 'package:novo/services/firebase_options.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
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
        scaffoldBackgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/images/ek.jpg",),
        nextScreen: SignInScreen(),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 500,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        duration: 3000,
        ),
      
    );
  }
}
