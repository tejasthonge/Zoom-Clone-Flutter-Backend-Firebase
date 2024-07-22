
import 'package:flutter/material.dart';
import 'package:zoom_clone/screen/home/widgets/home_screen_botton.dart';
import 'package:zoom_clone/screen/navigation/histry_meeting_screen.dart';
import 'package:zoom_clone/screen/navigation/meeting_screen.dart';
import 'package:zoom_clone/screen/navigation/settings_screen.dart';
import 'package:zoom_clone/utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreen = 0;
  final List<Widget> _screen =<Widget>[
     MeetingScreen(),
    const HistryMeetingScreen(),
    const Center( child: Text("Contacts"),),
    const SettingsScreen()

  ];
  
  onChangedScreen(int currentScreen){
    setState(() {
       _selectedScreen = currentScreen;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        elevation: 0,
        title:const  Text("Meet & Chat",style: TextStyle( 
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
        backgroundColor: backgroundColor,
        
      ),


      body: _screen[_selectedScreen],

      bottomNavigationBar: BottomNavigationBar( 
        currentIndex: _selectedScreen,
        onTap: onChangedScreen,
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

         


         ],
      ),
    );
  }
}
