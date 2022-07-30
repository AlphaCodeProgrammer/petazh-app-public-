import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../shop/product_details/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../../../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class REJECTED_PRODUCTS_TEMPLATE extends StatelessWidget {
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

  REJECTED_PRODUCTS_TEMPLATE(
    this.productId,
    this.productName,
    this.productImage,
    this.shopNameSeller,
    this.sellerId,
    this.color,
    this.colorName,
    this.quantity,
    this.value,
    this.group,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final storeFunc = Provider.of<Barbers>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('', (Route<dynamic> route) => false);
        Navigator.of(context).pushNamed(
          "/product/${productId}",
        );
        // storeFunc.getProductDetailsInfo(productId, context);
      },
      child: Card(
        elevation: 5,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image.network(
                          productImage,
                          fit: BoxFit.fitHeight,
                          width: 140,
                          height: 140,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                        child: Container(
                          child: ClipOval(
                            child: Container(
                              color: Color(color),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        colorName,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productName}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        maxLines: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.store_mall_directory_outlined,
                            color: Colors.grey,
                            size: 15,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add_task_outlined,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text("  گارانتی اصالت  ",
                              style: TextStyle(
                                  fontFamily: "Shabnam",
                                  fontSize: 10,
                                  color: Colors.black)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.health_and_safety_outlined,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text("  گارانتی سلامت فیزیکی  ",
                              style: TextStyle(
                                  fontFamily: "Shabnam",
                                  fontSize: 10,
                                  color: Colors.black)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("تعداد کالای مرجوعی : ",
                              style: TextStyle(
                                  fontFamily: "Shabnam",
                                  fontSize: 10,
                                  color: Colors.black)),
                          Text(quantity.toString().toPersianDigit(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
