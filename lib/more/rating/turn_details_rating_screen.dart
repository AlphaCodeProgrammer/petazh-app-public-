import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'selected_service_rating.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../fix/single_back.dart';
import 'turn_info_rating.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../repetitive_widgets/rating_star.dart';

class TURN_DETAILS_RATING_SCREEN extends StatelessWidget {
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final turnServices = Provider.of<Barbers>(context).turnServices;

    return Scaffold(
        appBar: AppBar(
            elevation: 0.5,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            title: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SINGLE_BACK(Colors.grey, Colors.white, 50, 50),
                    Text(
                      "امیتاز دهی",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: "Shabnam"),
                    ),
                  ],
                ),
              ),
            )),
        body: storeFunc.lp1 == false
            ? storeFunc.lp1 == false && turnServices.length > 0
                ? Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            TURN_INFO_RATING(),
                            Center(
                              child: SizedBox(
                                height: 300,
                                child: ScrollConfiguration(
                                  behavior:
                                      ScrollConfiguration.of(context).copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.touch,
                                      PointerDeviceKind.mouse,
                                    },
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ListView.builder(
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: turnServices.length,
                                        itemBuilder: (context, index) {
                                          return SELECTED_SERVICE_RATING(
                                            turnServices[index]["name"],
                                            turnServices[index]["price"],
                                            turnServices[index]["floating"],
                                            turnServices[index]["offPrice"],
                                            turnServices[index]["id"],
                                            turnServices[index]["men"],
                                            turnServices[index]["ready"],
                                            turnServices[index]["off"],
                                            turnServices[index]["material"],
                                            turnServices[index]["quantity"],
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              child: ListView(children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width > 300
                                            ? 250
                                            : MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Column(
                                        children: [
                                          Text(
                                            "محیط آرایشگاه".toPersianDigit(),
                                            maxLines: 10,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                fontFamily: "Shabnam"),
                                          ),
                                          RATING_STAR(5, false, (star) {
                                            storeFunc.changeRatingBarberStar(
                                                star, 0);
                                          }, 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width > 300
                                            ? 250
                                            : MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Column(
                                        children: [
                                          Text(
                                            "دسترسی".toPersianDigit(),
                                            maxLines: 10,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                fontFamily: "Shabnam"),
                                          ),
                                          RATING_STAR(5, false, (star) {
                                            storeFunc.changeRatingBarberStar(
                                                star, 1);
                                          }, 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width > 300
                                            ? 250
                                            : MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Column(
                                        children: [
                                          Text(
                                            "برخورد آرایشگر".toPersianDigit(),
                                            maxLines: 10,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                fontFamily: "Shabnam"),
                                          ),
                                          RATING_STAR(5, false, (star) {
                                            storeFunc.changeRatingBarberStar(
                                                star, 2);
                                          }, 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width > 300
                                            ? 250
                                            : MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Column(
                                        children: [
                                          Text(
                                            "تطابق درخواست".toPersianDigit(),
                                            maxLines: 10,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                fontFamily: "Shabnam"),
                                          ),
                                          RATING_STAR(5, false, (star) {
                                            storeFunc.changeRatingBarberStar(
                                                star, 3);
                                          }, 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width > 300
                                            ? 250
                                            : MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Column(
                                        children: [
                                          Text(
                                            "رضایت مندی".toPersianDigit(),
                                            maxLines: 10,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                fontFamily: "Shabnam"),
                                          ),
                                          RATING_STAR(5, false, (star) {
                                            storeFunc.changeRatingBarberStar(
                                                star, 4);
                                          }, 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: storeFunc.buttonLoader == false
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        fixedSize: const Size(100, 35),
                                        padding: EdgeInsets.all(10)),
                                    onPressed: () {
                                      storeFunc.postRatingTurn(context);
                                    },
                                    child: Text(
                                      "ثبت امتیاز",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "Shabnam"),
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      padding: EdgeInsets.all(10),
                                      fixedSize: const Size(100, 38),
                                    ),
                                    onPressed: () {},
                                    child: SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 15,
                                    ))),
                      )
                    ],
                  )
                : Center(
                    child: Text(
                    "نوبتی برای امیتیاز دهی موجود نمیباشید",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.grey),
                  ))
            : Center(
                child: SpinKitThreeBounce(
                  size: 12,
                  color: Colors.grey,
                ),
              ));
  }
}
