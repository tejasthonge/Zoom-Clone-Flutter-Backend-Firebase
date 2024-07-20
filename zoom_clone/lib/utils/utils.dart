

import 'package:flutter/material.dart';

showCustomSnankBar({required BuildContext context,required String massage}){

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(massage))
  );
}