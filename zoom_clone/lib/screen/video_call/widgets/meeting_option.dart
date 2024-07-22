

import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/constants/colors.dart';

class MeetingOptionWidget extends StatefulWidget {
  final String title;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOptionWidget({super.key, required this.title, required this.isMute, required this.onChange});

  @override
  State<MeetingOptionWidget> createState() => _MeetingOptionWidgetState();
}

class _MeetingOptionWidgetState extends State<MeetingOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title,style: TextStyle(fontSize: 16),),
          Switch.adaptive(value: widget.isMute, onChanged: widget.onChange)
        ],
      ),
    );
  }
}