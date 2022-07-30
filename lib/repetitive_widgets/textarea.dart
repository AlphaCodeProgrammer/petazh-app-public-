import 'package:flutter/material.dart';

class TEXTAREA extends StatelessWidget {
  final String lableTextArea;
  final String placholderOfTextArea;
  TEXTAREA(this.lableTextArea, this.placholderOfTextArea);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      lableTextArea,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: TextField(
                    maxLines: 8,
                    cursorColor: Colors.grey,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: "Shabnam"),
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: placholderOfTextArea,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
