
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/constants/image.dart';
import 'package:zoom_clone/widgets/custom_botton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 

          const Text( 
            "Start or Join The Metting",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Image.asset(
              onboarding
            ),
          ),

          CustomBotton(title: "Google Sign In",
            onPressed: ()async{
            bool res =await  _authMethods.signInWithGoogle(context: context);
            if (res){
            
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
            }
            },
          )
          
        ],
      ),
    );
  }
}