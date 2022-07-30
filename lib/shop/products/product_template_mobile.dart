import 'package:flutter/material.dart';
import '../../repetitive_widgets/rating_star.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../product_details/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seo_renderer/seo_renderer.dart';

class PRODUCT_TEMPLATE_MOBILE extends StatelessWidget {
  String _id;
  String productName;
  List<dynamic> images;
  String group;
  String category;
  String subCategory;
  String brand;
  bool avilable;
  dynamic bestSeller;
  dynamic rating;
  List<dynamic> avilableColors;
  int quantity;
  bool changing;

  List<dynamic> productColors;
  PRODUCT_TEMPLATE_MOBILE(
      this._id,
      this.productName,
      this.images,
      this.group,
      this.category,
      this.subCategory,
      this.brand,
      this.productColors,
      this.avilable,
      this.bestSeller,
      this.avilableColors,
      this.rating,
      this.quantity,
      this.changing);

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final deviceSize = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              "/product/${_id}",
            );
            // storeFunc.getProductDetailsInfo(_id);
          },
          child: SizedBox(
            width: deviceSize > 500 ? 120 : 100,
            child: Card(
                elevation: 5,
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Container(
                            child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: deviceSize > 500
                                    ? TextRenderer(
                                        text: Text(
                                            productName.length > 50
                                                ? "${productName.substring(0, 50)}..."
                                                : "${productName.substring(0, productName.length)}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Shabnam",
                                                fontSize: 12,
                                                color: Colors.black)),
                                      )
                                    : TextRenderer(
                                        text: Text(
                                            productName.length > 33
                                                ? "${productName.substring(0, 33)}..."
                                                : "${productName.substring(0, productName.length)}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Shabnam",
                                                fontSize: 12,
                                                color: Colors.black)),
                                      )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              rating["numberOfRates"] > 1
                                  ? Row(
                                      children: [
                                        RATING_STAR(1, true, () {}, 1),
                                        Text(
                                            rating["rateNumber"]
                                                .toString()
                                                .toPersianDigit(),
                                            style: TextStyle(
                                                fontFamily: "Shabnam",
                                                fontSize: 12,
                                                color: Colors.black)),
                                      ],
                                    )
                                  : SizedBox(
                                      height: 1,
                                    ),
                              Row(
                                children: [
                                  Text("ارسال توسط پیتاژ ",
                                      style: TextStyle(
                                          fontFamily: "Shabnam",
                                          fontSize: 8,
                                          color: Colors.grey)),
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.cyan,
                                    size: 10,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        avilable
                            ? bestSeller["off"] > 0
                                ? Container(
                                    margin: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text("تومان",
                                                style: TextStyle(
                                                    fontFamily: "Khandevane",
                                                    fontSize: 10,
                                                    color: Colors.blue)),
                                            Text(
                                                "${bestSeller["priceByOff"]}"
                                                    .toPersianDigit()
                                                    .seRagham(),
                                                style: TextStyle(
                                                    fontFamily: "Shabnam",
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                            Text(
                                                "${bestSeller["price"]}"
                                                    .toPersianDigit()
                                                    .seRagham(),
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor:
                                                        Colors.grey,
                                                    fontFamily: "Shabnam",
                                                    fontSize: 14,
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Container(
                                                color: Colors.red,
                                                padding: EdgeInsets.all(3),
                                                child: Text(
                                                  "${bestSeller["off"]}%"
                                                      .toPersianDigit(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text("تومان",
                                                style: TextStyle(
                                                    fontFamily: "Khandevane",
                                                    fontSize: 10,
                                                    color: Colors.blue)),
                                            Text(
                                                "${bestSeller["priceByOff"]}"
                                                    .toPersianDigit()
                                                    .seRagham(),
                                                style: TextStyle(
                                                    fontFamily: "Shabnam",
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                            : SizedBox(
                                height: 1,
                              ),
                        avilable
                            ? quantity == 0
                                ? SizedBox(
                                    child: changing == true
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(130, 35),
                                                primary: Colors.red),
                                            onPressed: () {},
                                            child: SpinKitThreeBounce(
                                              color: Colors.white,
                                              size: 15,
                                            ))
                                        : ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(1),
                                                fixedSize: const Size(130, 35),
                                                primary: Colors.red),
                                            onPressed: () {
                                              storeFunc.addToCartFromGrid(
                                                  _id,
                                                  bestSeller["sellerId"],
                                                  bestSeller["selectedColor"]
                                                      ["color"],
                                                  group,
                                                  context);
                                            },
                                            child: Text(
                                              "افزودن به سبد خرید",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: "Shabnam"),
                                            )),
                                  )
                                : changing == true
                                    ? Container(
                                        width: 130,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 40,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          shadowColor:
                                                              Colors.white,
                                                          primary:
                                                              Colors.white),
                                                  onPressed: () {},
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 20,
                                                    color: Colors.red,
                                                  )),
                                            ),
                                            Container(
                                                width: 20,
                                                height: 15,
                                                margin: EdgeInsets.all(10),
                                                child: SpinKitThreeBounce(
                                                  color: Colors.grey,
                                                  size: 10,
                                                )),
                                            Container(
                                              width: 40,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          shadowColor:
                                                              Colors.white,
                                                          primary:
                                                              Colors.white),
                                                  onPressed: () {},
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 20,
                                                    color: Colors.green,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: 130,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 40,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          shadowColor:
                                                              Colors.white,
                                                          primary:
                                                              Colors.white),
                                                  onPressed: () {
                                                    storeFunc
                                                        .removeFromCardInGrid(
                                                            _id,
                                                            group,
                                                            context);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 20,
                                                    color: Colors.red,
                                                  )),
                                            ),
                                            Container(
                                              width: 20,
                                              height: 15,
                                              margin: EdgeInsets.all(10),
                                              child: Text(
                                                quantity
                                                    .toString()
                                                    .toPersianDigit(),
                                                textAlign: TextAlign.center,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                    fontSize:
                                                        quantity > 999 ? 9 : 12,
                                                    fontFamily: "Shabnam",
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          shadowColor:
                                                              Colors.white,
                                                          primary:
                                                              Colors.white),
                                                  onPressed: () {
                                                    storeFunc.addToCartFromGrid(
                                                        _id,
                                                        bestSeller["sellerId"],
                                                        bestSeller[
                                                                "selectedColor"]
                                                            ["color"],
                                                        group,
                                                        context);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 20,
                                                    color: Colors.green,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )
                            : SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ناموجود",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          fontFamily: "Shabnam"),
                                    ),
                                  ],
                                )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            images[0],
                            fit: BoxFit.fitHeight,
                            width: 110,
                            height: 110,
                          ),
                        ),
                        productColors.length == 0
                            ? SizedBox(
                                height: 10,
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width / 3.4,
                                height: 30,
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    primary: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: avilableColors.length,
                                    reverse: true,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          margin: EdgeInsets.all(2),
                                          alignment: Alignment.center,
                                          child: avilableColors[index]
                                                          ["color"] !=
                                                      4294966010 &&
                                                  avilableColors.length > 0
                                              ? SizedBox(
                                                  width: 10,
                                                  height: 10,
                                                  child: Container(
                                                    child: ClipOval(
                                                      child: Container(
                                                        color: Color(
                                                            avilableColors[
                                                                    index]
                                                                ["color"]),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: 1,
                                                ));
                                    }),
                              ),
                      ],
                    ),
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
