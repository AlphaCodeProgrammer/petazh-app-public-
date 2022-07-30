import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../products/products_screen.dart';
import 'property_name_template.dart';
import 'list_search.dart';
import './range_price.dart';

class SHOP_FILTER_SCREEN extends StatelessWidget {
  final searchBox = TextEditingController();
  void productGroupRoute(BuildContext ctx) {
    Navigator.of(ctx).pop();

    Navigator.of(ctx).pushNamed("/products");
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final propertiesList = storeFunc.propertiesList;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("فیلتر و جستو جو در محصولات"),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              // Container(
              //   child: SizedBox(
              //     width: mediaQueryWidth > 200 ? 100 : mediaQueryWidth / 1.5,
              //     height: mediaQueryWidth > 200 ? 200 : 100,
              //     child: Center(
              //         child: Image.asset('assets/images/petazh-logo.png')),
              //   ),
              // ),
              Center(
                child: Text("پیتاژ",
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: "Khandevane",
                        fontSize: 25)),
              ),
              Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                    text: "برای ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Shabnam",
                        fontSize: 10)),
                TextSpan(
                    text: " فیلتر کردن ",
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Shabnam",
                        fontSize: 10)),
                TextSpan(
                    text:
                        "محصولات میتوانید نام محصول و ...در کادر زیر وارد نمایید ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Shabnam",
                        fontSize: 10)),
              ]))),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width > 510
                      ? 400
                      : MediaQuery.of(context).size.width / 1.2,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: searchBox,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.grey,
                      onSubmitted: (_) {
                        storeFunc.searchBoxFilter(searchBox.text);
                      },
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: "Shabnam"),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "نام محصول  و ...".toPersianDigit(),
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              storeFunc.searchProducts.length > 0
                  ? LIST_SEARCH()
                  : storeFunc.serarchBoxLoader == false
                      ? SizedBox(
                          height: 1,
                        )
                      : Container(
                          height: 25,
                          child: Center(
                              child: SpinKitThreeBounce(
                            color: Colors.grey,
                            size: 20,
                          )),
                        ),
              storeFunc.selectedcategory.length > 0 ||
                      storeFunc.selectedSubCategory.length > 0 ||
                      storeFunc.selectedBrand.length > 0
                  ? Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(5)),
                          onPressed: () {
                            storeFunc.removeFilters();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.highlight_remove,
                                color: Color.fromARGB(255, 255, 121, 112),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Text(
                                "حذف فیلتر ها",
                                style: TextStyle(
                                    fontFamily: "Shabnam",
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 255, 121, 112)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 1,
                    ),

              RANGE_PRICE(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "فقط کالاهای موجود",
                      style: TextStyle(
                          fontFamily: "Shabnam",
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                        value: storeFunc.onlyExistProducts,
                        onChanged: (_) {
                          storeFunc.changeExistanceFilter();
                        }),
                  ),
                ],
              ),
              PROPERTY_NAME_TEMPLATE(storeFunc.group[0]["name"],
                  storeFunc.group[0]["selectedProperty"], () {
                storeFunc.groupFunction();
              }),

              storeFunc.selectedGroup.length > 0
                  ? PROPERTY_NAME_TEMPLATE(storeFunc.brandsGroup[0]["name"],
                      storeFunc.brandsGroup[0]["selectedProperty"], () {
                      storeFunc.brandFunction();
                    })
                  : SizedBox(
                      height: 1,
                    ),

              storeFunc.selectedGroup.length > 0
                  ? PROPERTY_NAME_TEMPLATE(storeFunc.category[0]["name"],
                      storeFunc.category[0]["selectedProperty"], () {
                      storeFunc.categoryFunction();
                    })
                  : SizedBox(
                      height: 1,
                    ),
              storeFunc.selectedcategory.length > 0
                  ? PROPERTY_NAME_TEMPLATE(storeFunc.subCategory[0]["name"],
                      storeFunc.subCategory[0]["selectedProperty"], () {
                      storeFunc.subcategoryFunction();
                    })
                  : SizedBox(
                      height: 1,
                    ),
              storeFunc.selectedSubCategory.length > 0
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: propertiesList.length,
                      itemBuilder: (context, index) {
                        return PROPERTY_NAME_TEMPLATE(
                            propertiesList[index]["name"],
                            propertiesList[index]["selectedProperty"], () {
                          storeFunc
                              .propertiesFunc(propertiesList[index]["name"]);
                        });
                      })
                  : SizedBox(
                      height: 1,
                    ),
              Center(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: !storeFunc.buttonLoader
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              primary: Colors.blue,
                            ),
                            onPressed: () {
                              productGroupRoute(context);
                              storeFunc.getProducts(
                                  "لوازم آرایشی", false, true, "", "", "");
                            },
                            child: Text(
                              "جست و جو کردن",
                              style: TextStyle(
                                  fontFamily: "Shabnam", fontSize: 14),
                            ),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            onPressed: () {},
                            child: SpinKitThreeBounce(
                              color: Colors.grey,
                              size: 20,
                            ))),
              )
            ],
          ),
        ));
  }
}
