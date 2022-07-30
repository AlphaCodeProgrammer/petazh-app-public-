import 'package:flutter/material.dart';
import '../../repetitive_widgets/rating_star.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class PRODUCT_SMALL_CARD_TEMPLATE extends StatelessWidget {
  final productName = "کرم موی سر مناسب برای کودکان و بزرگسالان";
  final productColors = [];

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 300,
            child: Card(
                borderOnForeground: false,
                elevation: 4,
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Image.network(
                        "https://images.unsplash.com/photo-1511499767150-a48a237f0083?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                        fit: BoxFit.cover,
                        width: 200),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...(productColors as List<int>).map((color) {
                        return Container(
                          margin: EdgeInsets.all(2),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 15,
                            height: 15,
                            child: ClipOval(
                              child: Container(
                                color: Color(color),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Container(
                      child: Text(
                          "...${productName.substring(0, productName.length)} ",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Colors.black)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("تومان",
                                style: TextStyle(
                                    fontFamily: "Khandevane",
                                    fontSize: 10,
                                    color: Colors.blue)),
                            Text("158000".toPersianDigit().seRagham(),
                                style: TextStyle(
                                    fontFamily: "Shabnam",
                                    fontSize: 14,
                                    color: Colors.black)),
                            Text("195000".toPersianDigit().seRagham(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey,
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
                                  "5%".toPersianDigit(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                            Icon(Icons.money_off_csred, color: Colors.grey),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.shopping_cart),
                            Text(
                              "افزودن به سبد خرید",
                              style: TextStyle(
                                  fontSize: 10, fontFamily: "Shabnam"),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    child: Container(
                        width: 110,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white),
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: Colors.red,
                                  )),
                            ),
                            Text(
                              "1".toPersianDigit(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Shabnam",
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white),
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.green,
                                  )),
                            ),
                          ],
                        )),
                  )
                ])),
          ),
        ),
      ),
    );
  }
}
