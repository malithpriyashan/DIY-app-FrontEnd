import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  GradientButton(
      {Key key,
      @required this.mixColor1,
      @required this.mixColor2,
      @required this.btnText,
      @required this.textColor,
      @required this.borderColor,
      @required this.btnHeight,
      @required this.btnWidth})
      : super(key: key);

  Color mixColor1;
  Color mixColor2;
  String btnText;
  Color textColor;
  Color borderColor;
  var btnWidth;
  var btnHeight;

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: widget.isClicked ? Colors.black : Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: widget.btnHeight, horizontal: widget.btnWidth),
        decoration: BoxDecoration(
            border: Border.all(color: widget.borderColor),
            gradient:
                LinearGradient(colors: [widget.mixColor1, widget.mixColor2])),
        child: Text(
          widget.btnText,
          style: TextStyle(color: widget.textColor),
        ),
      ),
    );
  }
}
