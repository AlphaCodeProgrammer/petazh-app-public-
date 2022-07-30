import './rejected_products_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../providers/store.dart';
import '../../../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter/gestures.dart';
import '../../product_basket_template.dart';

class REJECTED_PRODUCTS_SCREEN extends StatefulWidget {
  @override
  State<REJECTED_PRODUCTS_SCREEN> createState() =>
      _REJECTED_PRODUCTS_SCREENState();
}

void toSelectTimeRoute(BuildContext ctx) {}

class _REJECTED_PRODUCTS_SCREENState extends State<REJECTED_PRODUCTS_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      //your code goes here
    });
    final storeFunc = Provider.of<Barbers>(context);
    final orderProducts = storeFunc.orderProducts;
    final singleRejectedOrder = storeFunc.singleRejectedOrder;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(
              "${singleRejectedOrder["specialId"]} :  شماره سفارش "
                  .toPersianDigit()),
        ),
        body: storeFunc.orderProductsLoader == false
            ? storeFunc.orderProductsLoader == false &&
                    storeFunc.orderProducts.length == 0
                ? Center(
                    child: Text(
                    "این سفارش موجود نمیباشد",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.black),
                  ))
                : ListView(
                    children: [
                      Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "مبلغ پرداختی محصولات مرجوعی : ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontFamily: "Shabnam"),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          singleRejectedOrder[
                                                  "totalOrderRejectPayment"]
                                              .toString()
                                              .toPersianDigit()
                                              .seRagham(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blue,
                                              fontFamily: "Shabnam"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Text(
                                            "تومان",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                                fontFamily: "Khandevane"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "تحویل گیرنده : ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontFamily: "Shabnam"),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${singleRejectedOrder["sendAddress"]["reciverName"]} "
                                              .toPersianDigit(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87,
                                              fontFamily: "Shabnam"),
                                        ),
                                        Text(
                                          "${singleRejectedOrder["sendAddress"]["reciverPhone"]}"
                                              .toPersianDigit(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87,
                                              fontFamily: "Shabnam"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Text(
                                  "${singleRejectedOrder["sendAddress"]["city"]}, ${singleRejectedOrder["sendAddress"]["address"]}"
                                      .toPersianDigit(),
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      fontFamily: "Shabnam"),
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          singleRejectedOrder["checkedByPetazh"] == true
                              ? singleRejectedOrder["acceptedByPetazh"] == true
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "پذیرش مرجوعی".toPersianDigit(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 12, 145, 0),
                                              fontFamily: "Shabnam"),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SpinKitThreeBounce(
                                          color:
                                              Color.fromARGB(255, 4, 121, 255),
                                          size: 10,
                                        ),
                                        Text(
                                          "در حال برسی".toPersianDigit(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 4, 121, 255),
                                              fontFamily: "Shabnam"),
                                        ),
                                      ],
                                    )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SpinKitThreeBounce(
                                      color: Colors.red,
                                      size: 10,
                                    ),
                                    Text(
                                      "در صف برسی".toPersianDigit(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
                                          fontFamily: "Shabnam"),
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "محصولات خریداری شده",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 157, 158, 158),
                                fontFamily: "Shabnam"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: SizedBox(
                                    height: 450,
                                    child: ScrollConfiguration(
                                      behavior: ScrollConfiguration.of(context)
                                          .copyWith(
                                        dragDevices: {
                                          PointerDeviceKind.touch,
                                          PointerDeviceKind.mouse,
                                        },
                                      ),
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 1000,
                                                childAspectRatio: 3,
                                                crossAxisSpacing: 0,
                                                mainAxisExtent: 300,
                                                mainAxisSpacing: 0),
                                        itemCount: orderProducts.length,
                                        itemBuilder: (context, index) {
                                          return REJECTED_PRODUCTS_TEMPLATE(
                                            orderProducts[index]["productId"],
                                            orderProducts[index]["productName"],
                                            orderProducts[index]
                                                ["productImage"],
                                            orderProducts[index]
                                                ["shopNameSeller"],
                                            orderProducts[index]["sellerId"],
                                            orderProducts[index]["color"],
                                            orderProducts[index]["colorName"],
                                            orderProducts[index]["quantity"],
                                            orderProducts[index]["value"],
                                            orderProducts[index]["group"],
                                          );
                                        },
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
