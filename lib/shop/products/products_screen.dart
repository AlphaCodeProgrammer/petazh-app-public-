import "package:flutter/material.dart";
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../shop_home/product_card_template.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../shop_filter/filter_product_appbar.dart';
import 'sort.dart';
import 'product_template_mobile.dart';

class PRODUCTS_SCREEN extends StatefulWidget {
  @override
  State<PRODUCTS_SCREEN> createState() => _PRODUCTS_SCREENState();
}

class _PRODUCTS_SCREENState extends State<PRODUCTS_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var productsCount = Provider.of<Barbers>(context).products;
      if (productsCount.length < 1) {
        Provider.of<Barbers>(context, listen: false)
            .getProducts("", false, true, "", "", "");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final products = storeFunc.products;
    return Scaffold(
        appBar: AppBar(
            elevation: 0.5,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            // title: FILTER_PRODUCT_APPBAR(),
            // ),
            title: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    // height: backHeight,
                    // width: backWidth,
                    child: Container(
                        child: FloatingActionButton(
                      splashColor: Colors.transparent,
                      elevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      backgroundColor: Colors.white,
                      hoverColor: Colors.transparent,
                      hoverElevation: 0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                    )),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: FILTER_PRODUCT_APPBAR(),
                ),
              ],
            )),
        body: storeFunc.pageLoader == false
            ? Container(
                child: ListView(shrinkWrap: true, children: [
                Center(child: SORT()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: products.length == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          2,
                                      bottom: 20),
                                  child: Text(
                                    "نتیجه ای یافت نشد".toPersianDigit(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ),
                              ],
                            )
                          : MediaQuery.of(context).size.width > 500
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 450,
                                          mainAxisExtent: 460,
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 0),
                                  itemCount: products.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return PRODUCT_CARD_TEMPLATE(
                                      products[index]["_id"],
                                      products[index]["name"],
                                      products[index]["images"],
                                      products[index]["group"],
                                      products[index]["category"],
                                      products[index]["subCategory"],
                                      products[index]["brand"],
                                      products[index]["avilableColors"],
                                      products[index]["avilable"],
                                      products[index]["bestSeller"],
                                      products[index]["avilableColors"],
                                      products[index]["ratingP"],
                                      products[index]["quantity"],
                                      products[index]["changing"],
                                    );
                                  },
                                )
                              : ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    return PRODUCT_TEMPLATE_MOBILE(
                                      products[index]["_id"],
                                      products[index]["name"],
                                      products[index]["images"],
                                      products[index]["group"],
                                      products[index]["category"],
                                      products[index]["subCategory"],
                                      products[index]["brand"],
                                      products[index]["avilableColors"],
                                      products[index]["avilable"],
                                      products[index]["bestSeller"],
                                      products[index]["avilableColors"],
                                      products[index]["ratingP"],
                                      products[index]["quantity"],
                                      products[index]["changing"],
                                    );
                                  }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        storeFunc.pagination.length > 3
                            ? InkWell(
                                onTap: () {
                                  storeFunc.getProductSpeceficPage(
                                      storeFunc.pagination.length);
                                },
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.red,
                                        child: Center(
                                          child: Text(
                                            storeFunc.pagination.length
                                                .toString()
                                                .toPersianDigit(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 1,
                              ),
                        storeFunc.pagination.length > 3
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(
                                    ".......",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 1,
                              ),
                        storeFunc.pagination.length > 2
                            ? InkWell(
                                onTap: () {
                                  storeFunc.getProductSpeceficPage(
                                      storeFunc.pagination[2]);
                                },
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.red,
                                        child: Center(
                                          child: Text(
                                            storeFunc.pagination[2]
                                                .toString()
                                                .toPersianDigit(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 1,
                              ),
                        storeFunc.pagination.length > 1
                            ? InkWell(
                                onTap: () {
                                  storeFunc.getProductSpeceficPage(
                                      storeFunc.pagination[1]);
                                },
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.red,
                                        child: Center(
                                          child: Text(
                                            storeFunc.pagination[1]
                                                .toString()
                                                .toPersianDigit(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 1,
                              ),
                        storeFunc.pagination.length > 0
                            ? InkWell(
                                onTap: () {
                                  storeFunc.getProductSpeceficPage(
                                      storeFunc.pagination[0]);
                                },
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.red,
                                        child: Center(
                                          child: Text(
                                            storeFunc.pagination[0]
                                                .toString()
                                                .toPersianDigit(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 1,
                              ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "${storeFunc.page} صفحه  ".toPersianDigit(),
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ]))
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
