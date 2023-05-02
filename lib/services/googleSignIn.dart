//import 'dart:html';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';


 final _auth=FirebaseAuth.instance;
 final _firestore=FirebaseFirestore.instance;
 final  googleSignIn = GoogleSignIn();
  late String name;
 late String email;
 late String imageurl;

 Future<String> signInWithGoogle() async{
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken
  );

  final UserCredential userCredential = await _auth.signInWithCredential(credential);
   final User? user = userCredential.user;
  assert(user?.email!=null);
  assert(user?.displayName!=null);
  assert(user?.photoURL!=null);


  name = user!.displayName!;
  email = user.email!;
  imageurl=user.photoURL!;

   final User? currentuser= _auth.currentUser; 
   assert(user.uid==currentuser!.uid);
   return 'signInWithGoogle succeeded:$user';
 }


 ///*********************************************************************************///



 

