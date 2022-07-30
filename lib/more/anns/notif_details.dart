import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ANN_TEMPLATE extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  @override
  ANN_TEMPLATE(
    this.title,
    this.description,
    this.date,
  );
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Card(
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: "Shabnam", fontSize: 12, color: Colors.cyan),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "......",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Shabnam",
                        fontSize: 10)),
                TextSpan(
                    text:
                        "${description.replaceRange(20, description.length, "")}",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Shabnam",
                        fontSize: 10)),
              ])),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    date.toPersianDigit(),
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.grey),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
