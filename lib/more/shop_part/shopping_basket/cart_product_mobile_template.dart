import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../shop/product_details/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CART_PRODUCT_MOBILE_TEMPLATE extends StatelessWidget {
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
  bool changing;

  CART_PRODUCT_MOBILE_TEMPLATE(
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
      this.changing);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final storeFunc = Provider.of<Barbers>(context);
    return InkWell(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
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
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                          ),
                          child: changing == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              shadowColor: Colors.white,
                                              primary: Colors.white),
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.green,
                                          )),
                                    ),
                                    Container(
                                        width: 20,
                                        height: 20,
                                        margin: EdgeInsets.all(10),
                                        child: SpinKitThreeBounce(
                                          size: 10,
                                          color: Colors.grey,
                                        )),
                                    Container(
                                      width: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              shadowColor: Colors.white,
                                              primary: Colors.white),
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                            color: Colors.red,
                                          )),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              shadowColor: Colors.white,
                                              primary: Colors.white),
                                          onPressed: () {
                                            storeFunc.addToCartFromGridInBasket(
                                                productId,
                                                sellerId,
                                                color,
                                                group,
                                                context);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.green,
                                          )),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        quantity.toString().toPersianDigit(),
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Shabnam",
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              shadowColor: Colors.white,
                                              primary: Colors.white),
                                          onPressed: () {
                                            storeFunc
                                                .removeFromCardInGridInBasket(
                                                    productId,
                                                    sellerId,
                                                    color,
                                                    group,
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
