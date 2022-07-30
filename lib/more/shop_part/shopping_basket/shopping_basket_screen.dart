import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import './cart_product_mobile_template.dart';

class SHOPPING_BASKET_SCREEN extends StatefulWidget {
  @override
  State<SHOPPING_BASKET_SCREEN> createState() => _SHOPPING_BASKET_SCREENState();
}

void toSelectTimeRoute(BuildContext ctx) {}

class _SHOPPING_BASKET_SCREENState extends State<SHOPPING_BASKET_SCREEN> {
  var _isInit = true;

  void didChangeDependencies() async {
    try {
      if (_isInit) {
        Provider.of<Barbers>(context, listen: false).getReadyOrderBasket(true);
      }
      _isInit = false;
    } catch (err) {}

    super.didChangeDependencies();
  }

  void showWidth() {
    double width = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      //your code goes here
    });
    final storeFunc = Provider.of<Barbers>(context);
    final orderBasket = storeFunc.orderBasket;
    final difference = storeFunc.totalPrice - storeFunc.totalPriceByOff;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("سبد خرید شما"),
        ),
        body: storeFunc.orderBasketLoader == false
            ? storeFunc.orderBasketLoader == false &&
                    storeFunc.orderBasket.length == 0
                ? Center(
                    child: Text(
                    "سبد خرید شما خالی میباشد",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.black),
                  ))
                : Column(
                    children: [
                      Expanded(
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
                              itemCount: orderBasket.length,
                              itemBuilder: (context, index) {
                                return CART_PRODUCT_MOBILE_TEMPLATE(
                                  orderBasket[index]["productId"],
                                  orderBasket[index]["productName"],
                                  orderBasket[index]["productImage"],
                                  orderBasket[index]["shopNameSeller"],
                                  orderBasket[index]["sellerId"],
                                  orderBasket[index]["color"],
                                  orderBasket[index]["colorName"],
                                  orderBasket[index]["quantity"],
                                  orderBasket[index]["value"],
                                  orderBasket[index]["group"],
                                  orderBasket[index]["changing"],
                                );
                              }),
                        ),
                      ),
                      storeFunc.totalPriceByOff > 0
                          ? Card(
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        difference > 0
                                            ? Container(
                                                child: Text(
                                                  " % ${storeFunc.averageOffPercent} "
                                                      .toPersianDigit(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 1,
                                              ),
                                        difference > 0 &&
                                                MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    400
                                            ? Align(
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.red),
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
                                                          child: Text(
                                                            " تومان "
                                                                .toPersianDigit(),
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 8,
                                                                fontFamily:
                                                                    "Khandevane"),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            "${difference}"
                                                                .toPersianDigit()
                                                                .seRagham()
                                                                .toPersianDigit(),
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 10,
                                                                fontFamily:
                                                                    "Shabnam"),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            " : تخفیف",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 10,
                                                                fontFamily:
                                                                    "Shabnam"),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 1,
                                              ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "  تومان   ",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10,
                                            fontFamily: "Khandevane"),
                                      ),
                                      Text(
                                        "${storeFunc.totalPriceByOff}"
                                            .toPersianDigit()
                                            .seRagham(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      Text(
                                        " : مبلغ پرداختی ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: "Shabnam"),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        padding: EdgeInsets.all(10)),
                                    onPressed: () {
                                      storeFunc.getAvilableDaysForSendProduct(
                                          context);
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            " ادامه",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: "Shabnam"),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 1,
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
