

 import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_clone/resources/jitsi_meeting_methods..dart';
import 'package:zoom_clone/screen/home/widgets/home_screen_botton.dart';

class MeetingScreen extends StatelessWidget {
    MeetingScreen({super.key});


  final JitsiMeetMethods _jitsiMeetMethods =JitsiMeetMethods();
   void createNewMeeting()async{
   var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: false , isVideoMuted: false); //
   }
   void joinMeeting({required BuildContext context}){
     Navigator.of(context).pushNamed('/video-call');
   }
 
   @override
   Widget build(BuildContext context) {
     return Column( 
    
      children: [ 
        Row( 
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
    
            HomeMeetingButton(onPressed: createNewMeeting,iconData:Icons.videocam, title: 'New Meeting',),
            HomeMeetingButton(onPressed: ()=>joinMeeting(context: context),iconData:Icons.add_box_rounded, title: 'Join Meeting',),
            HomeMeetingButton(onPressed: (){},iconData:Icons.calendar_today, title: 'Schedule Meet',),
            HomeMeetingButton(onPressed: (){},iconData:Icons.arrow_upward, title: 'Shrere Screen',),
          ],
        ),
        const Expanded(child: Center( 
          child: Text("Create or Join the meeting jist a Click",
            style: TextStyle( 
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ))
      ],
    );
   }
 }