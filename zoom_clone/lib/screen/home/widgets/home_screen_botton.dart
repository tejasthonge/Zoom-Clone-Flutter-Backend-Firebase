

import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/constants/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String title;
  const HomeMeetingButton({super.key, required this.onPressed, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 

      onTap: onPressed,
      child: Column( 

        children: [ 

          Container( 
            width: 60,
            height: 60,

            decoration: BoxDecoration( 

              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow:  <BoxShadow>[ 

                BoxShadow( 
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0,10)
                )
              ]
            ),
            child:  Icon(iconData,
              color: Colors.white,
              size:30,
            ),
          ),
          const SizedBox(height: 10,),

          Text( 
            title,
            style: const TextStyle( 
              color: Colors.grey
            ),
          )
        ],
      )
    ) ;
  }
}