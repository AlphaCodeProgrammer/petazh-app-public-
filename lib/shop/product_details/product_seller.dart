import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../../repetitive_widgets/rating_star.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PRODUCT_SELLER extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Card(
      color: Color.fromARGB(255, 250, 244, 244),
      margin: EdgeInsets.only(top: 20),
      child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Text("فروشنده",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 14,
                        color: Colors.black)),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                    "نمایش  قیمت کالا بر اساس کمترین قیمت انتخاب خواهد شد",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.grey)),
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.store_mall_directory_outlined,
                    color: Colors.grey,
                  )),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                        storeFunc.productDetails["selectedSeller"]
                                    ["shopName"] ==
                                null
                            ? ""
                            : storeFunc.productDetails["selectedSeller"]
                                ["shopName"],
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 14,
                            color: Colors.cyan)),
                  ),
                  if (storeFunc.productDetails["selectedSeller"]["sellerRate"]
                          ["numberOfRates"] >
                      1)
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RATING_STAR(1, true, () {}, 1),
                              Text("امتیاز : ",
                                  style: TextStyle(
                                      fontFamily: "Shabnam",
                                      fontSize: 10,
                                      color: Colors.cyan)),
                            ],
                          ),
                          Text(
                              storeFunc.productDetails["selectedSeller"]
                                      ["sellerRate"]["rateNumber"]
                                  .toString()
                                  .toPersianDigit(),
                              style: TextStyle(
                                  fontFamily: "Shabnam",
                                  fontSize: 14,
                                  color: Colors.black)),
                        ],
                      ),
                    )
                  else
                    SizedBox(
                      height: 1,
                    )
                ],
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text("مرجع فروش کالا های آرایشی بهداشتی",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.grey)),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width > 1000
                      ? MediaQuery.of(context).size.width / 5
                      : MediaQuery.of(context).size.width / 1.1,
                  child: Divider(
                    color: Color.fromARGB(255, 214, 213, 213),
                    thickness: 1,
                    height: 1,
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width > 1000
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.add_task_outlined,
                        color: Colors.grey,
                      ),
                      Text("  گارانتی اصالت  ",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Colors.black)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 6,
                  child: Divider(
                    color: Color.fromARGB(255, 214, 213, 213),
                    thickness: 1,
                    height: 1,
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width > 1000
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.health_and_safety_outlined,
                        color: Colors.grey,
                      ),
                      Text("  گارانتی سلامت فیزیکی  ",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Colors.black)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 4,
                  child: Divider(
                    color: Color.fromARGB(255, 214, 213, 213),
                    thickness: 1,
                    height: 1,
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width > 1000
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.save,
                        color: Colors.grey,
                      ),
                      Text("  موجود در انبار  ",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Colors.black)),
                    ],
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width > 1000
                    ? MediaQuery.of(context).size.width / 4
                    : MediaQuery.of(context).size.width / 1.1,
                child: Text(
                    "زمان ارسال با توجه انتخاب شما در زمان انتخاب زمان ارسال مشخص میشود ",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.grey)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("قیمت مصرف کننده",
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 10,
                            color: Colors.grey)),
                  ),
                  Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          storeFunc.productDetails["selectedSeller"]["off"] > 0
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        storeFunc
                                            .productDetails["selectedSeller"]
                                                ["price"]
                                            .toString()
                                            .toPersianDigit()
                                            .seRagham(),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
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
                                  child: (storeFunc.addToCartLoader == true &&
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
                                          padding: EdgeInsets.all(11),
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
                                              width: 150,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
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
                                                                        244)),
                                                        onPressed: () {
                                                          storeFunc.addToCart(
                                                              storeFunc.productDetails[
                                                                      "selectedSeller"]
                                                                  ["sellerId"],
                                                              storeFunc.productDetails[
                                                                      "selectedSeller"]
                                                                  [
                                                                  "userQuantity"],
                                                              context);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          size: 20,
                                                          color: Colors.green,
                                                        )),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: Text(
                                                      storeFunc.productDetails[
                                                              "selectedSeller"]
                                                              ["userQuantity"]
                                                          .toString()
                                                          .toPersianDigit(),
                                                      style: TextStyle(
                                                          fontSize: storeFunc.productDetails[
                                                                          "selectedSeller"]
                                                                      [
                                                                      "userQuantity"] >
                                                                  999
                                                              ? 9
                                                              : 12,
                                                          fontFamily: "Shabnam",
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          elevation: 0,
                                                          shadowColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  250,
                                                                  244,
                                                                  244),
                                                          primary:
                                                              Color.fromARGB(
                                                                  255,
                                                                  250,
                                                                  244,
                                                                  244),
                                                        ),
                                                        onPressed: () {
                                                          storeFunc.removeFromCard(
                                                              storeFunc.productDetails[
                                                                      "selectedSeller"]
                                                                  ["sellerId"],
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
                                          ],
                                        ))
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (storeFunc.addToCartLoader == true &&
                                                storeFunc.sellerId ==
                                                    storeFunc.productDetails["selectedSeller"]
                                                        ["sellerId"]) ||
                                            (storeFunc.sellerId.isNotEmpty &&
                                                storeFunc.addToCartLoader ==
                                                    true &&
                                                storeFunc.sellerId ==
                                                    storeFunc.productDetails[
                                                            "selectedSeller"]
                                                        ["sellerId"])
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 238, 94, 84),
                                                padding: EdgeInsets.only(
                                                    top: 20,
                                                    bottom: 20,
                                                    right: 50,
                                                    left: 50)),
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
                                            child: Row(
                                              children: [
                                                Icon(Icons.shopping_cart),
                                                Text(
                                                  "  افزودن به سبد خرید  ",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: "Shabnam"),
                                                ),
                                              ],
                                            ))
                                  ],
                                ),
                        ],
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
