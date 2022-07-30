import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TEXTFEILD extends StatelessWidget {
  final String placeHolder;
  final String lable;

  @override
  TEXTFEILD(this.placeHolder, this.lable);
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text(lable, style: TextStyle(fontSize: 12, color: Colors.black),)],
        ),
        SizedBox(height: 5,),
        Container(
          child: TextField(
          
            cursorColor: Colors.grey,
            style: TextStyle(fontSize: 14.0, color: Colors.black,fontFamily: "Shabnam"),
            cursorHeight: 20,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "${placeHolder}".toPersianDigit(),

            
            
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
