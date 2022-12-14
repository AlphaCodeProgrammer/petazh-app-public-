import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../shop/product_details/product_details_screen.dart';
import '../../providers/store.dart';

class PRODUCT_BASKET_TEMPLATE extends StatelessWidget {
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

  PRODUCT_BASKET_TEMPLATE(
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
    final mediaQuery = MediaQuery.of(context).size;
    final storeFunc = Provider.of<Barbers>(context);
    return InkWell(
      onTap: () {
        // print("hello");

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
            child: Column(
              children: [
                Container(
                  width: mediaQuery.width > 400 ? 300 : 100,
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
                    Text(
                      productName.length > 31
                          ? "${productName.substring(0, 30)}..."
                          : "${productName}",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      maxLines: 1,
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
                        Text("  ?????????????? ??????????  ",
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
                        Text("  ?????????????? ?????????? ????????????  ",
                            style: TextStyle(
                                fontFamily: "Shabnam",
                                fontSize: 10,
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
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
                                  storeFunc.addToCartFromGrid(productId,
                                      sellerId, color, group, context);
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.green,
                                )),
                          ),
                          Container(
                            width: 20,
                            margin: EdgeInsets.all(10),
                            child: Text(
                              quantity.toString().toPersianDigit(),
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
                                  storeFunc.removeFromCardInGridInBasket(
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
                        Text(" ?????????? ",
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
    );
  }
}
