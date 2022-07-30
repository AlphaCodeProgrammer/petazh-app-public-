import '/shop/product_details/sellers.dart';
import "package:flutter/material.dart";
import './product_images.dart';
import './product_info.dart';
import './product_seller.dart';
import './info.dart';
import './properties.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './product_details_mobile/product_details_mobile_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'dart:html';

class PRODUCT_DETAILS_SCREEN extends StatefulWidget {
  final String productId;
  PRODUCT_DETAILS_SCREEN(this.productId);
  @override
  State<PRODUCT_DETAILS_SCREEN> createState() => _PRODUCT_DETAILS_SCREENState();
}

class _PRODUCT_DETAILS_SCREENState extends State<PRODUCT_DETAILS_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var url = window.location.href;
      Provider.of<Barbers>(context, listen: false)
          .getProductDetailsInfo(widget.productId, context);
    });
    super.initState();
  }

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
        body: !storeFunc.pageProductDetailsLoader
            ? MediaQuery.of(context).size.width > 1000
                ? Card(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: PRODUCT_IMAGES(),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: PRODUCT_INFO(),
                                  flex: 4,
                                ),
                                storeFunc.productDetails["avilable"]
                                    ? Expanded(
                                        child: PRODUCT_SELLER(),
                                        flex: 2,
                                      )
                                    : SizedBox(
                                        height: 1,
                                      ),
                              ],
                            ),
                            storeFunc.productDetails["avilable"]
                                ? SELLERS()
                                : SizedBox(
                                    height: 1,
                                  ),
                            INFO(),
                            PROPERTIESE()
                          ],
                        ),
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child:
                              PRODUCT_DETAILS_MOBILE_SCREEN(widget.productId)),
                      Card(
                          elevation: 0,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("قیمت مصرف کننده",
                                    style: TextStyle(
                                        fontFamily: "Shabnam",
                                        fontSize: 10,
                                        color: Colors.grey)),
                                storeFunc.productDetails["selectedSeller"]
                                            ["off"] >
                                        0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              storeFunc.productDetails[
                                                      "selectedSeller"]["price"]
                                                  .toString()
                                                  .toPersianDigit()
                                                  .seRagham(),
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor: Colors.grey,
                                                  fontFamily: "Shabnam",
                                                  fontSize: 12,
                                                  color: Colors.grey)),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          ClipOval(
                                            child: Container(
                                              color: Colors.red,
                                              padding: EdgeInsets.all(3),
                                              child: Text(
                                                "${storeFunc.productDetails["selectedSeller"]["off"]}%"
                                                    .toString()
                                                    .toPersianDigit(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox(
                                        height: 1,
                                      ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: RichText(
                                            text: TextSpan(children: [
                                      TextSpan(
                                          text: storeFunc
                                              .productDetails["selectedSeller"]
                                                  ["priceByOff"]
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
                                storeFunc.productDetails["selectedSeller"]
                                            ["userQuantity"] >
                                        0
                                    ? Container(
                                        child: (storeFunc.addToCartLoader ==
                                                        true &&
                                                    storeFunc.sellerId ==
                                                        storeFunc.productDetails[
                                                                "selectedSeller"]
                                                            ["sellerId"]) ||
                                                (storeFunc.sellerId.isNotEmpty &&
                                                    storeFunc.addToCartLoader ==
                                                        true &&
                                                    storeFunc.sellerId ==
                                                        storeFunc.productDetails[
                                                                "selectedSeller"]
                                                            ["sellerId"])
                                            ? Container(
                                                padding: EdgeInsets.only(
                                                    left: 40, right: 40),
                                                child: SpinKitThreeBounce(
                                                  color: Colors.red,
                                                  size: 15,
                                                ),
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
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
                                                          child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  elevation: 0,
                                                                  shadowColor: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          250,
                                                                          244,
                                                                          244),
                                                                  primary: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          250,
                                                                          244,
                                                                          244)),
                                                              onPressed: () {
                                                                storeFunc.addToCart(
                                                                    storeFunc.productDetails[
                                                                            "selectedSeller"]
                                                                        [
                                                                        "sellerId"],
                                                                    storeFunc.productDetails[
                                                                            "selectedSeller"]
                                                                        [
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
                                                              EdgeInsets.all(5),
                                                          child: Text(
                                                            storeFunc
                                                                .productDetails[
                                                                    "selectedSeller"]
                                                                    [
                                                                    "userQuantity"]
                                                                .toString()
                                                                .toPersianDigit(),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    storeFunc.productDetails["selectedSeller"]["userQuantity"] >
                                                                            999
                                                                        ? 9
                                                                        : 12,
                                                                fontFamily:
                                                                    "Shabnam",
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                elevation: 0,
                                                                shadowColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        250,
                                                                        244,
                                                                        244),
                                                                primary: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        250,
                                                                        244,
                                                                        244),
                                                              ),
                                                              onPressed: () {
                                                                storeFunc.removeFromCard(
                                                                    storeFunc.productDetails[
                                                                            "selectedSeller"]
                                                                        [
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
                                                  ),
                                                ],
                                              ))
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          (storeFunc.addToCartLoader == true &&
                                                      storeFunc.sellerId ==
                                                          storeFunc.productDetails["selectedSeller"]
                                                              ["sellerId"]) ||
                                                  (storeFunc.sellerId.isNotEmpty &&
                                                      storeFunc.addToCartLoader ==
                                                          true &&
                                                      storeFunc.sellerId ==
                                                          storeFunc.productDetails["selectedSeller"]
                                                              ["sellerId"])
                                              ? ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Color.fromARGB(
                                                          255, 238, 94, 84),
                                                      padding: EdgeInsets.only(
                                                          right: 35, left: 35)),
                                                  onPressed: () {},
                                                  child: SpinKitThreeBounce(
                                                    color: Colors.white,
                                                    size: 15,
                                                  ))
                                              : ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Color.fromARGB(255, 238, 94, 84),
                                                      padding: EdgeInsets.all(15)),
                                                  onPressed: () {
                                                    storeFunc.addToCart(
                                                        storeFunc.productDetails[
                                                                "selectedSeller"]
                                                            ["sellerId"],
                                                        storeFunc.productDetails[
                                                                "selectedSeller"]
                                                            ["userQuantity"],
                                                        context);
                                                  },
                                                  child: Text(
                                                    "افزودن به سبد",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: "Shabnam"),
                                                  ))
                                        ],
                                      ),
                              ],
                            ),
                          )),
                    ],
                  )
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
