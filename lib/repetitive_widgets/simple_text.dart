import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class SIMPLE_TEXT extends StatelessWidget {
  final String rightText;
  final String leftText;

  final double fontSizeOfText;
  final Color rightTextColor;
  final Color leftTextColor;

  SIMPLE_TEXT(this.fontSizeOfText, this.rightText, this.rightTextColor,
      this.leftTextColor, this.leftText);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          rightText.toPersianDigit(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(fontSize: fontSizeOfText, color: rightTextColor),
        ),
        Text(leftText.toPersianDigit(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontSize: fontSizeOfText, color: leftTextColor)),
      ],
    );
  }
}
