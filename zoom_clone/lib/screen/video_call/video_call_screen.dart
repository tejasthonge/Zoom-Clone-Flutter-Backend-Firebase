import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meeting_methods..dart';
import 'package:zoom_clone/screen/video_call/widgets/meeting_option.dart';
import 'package:zoom_clone/utils/constants/colors.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  late TextEditingController _meetIdController;
  late TextEditingController _nameController;
  bool isAudioMuted = false;
  bool isVideoMuted = false;
  @override
  void initState() {
    // TODO: implement initState
    _meetIdController = TextEditingController();
    _nameController =
        TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _meetIdController.dispose();
    _nameController.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  void _joinMeeting() async {
    _jitsiMeetMethods.createMeeting(
        username: _nameController.text.trim(),
        roomName: _meetIdController.text.trim(),
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Join A Meeting",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: _meetIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Room Id",
                contentPadding: EdgeInsets.fromLTRB(16, 4, 4, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              maxLines: 1,
              controller: _nameController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Name",
                contentPadding: EdgeInsets.fromLTRB(16, 4, 4, 0),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MeetingOptionWidget(
            title: "Join With Audio",
            isMute: isAudioMuted,
            onChange: (val) {
              setState(() {
                isAudioMuted = val;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MeetingOptionWidget(
            title: "Join With Video",
            isMute: isVideoMuted,
            onChange: (val) {
              setState(() {
                isVideoMuted = val;
              });
            },
          )
        ],
      ),
    );
  }
}
