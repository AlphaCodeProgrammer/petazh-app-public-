import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'product_card_template.dart';
import 'package:flutter/gestures.dart';
import '../products/products_screen.dart';

class AGENT_PRODUCTS_TEMPLATE extends StatelessWidget {
  final productsArray;
  void productGroupRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/products");
  }

  @override
  AGENT_PRODUCTS_TEMPLATE(this.productsArray);
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 242, 239),
          borderRadius: new BorderRadius.only(
            topRight: const Radius.circular(40.0),
            bottomRight: const Radius.circular(20.0),
          )),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        height: 500,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 243, 242, 239),
                      shadowColor: Color.fromARGB(255, 243, 242, 239),
                    ),
                    onPressed: () {
                      productGroupRoute(context);
                      storeFunc.getProducts(
                          productsArray[0]["group"], true, true, "", "", "");
                    },
                    child: Text("مشاهده ی همه",
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "Shabnam",
                            fontSize: 10)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Align(
                    child: Text(" ${productsArray[0]["group"].toString()} ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Shabnam",
                            fontSize: 12)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.05,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      primary: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: productsArray.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return PRODUCT_CARD_TEMPLATE(
                          productsArray[index]["_id"],
                          productsArray[index]["name"],
                          productsArray[index]["images"],
                          productsArray[index]["group"],
                          productsArray[index]["category"],
                          productsArray[index]["subCategory"],
                          productsArray[index]["brand"],
                          productsArray[index]["avilableColors"],
                          productsArray[index]["avilable"],
                          productsArray[index]["bestSeller"],
                          productsArray[index]["avilableColors"],
                          productsArray[index]["ratingP"],
                          productsArray[index]["quantity"],
                          productsArray[index]["changing"],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
