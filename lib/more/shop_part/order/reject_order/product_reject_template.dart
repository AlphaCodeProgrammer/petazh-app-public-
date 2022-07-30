import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../../providers/store.dart';

class PRODUCT_REJECT_TEMPLATE extends StatelessWidget {
  String productId;
  String productName;
  int rejectQuantity;
  String productImage;
  String shopNameSeller;
  String sellerId;
  int productColor;
  String colorName;
  int quantity;
  dynamic value;
  String group;

  PRODUCT_REJECT_TEMPLATE(
      this.productId,
      this.productName,
      this.rejectQuantity,
      this.productImage,
      this.shopNameSeller,
      this.sellerId,
      this.productColor,
      this.colorName,
      this.quantity,
      this.value,
      this.group);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final storeFunc = Provider.of<Barbers>(context);
    return InkWell(
      onLongPress: () {
        storeFunc.removeProductsToRejectionProducts(
            productId, productColor, sellerId);
      },
      onTap: () {
        storeFunc.addProductsToRejectionProducts(
            productId, productColor, sellerId);
      },
      child: Container(
        width: 250,
        child: Card(
          elevation: 5,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: mediaQuery.width > 400 ? 300 : 200,
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
                      Container(
                        width: 230,
                        child: Text(
                          "${productName}",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: rejectQuantity > 0
                                  ? Colors.red
                                  : Colors.black,
                              fontSize: 12),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                            height: 15,
                            child: Container(
                              child: ClipOval(
                                child: Container(
                                  color: Color(productColor),
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
                      Text("تعداد کل : ${quantity}".toPersianDigit(),
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 10,
                              color: Colors.black)),
                      Text("تعداد مرجوعی : ${rejectQuantity}".toPersianDigit(),
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 10,
                              color: rejectQuantity > 0
                                  ? Colors.red
                                  : Colors.black)),
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
        ),
      ),
    );
  }
}
