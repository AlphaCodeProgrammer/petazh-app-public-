import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../../repetitive_widgets/rating_star.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SELLERS_MOBILE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "فروشندگان",
          style: TextStyle(
              fontFamily: "Shabnam", fontSize: 12, color: Colors.black),
        ),
        ...(storeFunc.productDetails["otherSellers"] as List<dynamic>)
            .map((seller) {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Row(children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.store_mall_directory_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          seller["shopName"].toString().toPersianDigit(),
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Color.fromARGB(255, 34, 34, 34)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        seller["sellerRate"]["numberOfRates"] > 1
                            ? Text("امتیاز : ",
                                style: TextStyle(
                                    fontFamily: "Shabnam",
                                    fontSize: 10,
                                    color: Colors.grey))
                            : SizedBox(
                                width: 1,
                              ),
                        seller["sellerRate"]["numberOfRates"] > 1
                            ? Text("${seller["sellerRate"]["rateNumber"]}",
                                style: TextStyle(
                                    fontFamily: "Shabnam",
                                    fontSize: 10,
                                    color: Colors.green))
                            : SizedBox(
                                width: 1,
                              ),
                      ]),
                      //////////////////////////////////
                      Row(children: []),
                    ],
                  )));
        }).toList(),
      ],
    );
  }
}
