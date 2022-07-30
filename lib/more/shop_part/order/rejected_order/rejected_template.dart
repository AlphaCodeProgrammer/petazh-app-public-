import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../../providers/store.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../order_products_screen.dart';
import './rejected_products_screen.dart';

class REJECTED_TEMPLATE extends StatelessWidget {
  Function speceficFunction;
  String specialId;
  String id;
  List<dynamic> productsImage;
  int payment;
  bool acceptedByPetazh;
  bool checkedByPetazh;
  int productCount;

  REJECTED_TEMPLATE(
    this.speceficFunction,
    this.specialId,
    this.id,
    this.productsImage,
    this.payment,
    this.acceptedByPetazh,
    this.checkedByPetazh,
    this.productCount,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final storeFunc = Provider.of<Barbers>(context);
    return InkWell(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('', (Route<dynamic> route) => false);
        Navigator.of(context).pushNamed(
          "/rejected-products",
        );
        speceficFunction();
      },
      child: Card(
        elevation: 5,
        child: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: MediaQuery.of(context).size.width < 800
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              specialId.toString().toPersianDigit(),
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontFamily: "Shabnam"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "کالا",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  productCount.toString().toPersianDigit(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                              ],
                            ),

                            //  deleteOrderByUser = true?
                            checkedByPetazh == true
                                ? acceptedByPetazh == true
                                    ? Row(
                                        children: [
                                          Text(
                                            "پذیرش مرجوعی".toPersianDigit(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 12, 145, 0),
                                                fontFamily: "Shabnam"),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          SpinKitThreeBounce(
                                            color: Color.fromARGB(
                                                255, 4, 121, 255),
                                            size: 10,
                                          ),
                                          Text(
                                            "در حال برسی".toPersianDigit(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 4, 121, 255),
                                                fontFamily: "Shabnam"),
                                          ),
                                        ],
                                      )
                                : Row(
                                    children: [
                                      SpinKitThreeBounce(
                                        color: Colors.red,
                                        size: 10,
                                      ),
                                      Text(
                                        "در صف برسی".toPersianDigit(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.red,
                                            fontFamily: "Shabnam"),
                                      ),
                                    ],
                                  )
                          ],
                        )),
                        Container(
                          width: mediaQuery.width > 600
                              ? mediaQuery.width / 2
                              : mediaQuery.width / 3,
                          height: 100,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.mouse,
                                },
                              ),
                              child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productsImage.length,
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: Image.network(
                                        productsImage[index],
                                        fit: BoxFit.fitHeight,
                                        width: 80,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: mediaQuery.width > 600
                              ? mediaQuery.width / 3
                              : mediaQuery.width / 3,
                          height: 100,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.mouse,
                                },
                              ),
                              child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productsImage.length,
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: Image.network(
                                        productsImage[index],
                                        fit: BoxFit.fitHeight,
                                        width: 80,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            checkedByPetazh == true
                                ? acceptedByPetazh == true
                                    ? Row(
                                        children: [
                                          Text(
                                            "پذیرش مرجوعی".toPersianDigit(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 12, 145, 0),
                                                fontFamily: "Shabnam"),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          SpinKitThreeBounce(
                                            color: Color.fromARGB(
                                                255, 4, 121, 255),
                                            size: 10,
                                          ),
                                          Text(
                                            "در حال برسی".toPersianDigit(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 4, 121, 255),
                                                fontFamily: "Shabnam"),
                                          ),
                                        ],
                                      )
                                : Row(
                                    children: [
                                      SpinKitThreeBounce(
                                        color: Colors.red,
                                        size: 10,
                                      ),
                                      Text(
                                        "در صف برسی".toPersianDigit(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.red,
                                            fontFamily: "Shabnam"),
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "کالا",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  productCount.toString().toPersianDigit(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: "Shabnam"),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              specialId.toString().toPersianDigit(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  fontFamily: "Shabnam"),
                            ),
                          ],
                        )),
                      ],
                    )),
        ),
      ),
    );
  }
}
