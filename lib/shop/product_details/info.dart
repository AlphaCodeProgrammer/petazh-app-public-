import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class INFO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return storeFunc.productDetails["info"].length > 0
        ? Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "معرفی ${storeFunc.productDetails["name"]}",
                style: TextStyle(
                    fontFamily: "Shabnam", fontSize: 12, color: Colors.black),
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(storeFunc.productDetails["info"],
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 14,
                            color: Colors.black)),
                  )),
            ],
          )
        : SizedBox(
            height: 1,
          );
  }
}
