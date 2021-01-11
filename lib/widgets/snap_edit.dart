import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SnapEdit extends StatefulWidget {
  File image;
  SnapEdit({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  _SnapEditState createState() => _SnapEditState();
}

class _SnapEditState extends State<SnapEdit> {
  Color btnColor = Colors.white;
  var blankFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(blankFocusNode);
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 110.0,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: widget.image == null
                      ? Text('No image selected.')
                      : Image.file(widget.image),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 110.0, left: 10.0, right: 10.0),
                child: TextFormField(
                    decoration: InputDecoration(
                  //fillColor: Colors.purpleAccent,
                  hintText: 'Title',
                  // labelText: 'Name *',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purpleAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purpleAccent,
                    ),
                  ),
                  suffixIcon: IconButton(
                    color: btnColor,
                    iconSize: 30.0,
                    icon: Icon(MdiIcons.arrowRightBoldCircle),
                    // focusNode: _focusNode,
                    onPressed: () {
                      setState(() {
                        btnColor = Colors.purpleAccent;
                      });
                    },
                  ),
                )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
