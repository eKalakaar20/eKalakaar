import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novo/screens/home/drawer_screen.dart';
import 'package:novo/screens/login/reset_password.dart';


import '../../utils/colors.dart';
import '../../utils/reusable_widget.dart';
import '../home/home_screen.dart';
import '../sign_up/signup_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String routeName = 'SignInScreen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/log.png"),
          fit:BoxFit.cover
          ),
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //logoWidget("assets/images/log.png"),
                  const SizedBox(height: 270),
                  reusableTextField("Enter Username", Icons.person_outline,
                      false, false, _emailTextController),
                  const SizedBox(height: 20),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      false, _passwordTextController),
                  const SizedBox(height: 10),
                  forgetPassword(context),
                  const SizedBox(height: 10),
                  DefaultButton(context, "LOG IN", () {
                    if (_formKey.currentState!.validate()) {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DrawerScreen()));
                    }
                  }),
                  signUpOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext contex) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResetPassword()));
        },
      ),
    );
  }
}