import 'package:flutter/material.dart';

class TEXT_TO_STYLIST extends StatelessWidget {
  final String navbarName = "آدرس و کد پستی";

  final textToStylistText;
  TEXT_TO_STYLIST(this.textToStylistText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "متن ارسالی خود به ارایشگر از قبیل ساعت ترجیحی خود  و .. را بنویسید",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "متن ارسالی",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: TextField(
                        textAlign: TextAlign.right,
                        controller: textToStylistText,
                        maxLines: 8,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontFamily: "Shabnam"),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(192, 192, 192, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(192, 192, 192, 1)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
      ],
    );
  }
}
