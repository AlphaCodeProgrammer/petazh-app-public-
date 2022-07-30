import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import 'package:flutter/gestures.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../select_day_template.dart';
import './payment_screen.dart';
import '../selected_address_template.dart';
import '../../profile/address/addresses_screen.dart';

class SELECT_TIME extends StatefulWidget {
  @override
  State<SELECT_TIME> createState() => _SELECT_TIMEState();
}

class _SELECT_TIMEState extends State<SELECT_TIME> {
  var _isInit = true;
  void toPaymentRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/shop-payment",
    );
  }

  void toEditeAddress(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/adresses",
    );
  }

  void didChangeDependencies() {
    if (_isInit) {
      // Provider.of<Barbers>(context).getAvilableDaysForSendProduct(context);
      // Provider.of<Barbers>(context).getAvilableAddressesForSendProduct();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final avilableDaysForSendProduct = storeFunc.avilableDaysForSendProduct;
    final avilableAddressForSendProduct =
        storeFunc.avilableAddressForSendProduct;
    final finalPayment = storeFunc.totalPriceByOff + storeFunc.postPrice;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("انتخاب زمان ارسال محصولات"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  " زمان ارسال را انتخاب کنید  ".toPersianDigit(),
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "Shabnam"),
                ),
                SizedBox(
                  height: 4,
                ),
                ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                        child: SizedBox(
                          height: 200,
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: avilableDaysForSendProduct.length,
                              itemBuilder: (context, index) {
                                return SELECT_DAY_TEMPLATE(
                                  avilableDaysForSendProduct[index]
                                      ["weekDayName"],
                                  avilableDaysForSendProduct[index]["fullDate"],
                                  avilableDaysForSendProduct[index]["selected"],
                                );
                              }),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "محصولات به آدرس انتخابی شما ارسال خواهند شد"
                      .toPersianDigit(),
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "Shabnam"),
                ),
                SizedBox(
                  height: 4,
                ),
                ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                        child: SizedBox(
                          height: 200,
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: avilableAddressForSendProduct.length,
                              itemBuilder: (context, index) {
                                return SELECTED_ADDRESS_TEMPLATE(
                                  avilableAddressForSendProduct[index]["_id"],
                                  avilableAddressForSendProduct[index]["city"],
                                  avilableAddressForSendProduct[index]
                                      ["postalCode"],
                                  avilableAddressForSendProduct[index]
                                      ["address"],
                                  avilableAddressForSendProduct[index]
                                      ["reciverName"],
                                  avilableAddressForSendProduct[index]
                                      ["reciverPhone"],
                                  avilableAddressForSendProduct[index]
                                      ["selected"],
                                );
                              }),
                        ),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, padding: EdgeInsets.all(5)),
                      onPressed: () {
                        toEditeAddress(context);
                      },
                      child: Text(
                        "افزدون | ویرایش آدرس",
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    )),
                storeFunc.totalPriceByOff > 0
                    ? Card(
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: storeFunc.totalPriceByOff < 500000
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                                Container(
                                                  child: Text(
                                                    " تومان ".toPersianDigit(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            "Khandevane"),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    storeFunc.postPrice
                                                        .toString()
                                                        .toPersianDigit()
                                                        .seRagham(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontFamily: "Shabnam"),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    " : هزینه ارسال",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontFamily: "Shabnam"),
                                                  ),
                                                ),
                                              ])
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                                Container(
                                                  child: Text(
                                                    "رایگان".toPersianDigit(),
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 14,
                                                        fontFamily: "Shabnam"),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    " : هزینه ارسال",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontFamily: "Shabnam"),
                                                  ),
                                                ),
                                              ]),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "  تومان   ",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10,
                                            fontFamily: "Khandevane"),
                                      ),
                                      Text(
                                        "${finalPayment}"
                                            .toPersianDigit()
                                            .seRagham(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      Text(
                                        " : مجموع مبلغ پرداختی ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: "Shabnam"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            storeFunc.selectedSendDateForProducts.length > 1 &&
                                    storeFunc.selectedAddressForSendProduct[
                                            "city"] !=
                                        null
                                ? Container(
                                    width: 100,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          padding: EdgeInsets.all(5)),
                                      onPressed: () {
                                        toPaymentRoute(context);
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              " پرداخت",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: "Shabnam"),
                                            ),
                                          ),
                                          Icon(
                                            Icons.payment,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ))
                                : SizedBox(
                                    width: 1,
                                  ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 1,
                      ),
              ],
            ),
          ],
        )));
  }
}
