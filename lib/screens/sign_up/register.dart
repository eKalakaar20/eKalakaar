// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novo/screens/home/home_screen.dart';
import 'package:novo/screens/login/login.dart';
import 'package:novo/services/googleSignIn.dart';
import 'package:novo/utils/widgets.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  late String _email;
  late String _password;
  late String _name;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/register.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 33, top: 95),
                  child: const Text(
                    "Create\nAccount",
                    style: TextStyle(
                        fontSize: 55,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.4,
                        right: 35,
                        left: 35),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              _name = value;
                            });
                          },
                          decoration: textInputDecoration.copyWith(
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person,color: Colors.grey,)
                             ),
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
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
                        SizedBox(
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
                            Text("Sign Up",
                                style: TextStyle(
                                    color: Color(0xff4c505b),
                                    fontSize: 33,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              width: 40,
                            ),
                            CircleAvatar(
                              radius: 33,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                  // onPressed: () async{
                                  //   //Navigator.pushNamed(context,'/home');
                                  //   try {
                                  //     final newuser= await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
                                  //     if(newuser!=Null) Navigator.pushNamed(context,'/home');
                                  //   }
                                  //   catch(e) {print(e);}
                                  // },
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => HomeScreen(),
                                    //   ),
                                    // );

                                    /// this will aslo store the data in firestore
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: _email,
                                      password: _password,
                                    )
                                        .then((signedInUser) {
                                      _firestore
                                          .collection('users')
                                          .doc('emailusers')
                                          .collection('users')
                                          .add({
                                        'email': _email,
                                        'password': _password,
                                        'name': _name
                                      }).then((value) {
                                        if (signedInUser != null) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(),
                                            ),
                                          );
                                        }
                                      }).catchError((e) {
                                        print(e);
                                      });
                                    }).catchError((e) {
                                      print(e);
                                    });
                                  },
                                  icon: Icon(Icons.arrow_forward)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Mylogin(),
                                    ),
                                  );
                                },
                                child: Text("Sign In",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 20,
                                      color: Color(0xff4c505b),
                                    )),
                              ),
                              CircleAvatar(
                                radius: 29,
                                backgroundColor: Color.fromARGB(255, 10, 5, 0),
                                child: GestureDetector(
                                    onTap: () {
                                      signInWithGoogle().then((onValue) {
                                        _firestore
                                            .collection('users')
                                            .doc('auth')
                                            .collection('gusers')
                                            .add({
                                          'email': email,
                                          'image': imageurl,
                                          'name': name
                                        });
                                      }).catchError((e) {
                                        print(e);
                                      }).then((value) {
                                          Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );

                                      }).catchError((e) {
                                        print((e));
                                      });
                                    },
                                    child: Image.network(
                                      "https://cdn.icon-icons.com/icons2/2699/PNG/512/google_tile_logo_icon_170069.png",
                                      fit: BoxFit.cover,
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
