import 'package:flutter/material.dart';

class SINGLE_BACK extends StatelessWidget {
  final Color backColor;
  final Color backgroundColor;
  final double backHeight;
  final double backWidth;

  SINGLE_BACK(
      this.backColor, this.backgroundColor, this.backHeight, this.backWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Container(
          child: FloatingActionButton(
        splashColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        backgroundColor: Colors.transparent,
        hoverColor: Colors.transparent,
        hoverElevation: 0,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 112, 110, 110),
        ),
      )),
    );
  }
}
