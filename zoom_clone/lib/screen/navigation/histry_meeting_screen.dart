import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestore_meeting_methods.dart';
import 'package:zoom_clone/utils/constants/colors.dart';

class HistryMeetingScreen extends StatefulWidget {
  const HistryMeetingScreen({super.key});

  @override
  State<HistryMeetingScreen> createState() => _HistryMeetingScreenState();
}

class _HistryMeetingScreenState extends State<HistryMeetingScreen> {
  final FirestoreMethods _firestroreMeetingMethond = FirestoreMethods();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestroreMeetingMethond.meetingsHistory,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: secondaryBackgroundColor,));

          }
          
          
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,index){

              return ListTile(
                selectedTileColor: secondaryBackgroundColor, 
                title: Text("Room Name: ${(snapshot.data! as dynamic).docs[index]["meetingName"]}"),
                subtitle: Text("Room Name ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]["createdAt"].toDate())}"),
              );
          });
        });
  }
}
