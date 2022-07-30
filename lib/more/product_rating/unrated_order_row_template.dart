import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UNRATED_ORDER_ROW_TEMPLATE extends StatelessWidget {
  Function speceficFunction;
  String specialId;
  String id;
  List<dynamic> productsImage;
  int payment;
  bool postManSending;
  bool petazhPost;
  int productCount;
  bool recivedByUser;
  bool deleteOrderByUser;

  UNRATED_ORDER_ROW_TEMPLATE(
      this.speceficFunction,
      this.specialId,
      this.id,
      this.productsImage,
      this.payment,
      this.postManSending,
      this.petazhPost,
      this.productCount,
      this.recivedByUser,
      this.deleteOrderByUser);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        speceficFunction();
      },
      child: Card(
        elevation: 5,
        child: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: MediaQuery.of(context).size.width < 800
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              specialId.toString().toPersianDigit(),
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontFamily: "Shabnam"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "کالا",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  productCount.toString().toPersianDigit(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "تومان",
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  payment
                                      .toString()
                                      .toPersianDigit()
                                      .seRagham(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  ": پرداختی",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                              ],
                            ),

                            //  deleteOrderByUser = true?
                            deleteOrderByUser == false
                                ? petazhPost == true
                                    ? postManSending == true
                                        ? recivedByUser == true
                                            ? Row(
                                                children: [
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
                                                children: [
                                                  SpinKitThreeBounce(
                                                    color: Color.fromARGB(
                                                        255, 130, 211, 0),
                                                    size: 10,
                                                  ),
                                                  Text(
                                                    "تحویل پست"
                                                        .toPersianDigit(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 130, 211, 0),
                                                        fontFamily: "Shabnam"),
                                                  ),
                                                ],
                                              )
                                        : Row(
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
                                        children: [
                                          SpinKitThreeBounce(
                                            color: Color.fromARGB(
                                                255, 238, 56, 255),
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
                                    children: [
                                      Text(
                                        "لغو شده".toPersianDigit(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.red,
                                            fontFamily: "Shabnam"),
                                      ),
                                    ],
                                  )
                          ],
                        )),
                        Container(
                          width: mediaQuery.width > 600
                              ? mediaQuery.width / 2
                              : mediaQuery.width / 3,
                          height: 100,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.mouse,
                                },
                              ),
                              child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productsImage.length,
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: Image.network(
                                        productsImage[index],
                                        fit: BoxFit.fitHeight,
                                        width: 80,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: mediaQuery.width > 600
                              ? mediaQuery.width / 3
                              : mediaQuery.width / 3,
                          height: 100,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.mouse,
                                },
                              ),
                              child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productsImage.length,
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: Image.network(
                                        productsImage[index],
                                        fit: BoxFit.fitHeight,
                                        width: 80,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            deleteOrderByUser == false
                                ? petazhPost == true
                                    ? postManSending == true
                                        ? recivedByUser == true
                                            ? Row(
                                                children: [
                                                  Text(
                                                    "تحویل داده شده"
                                                        .toPersianDigit(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 69, 212, 55),
                                                        fontFamily: "Shabnam"),
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  SpinKitThreeBounce(
                                                    color: Color.fromARGB(
                                                        255, 130, 211, 0),
                                                    size: 10,
                                                  ),
                                                  Text(
                                                    "تحویل پست"
                                                        .toPersianDigit(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 130, 211, 0),
                                                        fontFamily: "Shabnam"),
                                                  ),
                                                ],
                                              )
                                        : Row(
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
                                        children: [
                                          SpinKitThreeBounce(
                                            color: Color.fromARGB(
                                                255, 238, 56, 255),
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
                              width: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "تومان",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  payment
                                      .toString()
                                      .toPersianDigit()
                                      .seRagham(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  " : پرداختی",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "کالا",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  productCount.toString().toPersianDigit(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              specialId.toString().toPersianDigit(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  fontFamily: "Shabnam"),
                            ),
                          ],
                        )),
                      ],
                    )),
        ),
      ),
    );
  }
}
