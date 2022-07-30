import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class RADIO_BUTTON_TEMPLATE extends StatelessWidget {
  String propertyName;
  dynamic subPropertyInfo;
  RADIO_BUTTON_TEMPLATE(
    this.propertyName,
    this.subPropertyInfo,
  );
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return Container(
      width: 400,
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subPropertyInfo["Ename"] != null
                      ? Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(subPropertyInfo["Ename"],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Shabnam",
                                  fontSize: 14)),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                            subPropertyInfo["name"].toString().toPersianDigit(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Shabnam",
                                fontSize: 14)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            storeFunc.singleSelectFunc(
                                propertyName, subPropertyInfo["name"], context);
                          },
                          child: Align(
                            child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey)),
                                child: subPropertyInfo["selected"] == true
                                    ? Container(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 20,
                                        width: 20,
                                      )),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
                width: MediaQuery.of(context).size.width,
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 5,
                  endIndent: 0,
                ),
              ),
            ],
          )),
    );
  }
}
