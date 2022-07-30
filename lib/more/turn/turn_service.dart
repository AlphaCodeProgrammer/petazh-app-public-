import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TURN_SERVICE extends StatelessWidget {
  final String nameService;
  final int priceService;
  final int quantity;

  TURN_SERVICE(
    this.priceService,
    this.quantity,
    this.nameService,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                nameService,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                  "قیمت :${((priceService.toString()).toPersianDigit()).seRagham()}",
                  style: TextStyle(fontSize: 12, color: Colors.black)),
              Text(
                ("تعداد :${quantity}").toPersianDigit(),
                style: TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
