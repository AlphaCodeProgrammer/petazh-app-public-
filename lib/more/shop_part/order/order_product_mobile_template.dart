import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ORDER_PRODUCTS_MOBILE_TEMPLATE extends StatelessWidget {
  String productId;
  String productName;
  String productImage;
  String shopNameSeller;
  String sellerId;
  int color;
  String colorName;
  int quantity;
  dynamic value;
  String group;

  ORDER_PRODUCTS_MOBILE_TEMPLATE(
      this.productId,
      this.productName,
      this.productImage,
      this.shopNameSeller,
      this.sellerId,
      this.color,
      this.colorName,
      this.quantity,
      this.value,
      this.group);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 200,
                child: AspectRatio(
                  aspectRatio: 6 / 4,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(productImage),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      "${productName}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Shabnam"),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: Container(
                          child: ClipOval(
                            child: Container(
                              color: Color(color),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        colorName,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.store_mall_directory_outlined,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(shopNameSeller,
                            style: TextStyle(
                                fontFamily: "Shabnam",
                                fontSize: 10,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_task_outlined,
                        color: Colors.grey,
                      ),
                      Text("  گارانتی اصالت  ",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 10,
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.health_and_safety_outlined,
                        color: Colors.grey,
                      ),
                      Text("  گارانتی سلامت فیزیکی  ",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 10,
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  value["off"] > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                value["price"]
                                    .toString()
                                    .toPersianDigit()
                                    .seRagham(),
                                style: TextStyle(
                                    fontFamily: "Shabnam",
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey,
                                    color: Colors.grey)),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: ClipOval(
                                child: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    ' % ${value["off"]}'
                                        .toString()
                                        .toPersianDigit(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          value["priceByOff"]
                              .toString()
                              .toPersianDigit()
                              .seRagham(),
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 16,
                              color: Colors.black)),
                      Text(" تومان ",
                          style: TextStyle(
                              fontFamily: "Khandevane",
                              fontSize: 10,
                              color: Colors.blue)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
