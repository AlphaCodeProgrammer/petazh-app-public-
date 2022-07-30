import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../fix/single_back.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'product_rating_template.dart';
import 'product_rating_template.dart';

class PRODUCT_RATING_SCREEN extends StatelessWidget {
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final unratedProducts = storeFunc.unratedProducts["productsList"];

    return Scaffold(
        appBar: AppBar(
            elevation: 0.5,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            title: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SINGLE_BACK(Colors.grey, Colors.white, 50, 50),
                    Text(
                      "",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: "Shabnam"),
                    ),
                  ],
                ),
              ),
            )),
        body: storeFunc.lp1 == false
            ? storeFunc.lp1 == false && storeFunc.unratedProducts.length > 0
                ? Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Center(
                              child: SizedBox(
                                height: 300,
                                child: ScrollConfiguration(
                                  behavior:
                                      ScrollConfiguration.of(context).copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.touch,
                                      PointerDeviceKind.mouse,
                                    },
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 1000,
                                                childAspectRatio: 3,
                                                crossAxisSpacing: 0,
                                                mainAxisExtent: 300,
                                                mainAxisSpacing: 0),
                                        itemCount: unratedProducts.length,
                                        itemBuilder: (context, index) {
                                          return PRODUCT_RATING_TEMPLATE(
                                            unratedProducts[index]["productId"],
                                            unratedProducts[index]
                                                ["productName"],
                                            unratedProducts[index]
                                                ["productImage"],
                                            unratedProducts[index]
                                                ["shopNameSeller"],
                                            unratedProducts[index]["sellerId"],
                                            unratedProducts[index]["color"],
                                            unratedProducts[index]["colorName"],
                                            unratedProducts[index]["quantity"],
                                            unratedProducts[index]["value"],
                                            unratedProducts[index]["group"],
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: storeFunc.buttonLoader == false
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        fixedSize: const Size(100, 35),
                                        padding: EdgeInsets.all(10)),
                                    onPressed: () {
                                      storeFunc.postRatingProducts(context);
                                    },
                                    child: Text(
                                      "ثبت امتیاز",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "Shabnam"),
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      padding: EdgeInsets.all(10),
                                      fixedSize: const Size(100, 38),
                                    ),
                                    onPressed: () {},
                                    child: SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 15,
                                    ))),
                      )
                    ],
                  )
                : Center(
                    child: Text(
                    "محصولات برای امیتیاز دهی موجود نمیباشید",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.grey),
                  ))
            : Center(
                child: SpinKitThreeBounce(
                  size: 12,
                  color: Colors.grey,
                ),
              ));
  }
}
