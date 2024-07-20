



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/utils/utils.dart';

class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;


 Future<bool> signInWithGoogle({required BuildContext context})async{
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser  = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =await  _auth.signInWithCredential(credential);
      User?  user = userCredential.user;


      if(user != null){
        if(userCredential.additionalUserInfo!.isNewUser){
        await _firestore.collection("users").doc(user.uid).set(
            {
              'username':user.displayName,
              'email':user.email,
              'uid':user.uid,
              'profilePhoto':user.photoURL 
            }
          );
        }
        
        res = true;
        showCustomSnankBar(context: context, massage: "Successfull!");
      }
      

    }
    
    on FirebaseAuthException catch (e) {
      showCustomSnankBar(context: context, massage: e.message!);
      res = false;
    }
    cathc (e){
      showCustomSnankBar(context: context, massage: "An error occurred");
      res = false;
    }
    return res;
  }
  
}