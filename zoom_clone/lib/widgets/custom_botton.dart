

import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/constants/colors.dart';

class CustomBotton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  
  const CustomBotton({super.key, required this.title, required this.onPressed});



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom( 
        foregroundColor: Colors.white,
        backgroundColor: buttonColor,
        minimumSize: Size(MediaQuery.of(context).size.width-40 , 50),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: buttonColor),
          borderRadius: BorderRadius.circular(30 ),
        ),
      ),
      onPressed: onPressed, child: Text(title,style:const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),));
  }
}