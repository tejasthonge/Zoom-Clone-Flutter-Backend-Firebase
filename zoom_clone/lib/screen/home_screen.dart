
import 'package:flutter/material.dart';
import 'package:zoom_clone/screen/home/widgets/home_screen_botton.dart';
import 'package:zoom_clone/utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  onChangedTab(int currentTab){
    setState(() {
       _selectedTab = currentTab;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        elevation: 0,
        title:const  Text("Meet & Chat",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: backgroundColor,
        
      ),


      body: Column( 

        children: [ 
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ 

              HomeMeetingButton(onPressed: (){},iconData:Icons.videocam, title: 'New Meeting',),
              HomeMeetingButton(onPressed: (){},iconData:Icons.add_box_rounded, title: 'Join Meeting',),
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
      ),

      bottomNavigationBar: BottomNavigationBar( 
        currentIndex: _selectedTab,
        onTap: onChangedTab,
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: "Meet &Chat",
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Meetings",
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Contacts",
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank_outlined),
            label: "Meet &Chat",
            ),



         ],
      ),
    );
  }
}