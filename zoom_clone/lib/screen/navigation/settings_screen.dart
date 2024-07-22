

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screen/navigation/histry_meeting_screen.dart';
import 'package:zoom_clone/widgets/custom_botton.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AuthMethods _authMethods =AuthMethods();
  User? user = AuthMethods().auth.currentUser!;


  @override
  Widget build(BuildContext context) {

    return Scaffold( 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column( 
          children: [ 
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar( 
                  radius: 60,
                  backgroundImage: NetworkImage(
                    user!.photoURL!
                  ),
                ),
                const SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user!.displayName!,
                      style: TextStyle( 
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user!.email!,
                      style: TextStyle( 
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20,),
            Text("Meeting History",
              style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold ),
            ),
           SizedBox(
            
            height:400,
            
            child: HistryMeetingScreen())
            // Text(key: ,)
          ],
        ),
      ),
      floatingActionButton:   CustomBotton(title: "Sign Out", onPressed: ()async{
           setState(() {
               _authMethods.auth.signOut();
           });
          }),
    );
  }
}