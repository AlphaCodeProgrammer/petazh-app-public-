import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';

class RANGE_PRICE extends StatefulWidget {
  @override
  State<RANGE_PRICE> createState() => _RANGE_PRICEState();
}

class _RANGE_PRICEState extends State<RANGE_PRICE> {
  var selecteRangePriceCosmetic = RangeValues(0, 9000000);
  var selecteRangePriceCare = RangeValues(0, 25000000);
  var selecteRangePriceElectrice = RangeValues(0, 250000000);
  double maxSelected = 0;
  double minSelected = 9000000;
  final startRange = TextEditingController();
  final endRange = TextEditingController();
  bool _isInit = true;
  void didChangeDependencies() {
    if (_isInit) {
      endRange.text = minSelected.toString().toPersianDigit().seRagham();
      startRange.text = maxSelected.toString().toPersianDigit().seRagham();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return storeFunc.selectedGroup.length > 0
        ? Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text("بازه قیمتی ",
                      style: TextStyle(
                          fontFamily: "Shabnam",
                          fontSize: 10,
                          color: Colors.grey)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.right,
                        controller: startRange,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
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
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text("تا",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 10,
                              color: Colors.grey)),
                    ),
                    Container(
                      width: 100,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.right,
                        controller: endRange,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
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
                ),
                storeFunc.selectedGroup.length > 0
                    ? storeFunc.selectedGroup[0] == "لوازم آرایشی"
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(10),
                            child: RangeSlider(
                              values: selecteRangePriceCosmetic,
                              max: 9000000,
                              activeColor: Colors.cyan,
                              inactiveColor: Colors.grey,
                              divisions: 100000,
                              labels: RangeLabels(
                                  "ارزان ترین : ${selecteRangePriceCosmetic.start.round().toString().toPersianDigit().seRagham()} ",
                                  "گران ترین : ${selecteRangePriceCosmetic.end.round().toString().toPersianDigit().seRagham()}"),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  selecteRangePriceCosmetic = values;
                                  maxSelected = values.end;
                                  minSelected = values.start;
                                  startRange.text = values.start
                                      .toString()
                                      .toPersianDigit()
                                      .seRagham();
                                  endRange.text = values.end
                                      .toString()
                                      .toPersianDigit()
                                      .seRagham();

                                  storeFunc.selectRangePriceFunc(
                                      maxSelected, minSelected);
                                });
                              },
                            ),
                          )
                        : storeFunc.selectedGroup[0] == "لوازم بهداشتی"
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(10),
                                child: RangeSlider(
                                  values: selecteRangePriceCare,
                                  max: 25000000,
                                  activeColor: Colors.cyan,
                                  inactiveColor: Colors.grey,
                                  divisions: 100000,
                                  labels: RangeLabels(
                                      "ارزان ترین : ${selecteRangePriceCare.start.round().toString().toPersianDigit().seRagham()} ",
                                      "گران ترین : ${selecteRangePriceCare.end.round().toString().toPersianDigit().seRagham()}"),
                                  onChanged: (RangeValues values) {
                                    setState(() {
                                      selecteRangePriceCare = values;
                                      // maxSelected = values.end;
                                      // minSelected = values.start;
                                      startRange.text = values.start
                                          .toString()
                                          .toPersianDigit()
                                          .seRagham();
                                      endRange.text = values.end
                                          .toString()
                                          .toPersianDigit()
                                          .seRagham();

                                      storeFunc.selectRangePriceFunc(
                                          maxSelected, minSelected);
                                    });
                                  },
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(10),
                                child: RangeSlider(
                                  values: selecteRangePriceElectrice,
                                  max: 250000000,
                                  activeColor: Colors.cyan,
                                  inactiveColor: Colors.grey,
                                  divisions: 100000,
                                  labels: RangeLabels(
                                      "ارزان ترین : ${selecteRangePriceElectrice.start.round().toString().toPersianDigit().seRagham()} ",
                                      "گران ترین : ${selecteRangePriceElectrice.end.round().toString().toPersianDigit().seRagham()}"),
                                  onChanged: (RangeValues values) {
                                    setState(() {
                                      selecteRangePriceElectrice = values;
                                      maxSelected = values.end;
                                      minSelected = values.start;
                                      startRange.text = values.start
                                          .toString()
                                          .toPersianDigit()
                                          .seRagham();
                                      endRange.text = values.end
                                          .toString()
                                          .toPersianDigit()
                                          .seRagham();

                                      storeFunc.selectRangePriceFunc(
                                          maxSelected, minSelected);
                                    });
                                  },
                                ),
                              )
                    : SizedBox(
                        height: 1,
                      )
              ],
            ),
          )
        : SizedBox(
            width: 1,
          );
  }
}
