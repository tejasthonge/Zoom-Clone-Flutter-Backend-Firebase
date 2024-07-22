import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/firebase_options.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

import 'package:zoom_clone/screen/auth/login_screen.dart';
import 'package:zoom_clone/screen/home_screen.dart';
import 'package:zoom_clone/screen/video_call/video_call_screen.dart';
import 'package:zoom_clone/utils/constants/colors.dart';


//for android check https://www.youtube.com/watch?v=sMA1dKbv33Y
//time: 1.16
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom-clone',
      debugShowCheckedModeBanner: false,  
      theme: ThemeData.dark().copyWith( 
        scaffoldBackgroundColor: backgroundColor
      ),

      routes: {

        '/login':(context) => const LoginScreen(),
        '/home':(context) => const HomeScreen(),
        '/video-call':(context)=>const VideoCallScreen()
      },
      
      home:StreamBuilder( 
        stream: AuthMethods().getUserChange,  //and this stream is return the User for firebase authentication and which is null type
        builder: (context,snapshot){//by using the this snapshot we are accessing all the data forom the strem

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){//means user allready signin them we directly retun to the home screen by skiping reopen on signin screen

            return const HomeScreen();

          }
          if(snapshot.hasError){
            return const Center(child:  Text('some error ocure please try agin some tyme'));
          }
          return const LoginScreen(); //if no user is signin then we will show the login screen
        },
      )
    );
  }
}
