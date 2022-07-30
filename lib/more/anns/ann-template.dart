import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class ANN_TEMPLATE extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String date;
  final bool didRead;

  @override
  ANN_TEMPLATE(this.id, this.title, this.description, this.date, this.didRead);

  var didReadLoacal = false;

  State<ANN_TEMPLATE> createState() => _ANN_TEMPLATEState();
}

class _ANN_TEMPLATEState extends State<ANN_TEMPLATE> {
  Widget build(BuildContext context) {
    final turnsData = Provider.of<Barbers>(context);

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
                widget.title,
                style: TextStyle(
                    fontFamily: "Shabnam", fontSize: 12, color: Colors.cyan),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.description,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: "Shabnam", fontSize: 10, color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  !widget.didRead != widget.didReadLoacal
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              primary: Colors.white,
                              fixedSize: const Size(30, 30),
                              padding: EdgeInsets.all(5)),
                          onPressed: () {
                            setState(() {
                              widget.didReadLoacal = true;
                            });
                            turnsData.postReadNotifications(widget.id);
                          },
                          child: Text(
                            "خواندم",
                            style: TextStyle(
                                fontFamily: "Shabnam",
                                fontSize: 10,
                                color: Colors.grey),
                          ),
                        )
                      : SizedBox(
                          height: 1,
                        ),
                  Text(
                    widget.date.toPersianDigit(),
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
