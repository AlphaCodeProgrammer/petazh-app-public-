import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class PROPERTIESE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return Card(
      color: Color.fromARGB(255, 250, 244, 244),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "مشخصات",
            style: TextStyle(
                fontFamily: "Shabnam", fontSize: 12, color: Colors.black),
          ),
          ...(storeFunc.productDetails["properties"] as List<dynamic>)
              .map((property) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Align(
                      child: Text(
                        property["name"],
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: MediaQuery.of(context).size.width > 1000
                                ? 12
                                : 10,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: MediaQuery.of(context).size.width > 700 ? 12 : 5,
                  child: SizedBox(
                    height: 20,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: property["value"].length,
                        itemBuilder: (context, index) {
                          return Text(
                            "| ${property["value"][index]} ",
                            style: TextStyle(
                                fontFamily: "Shabnam",
                                fontSize:
                                    MediaQuery.of(context).size.width > 1000
                                        ? 12
                                        : 10,
                                color: Colors.black),
                          );
                        }),
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
