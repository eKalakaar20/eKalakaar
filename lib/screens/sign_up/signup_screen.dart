import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novo/utils/constants.dart';
import '../../utils/colors.dart';
import '../../utils/reusable_widget.dart';
import '../login/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String routeName = 'SignUpScreen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var dropdownValue = "Choose Your Role";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              //  alignment: Alignment.center,

              fit: BoxFit.cover,
              image: AssetImage("assets/images/log.png")),
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 270),
                  reusableTextField("Enter Username", Icons.person_outline,
                      false, true, _userNameTextController),
                  const SizedBox(height: 20),
                  reusableTextField("Enter Email id", Icons.person_outline,
                      false, false, _emailTextController),
                  const SizedBox(height: 20),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      false, _passwordTextController),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  30.0) //                 <--- border radius here
                              ),
                        ),
                          child: DropdownButton<String>(
                          alignment: AlignmentDirectional.center,
                          value: dropdownValue,
                          underline: ColoredBox(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(40),
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Choose Your Role',
                            'Artist',
                            'Patron',
                            'Art Lover',
                            'Special Services'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                                                ),
                      ),
                      SizedBox(width: 7,),
                 
                      Expanded(
                        child: DefaultButton(context, "SIGN UP", () {
                          if (_formKey.currentState!.validate()) {
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen());
                          }
                        }),
                      ),
                    ],
                  ),
                  signInOption(),
                ],
              ),
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
