import '../../shop/product_details/save_share.dart';
import 'package:flutter/material.dart';
import '../../repetitive_widgets/rating_star.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter/gestures.dart';
import '../products/products_screen.dart';
import 'package:seo_renderer/seo_renderer.dart';

class PRODUCT_INFO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final widthSize = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.all(15),
        child: ListView(shrinkWrap: true, children: [
          Container(
            width: widthSize,
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        elevation: 0,
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      storeFunc.getProducts(storeFunc.productDetails["group"],
                          false, true, "", "", "");
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '', (Route<dynamic> route) => false);

                      Navigator.of(context).pushNamed("/products");
                    },
                    child: TextRenderer(
                      text: Text(
                        storeFunc.productDetails["group"],
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 12,
                            color: Colors.blue),
                      ),
                    )),
                Text("|"),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        elevation: 0,
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      storeFunc.getProducts("", false, true,
                          storeFunc.productDetails["category"], "", "");
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '', (Route<dynamic> route) => false);
                      Navigator.of(context).pushNamed("/products");
                    },
                    child: TextRenderer(
                      text: Text(
                        storeFunc.productDetails["category"],
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 12,
                            color: Colors.blue),
                      ),
                    )),
                Text("|"),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        elevation: 0,
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      storeFunc.getProducts("", false, true, "",
                          storeFunc.productDetails["subCategory"], "");
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '', (Route<dynamic> route) => false);
                      Navigator.of(context).pushNamed("/products");
                    },
                    child: TextRenderer(
                      text: Text(
                        storeFunc.productDetails["subCategory"],
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 12,
                            color: Colors.blue),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: widthSize,
            height: 20,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Align(
                  child: Container(
                    height: 30,
                    child: TextRenderer(
                      text: Text(
                        storeFunc.productDetails["name"],
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: MediaQuery.of(context).size.width > 700
                                ? 16
                                : 14,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / (4 / 7),
              child: Divider(
                color: Color.fromARGB(255, 214, 213, 213),
                thickness: 1,
                height: 1,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    storeFunc.getProducts("", false, true, "", "",
                        storeFunc.productDetails["brand"]);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '', (Route<dynamic> route) => false);
                    Navigator.of(context).pushNamed("/products");
                  },
                  child: Text(
                    storeFunc.productDetails["brand"],
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 12,
                        color: Colors.blue),
                  )),
            ],
          ),
          storeFunc.productDetails["productRating"]["numberOfRates"] > 1
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      RATING_STAR(1, true, () {}, 1),
                      Text(
                          storeFunc.productDetails["productRating"]
                                  ["rateNumber"]
                              .toString()
                              .toPersianDigit(),
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Colors.grey)),
                    ],
                  ),
                )
              : SizedBox(
                  height: 1,
                ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: SizedBox(
              width: MediaQuery.of(context).size.width > 700
                  ? MediaQuery.of(context).size.width
                  : 300,
              height: 60,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    primary: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: storeFunc.productDetails["sellers"].length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                primary: Colors.white),
                            onPressed: () {
                              storeFunc.changeProductColor(storeFunc
                                  .productDetails["sellers"][index]["color"]);
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      color: Colors.cyan,
                                      style: storeFunc.productDetails["sellers"]
                                              [index]["selected"]
                                          ? BorderStyle.solid
                                          : BorderStyle.none),
                                ),
                                child: ClipOval(
                                  child: Container(
                                    color: Color(
                                        storeFunc.productDetails["sellers"]
                                            [index]["color"]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              storeFunc.productDetails["sellers"][index]
                                  ["colorName"],
                              style: TextStyle(
                                  fontFamily: "Shabnam",
                                  fontSize: 10,
                                  color: Colors.black)),
                        ],
                      );
                    }),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width > 700
                ? MediaQuery.of(context).size.width / 2
                : MediaQuery.of(context).size.width / 1.1,
            child: Container(
                margin: EdgeInsets.all(10),
                child: storeFunc.productDetails["info"].length > 200
                    ? Text(
                        "${storeFunc.productDetails["info"].substring(0, 200)}...",
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 12,
                            color: Colors.black))
                    : Text(storeFunc.productDetails["info"],
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 12,
                            color: Colors.black))),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width > 1000
                ? MediaQuery.of(context).size.width / 3
                : MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  "امکان بازگشت کالا برای این کالا تنها در صورتی امکان پذیر است که پلمپ محصول باز نشده باشد",
                  style: TextStyle(
                      fontFamily: "Shabnam", fontSize: 10, color: Colors.grey)),
            ),
          ),
          SAVE_SHARE(),
          SizedBox(
            width: MediaQuery.of(context).size.width > 1000
                ? MediaQuery.of(context).size.width / 3
                : MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  "ارسال رایگان برای سفارش های بالای 500 هزار تومان"
                      .toPersianDigit(),
                  style: TextStyle(
                      fontFamily: "Shabnam",
                      fontSize: 14,
                      color: Colors.green)),
            ),
          ),
        ]));
  }
}
