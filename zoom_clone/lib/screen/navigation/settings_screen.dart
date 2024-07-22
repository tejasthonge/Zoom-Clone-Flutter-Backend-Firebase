

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_botton.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AuthMethods _authMethods =AuthMethods();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Column( 
        children: [ 
        
        ],
      ),
      floatingActionButton:   CustomBotton(title: "Sign Out", onPressed: ()async{
            await _authMethods.auth.signOut();
          }),
    );
  }
}