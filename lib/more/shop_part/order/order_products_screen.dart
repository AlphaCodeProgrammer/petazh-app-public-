import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import './order_product_mobile_template.dart';
import 'order_product_template.dart';
import 'package:flutter/gestures.dart';
import 'reject_order/reject_order.screen.dart';

class ORDER_PRODUCTS_SCREEN extends StatefulWidget {
  @override
  State<ORDER_PRODUCTS_SCREEN> createState() => _ORDER_PRODUCTS_SCREENState();
}

void toSelectTimeRoute(BuildContext ctx) {}

class _ORDER_PRODUCTS_SCREENState extends State<ORDER_PRODUCTS_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).showOffOrder();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      //your code goes here
    });
    final storeFunc = Provider.of<Barbers>(context);
    final orderProducts = storeFunc.orderProducts;
    final singleOrder = storeFunc.singleOrder;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(
              "${singleOrder["specialId"]} :  شماره سفارش ".toPersianDigit()),
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
                      singleOrder["canCancel"] == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                PopupMenuButton(
                                  enableFeedback: false,
                                  color: Colors.white,
                                  elevation: 0,
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Color.fromARGB(
                                                255, 235, 63, 63),
                                            decorationColor: Color.fromARGB(
                                                255, 71, 10, 10)),
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                onSurface: Color.fromARGB(
                                                    255, 143, 15, 247),
                                                shadowColor: Color.fromARGB(
                                                    0, 224, 14, 14),
                                                backgroundColor: Colors.white),
                                            onPressed: () {
                                              storeFunc.buttonLoader == true
                                                  ? () {}
                                                  : storeFunc
                                                      .rejectOrder(context);
                                            },
                                            child: Text("لغو سفارش",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontFamily: "Shabnam",
                                                    fontSize: 12))))
                                  ],
                                  icon: Icon(
                                    Icons.more_vert_outlined,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              width: 1,
                            ),
                      Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(children: [
                              singleOrder["declinedAnySeller"] == true
                                  ? Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "با عرض پوزش خرید شما به علت اتمام موجودی توسط فروشنده لغو شد و  هزینه ی پرداختی به اکانت شما بازگشت داده شده است با تشکر از حسن انتخاب شما "
                                            .toPersianDigit(),
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.red,
                                            fontFamily: "Shabnam"),
                                      ),
                                    )
                                  : SizedBox(
                                      width: 1,
                                    ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "مبلغ پرداختی کل : ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontFamily: "Shabnam"),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          singleOrder["payment"]
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "هزینه ارسال : ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontFamily: "Shabnam"),
                                    ),
                                    singleOrder["sendPrice"] != 0
                                        ? Row(
                                            children: [
                                              Text(
                                                singleOrder["sendPrice"]
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
                                              Text(
                                                "تومان",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey,
                                                    fontFamily: "Khandevane"),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            "رایگان",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.green,
                                                fontFamily: "Shabnam"),
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
                                          "${singleOrder["sendAddress"]["reciverName"]} "
                                              .toPersianDigit(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87,
                                              fontFamily: "Shabnam"),
                                        ),
                                        Text(
                                          "${singleOrder["sendAddress"]["reciverPhone"]}"
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
                                  "${singleOrder["sendAddress"]["city"]}, ${singleOrder["sendAddress"]["address"]}"
                                      .toPersianDigit(),
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      fontFamily: "Shabnam"),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "زمان تحویل : ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontFamily: "Shabnam"),
                                    ),
                                    Text(
                                      "${singleOrder["sendTime"]["weekDayName"]} ,${singleOrder["sendTime"]["fullDate"]}  "
                                          .toPersianDigit(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontFamily: "Shabnam"),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          singleOrder["deleteOrderByUser"] == false
                              ? singleOrder["petazhPost"] == true
                                  ? singleOrder["postManSending"] == true
                                      ? singleOrder["recivedByUser"] == true
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Color.fromARGB(
                                                      255, 21, 255, 0),
                                                ),
                                                Text(
                                                  "تحویل داده شده"
                                                      .toPersianDigit(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 21, 255, 0),
                                                      fontFamily: "Shabnam"),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SpinKitThreeBounce(
                                                  color: Color.fromARGB(
                                                      255, 130, 211, 0),
                                                  size: 10,
                                                ),
                                                Text(
                                                  "تحویل پست".toPersianDigit(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 130, 211, 0),
                                                      fontFamily: "Shabnam"),
                                                ),
                                              ],
                                            )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SpinKitThreeBounce(
                                              color: Color.fromARGB(
                                                  255, 4, 121, 255),
                                              size: 10,
                                            ),
                                            Text(
                                              "آماده ارسال توسط پیتاژ"
                                                  .toPersianDigit(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromARGB(
                                                      255, 4, 121, 255),
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
                                              Color.fromARGB(255, 238, 56, 255),
                                          size: 10,
                                        ),
                                        Text(
                                          "ارسال به انبار پیتاژ"
                                              .toPersianDigit(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 238, 56, 255),
                                              fontFamily: "Shabnam"),
                                        ),
                                      ],
                                    )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "لغو شده".toPersianDigit(),
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
                                child: MediaQuery.of(context).size.width > 700
                                    ? SizedBox(
                                        height: 470,
                                        child: ScrollConfiguration(
                                          behavior:
                                              ScrollConfiguration.of(context)
                                                  .copyWith(
                                            dragDevices: {
                                              PointerDeviceKind.touch,
                                              PointerDeviceKind.mouse,
                                            },
                                          ),
                                          child: ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: orderProducts.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return ORDER_PRODUCTS_TEMPLATE(
                                                orderProducts[index]
                                                    ["productId"],
                                                orderProducts[index]
                                                    ["productName"],
                                                orderProducts[index]
                                                    ["productImage"],
                                                orderProducts[index]
                                                    ["shopNameSeller"],
                                                orderProducts[index]
                                                    ["sellerId"],
                                                orderProducts[index]["color"],
                                                orderProducts[index]
                                                    ["colorName"],
                                                orderProducts[index]
                                                    ["quantity"],
                                                orderProducts[index]["value"],
                                                orderProducts[index]["group"],
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 400,
                                        child: ScrollConfiguration(
                                          behavior:
                                              ScrollConfiguration.of(context)
                                                  .copyWith(
                                            dragDevices: {
                                              PointerDeviceKind.touch,
                                              PointerDeviceKind.mouse,
                                            },
                                          ),
                                          child: ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: orderProducts.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return ORDER_PRODUCTS_MOBILE_TEMPLATE(
                                                  orderProducts[index]
                                                      ["productId"],
                                                  orderProducts[index]
                                                      ["productName"],
                                                  orderProducts[index]
                                                      ["productImage"],
                                                  orderProducts[index]
                                                      ["shopNameSeller"],
                                                  orderProducts[index]
                                                      ["sellerId"],
                                                  orderProducts[index]["color"],
                                                  orderProducts[index]
                                                      ["colorName"],
                                                  orderProducts[index]
                                                      ["quantity"],
                                                  orderProducts[index]["value"],
                                                  orderProducts[index]["group"],
                                                );
                                              }),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          singleOrder["postManSending"] == true &&
                                  singleOrder["recivedByUser"] == false
                              ? Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "پس از دریافت و اعتبار سنجی محصولات بر روی دریافت امتیاز کلیک کنید "
                                          .toPersianDigit(),
                                      maxLines: 4,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontFamily: "Shabnam"),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 1,
                                ),
                          singleOrder["postManSending"] == true &&
                                  singleOrder["recivedByUser"] == false
                              ? Container(
                                  width: 150,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        primary: Colors.transparent,
                                        padding: EdgeInsets.all(5)),
                                    onPressed: () {
                                      storeFunc.showSnackBar(
                                          context,
                                          "لطفا گزینه را نگه دارید",
                                          Colors.red);
                                    },
                                    onLongPress: () {
                                      storeFunc.userRecivedOrder();
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();

                                      storeFunc.showSnackBar(
                                          context,
                                          "با تشکر از حسن انتخاب شما",
                                          Colors.green);
                                    },
                                    child: Align(
                                      child: Text(
                                        "دریافت امتیاز",
                                        style: TextStyle(
                                            fontFamily: "Shabnam",
                                            fontSize: 12,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 1,
                                ),
                          singleOrder["recivedByUser"] == true &&
                                  singleOrder["canRejectOrder"] == true
                              ? Container(
                                  width: 150,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(5),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        primary: Colors.transparent,
                                        padding: EdgeInsets.all(5)),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed("/reject-order");
                                      storeFunc.makeProductReadyForRejection();
                                    },
                                    child: Align(
                                      child: Text(
                                        "درخواست مرجوعی",
                                        style: TextStyle(
                                            fontFamily: "Shabnam",
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 1,
                                )
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
