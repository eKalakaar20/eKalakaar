import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novo/screens/login/signin_screen.dart';
import '../../utils/colors.dart';
import '../../utils/reusable_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  static String routeName = 'ResetPassword';
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        backgroundColor: hexStringToColor("CB2B93"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
           image: DecorationImage(
            fit: BoxFit.cover,
            image:AssetImage("assets/images/log.png")),
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
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
               // logoWidget("assets/images/log.png"),
                const SizedBox(height: 270),
                reusableTextField("Enter Email id", Icons.person_outline, false,
                    false, _emailTextController),
                const SizedBox(height: 20),
                DefaultButton(context, "Reset Password", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(
                    email: _emailTextController.text,
                  )
                      .then((value) {
                    print("Reset email send");
                    Navigator.of(context).pop();
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signInOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "If you have account??",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: const Text(
            "SIGN IN",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}