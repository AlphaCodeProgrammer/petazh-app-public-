import "package:flutter/material.dart";
import '../../repetitive_widgets/simple_appbar.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MORE_SELLERS_SCREEN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("${storeFunc.productDetails["name"]}".length > 0
              ? "${storeFunc.productDetails["name"]}"
              : ""),
        ),
        body: MediaQuery.of(context).size.width > 930
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ...(storeFunc.productDetails["otherSellers"]
                            as List<dynamic>)
                        .map((seller) {
                      return Card(
                        elevation: 5,
                        child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(5),
                            child: Row(children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.store_mall_directory_outlined,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        seller["shopName"]
                                            .toString()
                                            .toPersianDigit(),
                                        style: TextStyle(
                                            fontFamily: "Shabnam",
                                            fontSize: 12,
                                            color: Colors.black),
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
                                          ? Text(
                                              "${seller["sellerRate"]["rateNumber"]}",
                                              style: TextStyle(
                                                  fontFamily: "Shabnam",
                                                  fontSize: 10,
                                                  color: Colors.green))
                                          : SizedBox(
                                              width: 1,
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.send_outlined,
                                          color: Colors.grey,
                                        )),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "ارسال توسط پیتاژ",
                                        style: TextStyle(
                                            fontFamily: "Shabnam",
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.health_and_safety_outlined,
                                          color: Colors.grey,
                                        )),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        " اصالت و سلامت فیزیکی",
                                        style: TextStyle(
                                            fontFamily: "Shabnam",
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    seller["off"] > 0
                                        ? Container(
                                            child: ClipOval(
                                              child: Container(
                                                color: Colors.red,
                                                padding: EdgeInsets.all(3),
                                                child: Text(
                                                  "${seller["off"]}%"
                                                      .toString()
                                                      .toPersianDigit(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            width: 1,
                                          ),
                                    seller["off"] > 0
                                        ? Container(
                                            child: Text(
                                                seller["price"]
                                                    .toString()
                                                    .toPersianDigit()
                                                    .seRagham(),
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor:
                                                        Colors.grey,
                                                    fontFamily: "Shabnam",
                                                    fontSize: 12,
                                                    color: Colors.grey)),
                                          )
                                        : SizedBox(
                                            width: 1,
                                          ),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              child: RichText(
                                                  text: TextSpan(children: [
                                            TextSpan(
                                                text: seller["priceByOff"]
                                                    .toString()
                                                    .toPersianDigit()
                                                    .seRagham(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Shabnam",
                                                    fontSize: 16)),
                                            TextSpan(
                                                text: "  تومان  ",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontFamily: "Khandevane",
                                                    fontSize: 10)),
                                          ]))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              storeFunc.productDetails["avilable"]
                                  ? seller["userQuantity"] > 0
                                      ? Expanded(
                                          flex: 2,
                                          child: (storeFunc.addToCartLoader ==
                                                          true &&
                                                      storeFunc
                                                              .sellerId ==
                                                          seller["sellerId"]) ||
                                                  (storeFunc
                                                          .sellerId.isNotEmpty &&
                                                      storeFunc
                                                              .addToCartLoader ==
                                                          true &&
                                                      storeFunc.sellerId ==
                                                          seller["sellerId"])
                                              ? SpinKitThreeBounce(
                                                  color: Colors.red,
                                                  size: 15,
                                                )
                                              : Container(
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    elevation:
                                                                        0,
                                                                    shadowColor:
                                                                        Colors
                                                                            .white,
                                                                    primary: Colors
                                                                        .white),
                                                            onPressed: () {
                                                              storeFunc.addToCart(
                                                                  seller[
                                                                      "sellerId"],
                                                                  seller[
                                                                      "userQuantity"],
                                                                  context);
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 20,
                                                              color:
                                                                  Colors.green,
                                                            )),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Text(
                                                          seller["userQuantity"]
                                                              .toString()
                                                              .toPersianDigit(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "Shabnam",
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 50,
                                                        child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    elevation:
                                                                        0,
                                                                    shadowColor:
                                                                        Colors
                                                                            .white,
                                                                    primary: Colors
                                                                        .white),
                                                            onPressed: () {
                                                              storeFunc
                                                                  .removeFromCard(
                                                                      seller[
                                                                          "sellerId"],
                                                                      context);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 20,
                                                              color: Colors.red,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        )
                                      : Expanded(
                                          flex: 2,
                                          child: (storeFunc.addToCartLoader ==
                                                          true &&
                                                      storeFunc.sellerId ==
                                                          seller["sellerId"] ||
                                                  (storeFunc.sellerId.isNotEmpty &&
                                                      storeFunc.addToCartLoader ==
                                                          true &&
                                                      storeFunc.sellerId ==
                                                          seller["sellerId"]))
                                              ? ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Color.fromARGB(
                                                          255, 238, 94, 84),
                                                      padding:
                                                          EdgeInsets.all(15)),
                                                  onPressed: () {},
                                                  child: SpinKitThreeBounce(
                                                    color: Colors.white,
                                                    size: 15,
                                                  ))
                                              : ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Color.fromARGB(
                                                          255, 238, 94, 84),
                                                      padding:
                                                          EdgeInsets.all(15)),
                                                  onPressed: () {
                                                    storeFunc.addToCart(
                                                        seller["sellerId"],
                                                        seller["userQuantity"],
                                                        context);
                                                  },
                                                  child: Text(
                                                    "  افزودن به سبد خرید  ",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: "Shabnam"),
                                                  )))
                                  : SizedBox(
                                      width: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "ناموجود",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 10,
                                                fontFamily: "Shabnam"),
                                          ),
                                        ],
                                      ))
                            ])),
                      );
                    }).toList(),
                  ],
                ),
              )
            : Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ...(storeFunc.productDetails["otherSellers"]
                            as List<dynamic>)
                        .map((seller) {
                      return Card(
                        elevation: 5,
                        child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              child: Icon(
                                                Icons
                                                    .store_mall_directory_outlined,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              seller["shopName"]
                                                  .toString()
                                                  .toPersianDigit(),
                                              style: TextStyle(
                                                  fontFamily: "Shabnam",
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            seller["sellerRate"]
                                                        ["numberOfRates"] >
                                                    1
                                                ? Text("امتیاز : ",
                                                    style: TextStyle(
                                                        fontFamily: "Shabnam",
                                                        fontSize: 10,
                                                        color: Colors.grey))
                                                : SizedBox(
                                                    width: 1,
                                                  ),
                                            seller["sellerRate"]
                                                        ["numberOfRates"] >
                                                    1
                                                ? Text(
                                                    "${seller["sellerRate"]["rateNumber"]}",
                                                    style: TextStyle(
                                                        fontFamily: "Shabnam",
                                                        fontSize: 10,
                                                        color: Colors.green))
                                                : SizedBox(
                                                    width: 1,
                                                  ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(4),
                                              child: Icon(
                                                Icons.send_outlined,
                                                color: Colors.grey,
                                              )),
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            child: Text(
                                              "ارسال توسط پیتاژ",
                                              style: TextStyle(
                                                  fontFamily: "Shabnam",
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(4),
                                              child: Icon(
                                                Icons
                                                    .health_and_safety_outlined,
                                                color: Colors.grey,
                                              )),
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            child: Text(
                                              " اصالت و سلامت فیزیکی",
                                              style: TextStyle(
                                                  fontFamily: "Shabnam",
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        seller["off"] > 0
                                            ? Container(
                                                child: ClipOval(
                                                  child: Container(
                                                    color: Colors.red,
                                                    padding: EdgeInsets.all(3),
                                                    child: Text(
                                                      "${seller["off"]}%"
                                                          .toString()
                                                          .toPersianDigit(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 1,
                                              ),
                                        seller["off"] > 0
                                            ? Container(
                                                child: Text(
                                                    seller["price"]
                                                        .toString()
                                                        .toPersianDigit()
                                                        .seRagham(),
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        decorationColor:
                                                            Colors.grey,
                                                        fontFamily: "Shabnam",
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                              )
                                            : SizedBox(
                                                width: 1,
                                              ),
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                TextSpan(
                                                    text: seller["priceByOff"]
                                                        .toString()
                                                        .toPersianDigit()
                                                        .seRagham(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: "Shabnam",
                                                        fontSize: 16)),
                                                TextSpan(
                                                    text: "  تومان  ",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontFamily:
                                                            "Khandevane",
                                                        fontSize: 10)),
                                              ]))),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    storeFunc.productDetails["avilable"]
                                        ? seller["userQuantity"] > 0
                                            ? (storeFunc.addToCartLoader == true &&
                                                        storeFunc.sellerId ==
                                                            seller[
                                                                "sellerId"]) ||
                                                    (storeFunc.sellerId.isNotEmpty &&
                                                        storeFunc.addToCartLoader ==
                                                            true &&
                                                        storeFunc.sellerId ==
                                                            seller["sellerId"])
                                                ? SpinKitThreeBounce(
                                                    color: Colors.red,
                                                    size: 15,
                                                  )
                                                : Container(
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 50,
                                                          child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  elevation: 0,
                                                                  shadowColor:
                                                                      Colors
                                                                          .white,
                                                                  primary: Colors
                                                                      .white),
                                                              onPressed: () {
                                                                storeFunc.addToCart(
                                                                    seller[
                                                                        "sellerId"],
                                                                    seller[
                                                                        "userQuantity"],
                                                                    context);
                                                              },
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 20,
                                                                color: Colors
                                                                    .green,
                                                              )),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Text(
                                                            seller["userQuantity"]
                                                                .toString()
                                                                .toPersianDigit(),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "Shabnam",
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 50,
                                                          child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  elevation: 0,
                                                                  shadowColor:
                                                                      Colors
                                                                          .white,
                                                                  primary: Colors
                                                                      .white),
                                                              onPressed: () {
                                                                storeFunc.removeFromCard(
                                                                    seller[
                                                                        "sellerId"],
                                                                    context);
                                                              },
                                                              child: Icon(
                                                                Icons.remove,
                                                                size: 20,
                                                                color:
                                                                    Colors.red,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                            : (storeFunc.addToCartLoader == true && storeFunc.sellerId == seller["sellerId"] ||
                                                    (storeFunc.sellerId.isNotEmpty &&
                                                        storeFunc.addToCartLoader ==
                                                            true &&
                                                        storeFunc.sellerId ==
                                                            seller["sellerId"]))
                                                ? ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        primary: Color.fromARGB(
                                                            255, 238, 94, 84),
                                                        padding:
                                                            EdgeInsets.all(15)),
                                                    onPressed: () {},
                                                    child: SpinKitThreeBounce(
                                                      color: Colors.white,
                                                      size: 15,
                                                    ))
                                                : ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        primary:
                                                            Color.fromARGB(255, 238, 94, 84),
                                                        padding: EdgeInsets.all(15)),
                                                    onPressed: () {
                                                      storeFunc.addToCart(
                                                          seller["sellerId"],
                                                          seller[
                                                              "userQuantity"],
                                                          context);
                                                    },
                                                    child: Text(
                                                      "  افزودن به سبد خرید  ",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily:
                                                              "Shabnam"),
                                                    ))
                                        : SizedBox(
                                            width: 150,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "ناموجود",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 10,
                                                      fontFamily: "Shabnam"),
                                                ),
                                              ],
                                            ))
                                  ],
                                )
                              ],
                            )),
                      );
                    }).toList(),
                  ],
                ),
              ));
  }
}
