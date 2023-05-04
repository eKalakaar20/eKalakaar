
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novo/screens/home/home_screen.dart';
import 'package:novo/screens/sign_up/register.dart';
import 'package:novo/utils/widgets.dart';

class Mylogin extends StatefulWidget {
  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  late String _email;
  late String _password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/login.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 33, top: 144),
                  child: const Text(
                    "Welcome\nBack",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5,
                        right: 35,
                        left: 35),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                          decoration: textInputDecoration.copyWith(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email,color: Colors.grey,)
                             ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          decoration: textInputDecoration.copyWith(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock,color: Colors.grey,)
                             ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sign In",
                                style: TextStyle(
                                    color: Color(0xff4c505b),
                                    fontSize: 33,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 40,
                            ),
                            CircleAvatar(
                              radius: 33,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                  // onPressed: () async {
                                  //  // Navigator.pushNamed(context, '/home');
                                  //   try {
                                  //     // Fetch sign-in methods for the email address
                                  //     final list = await FirebaseAuth.instance
                                  //         .fetchSignInMethodsForEmail(_email);

                                  //     // In case list is not empty
                                  //     if (list.isNotEmpty) {
                                  //       // Return true because there is an existing
                                  //       // user using the email address
                                  //      Navigator.pushNamed(context, '/home');
                                  //     } else {
                                  //       // Return false because email adress is not in use
                                  //       var snackBar = SnackBar(
                                  //           content: Text('user not exist'));
                                  //       ScaffoldMessenger.of(context)
                                  //           .showSnackBar(snackBar);
                                  //     }
                                  //   } catch (error) {
                                  //     print(error);
                                  //   }
                                  // },
                                  onPressed: () {
                                    //  Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => HomeScreen(),
                                    //   ),
                                    // );
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _email, password: _password)
                                        .then((FirebaseUser) {
                                       Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                    }).catchError((e) {
                                      var snackBar = SnackBar(
                                          content: Text('user not exist'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      print(e);
                                    });
                                  },
                                  icon: Icon(Icons.arrow_forward)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyRegister(),
                                      ),
                                    );
                                  // Navigator.pushNamed(context, '/register');
                                },
                                child: Text("Sign Up",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 20,
                                      color: Color(0xff4c505b),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigator.pushNamed(
                                  //     context, '/forgetpassword');
                                },
                                child: Text("Forget Password",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 20,
                                      color: Color(0xff4c505b),
                                    )),
                              )
                            ])
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
