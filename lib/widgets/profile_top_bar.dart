import 'package:flutter/material.dart';

class ProfileTopBar extends StatefulWidget {
  @override
  _ProfileTopBarState createState() => _ProfileTopBarState();
}

class _ProfileTopBarState extends State<ProfileTopBar> {
  var iconColorChanger1 = Colors.white;
  var iconColorChanger2 = Colors.white;
  var iconColorChanger3 = Colors.white;
  var backArrowbtn = Icon(Icons.arrow_back_outlined);
  var notificationBtn = Icon(Icons.notifications_none_outlined);
  var shareBtn = Icon(Icons.share_outlined);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: backArrowbtn,
              color: iconColorChanger1,
              onPressed: () {
                setState(() {
                  iconColorChanger1 = Colors.purpleAccent;
                  iconColorChanger2 = Colors.white;
                  iconColorChanger3 = Colors.white;
                  backArrowbtn = Icon(Icons.arrow_back);
                  notificationBtn = Icon(Icons.notifications_none_outlined);
                  shareBtn = Icon(Icons.share_outlined);
                });
              }),
          Row(children: <Widget>[
            IconButton(
                icon: notificationBtn,
                color: iconColorChanger2,
                onPressed: () {
                  setState(() {
                    iconColorChanger2 = Colors.purpleAccent;
                    iconColorChanger1 = Colors.white;
                    iconColorChanger3 = Colors.white;
                    notificationBtn = Icon(Icons.notifications);
                    backArrowbtn = Icon(Icons.arrow_back_outlined);
                    shareBtn = Icon(Icons.share_outlined);
                  });
                }),
            IconButton(
                icon: shareBtn,
                color: iconColorChanger3,
                onPressed: () {
                  setState(() {
                    iconColorChanger3 = Colors.purpleAccent;
                    iconColorChanger2 = Colors.white;
                    iconColorChanger1 = Colors.white;
                    shareBtn = Icon(Icons.share);
                    notificationBtn = Icon(Icons.notifications_none_outlined);
                    backArrowbtn = Icon(Icons.arrow_back_outlined);
                  });
                }),
          ]),
        ]);
  }
}
