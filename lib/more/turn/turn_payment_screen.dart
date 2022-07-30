import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TURN_PAYMENT_SCREEN extends StatefulWidget {
  @override
  State<TURN_PAYMENT_SCREEN> createState() => _TURN_PAYMENT_SCREENState();
}

class _TURN_PAYMENT_SCREENState extends State<TURN_PAYMENT_SCREEN> {
  // var _isInit = true;
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     Provider.of<Barbers>(context).getAvilableDaysForSendProduct();
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    final finalPayment = storeFunc.turnDetails[0]["floatingPrice"] +
        storeFunc.turnDetails[0]["totalServicesPrice"];

    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("پرداخت "),
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Center(
                  child: Container(
                    child: Center(
                        child: Image.asset('assets/images/petazh-logo.png')),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width > 300
                        ? 250
                        : MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "توجه داشته باشید پس از پرداخت به علت پیچیدگی فرایند باز پرداخت امکان پذیر نمیباشد"
                            .toPersianDigit(),
                        maxLines: 10,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontFamily: "Shabnam"),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "  تومان",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: "Khandevane"),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Center(
                      child: Text(
                        storeFunc.user[0]["wallet"]
                            .toString()
                            .toPersianDigit()
                            .seRagham(),
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontFamily: "Shabnam"),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Center(
                      child: Text(
                        " : موجودی کیف پول ".toPersianDigit(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: "Shabnam"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    "نوع پرداخت را انتخاب کنید".toPersianDigit(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Shabnam"),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "  تومان",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: "Khandevane"),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Center(
                      child: Text(
                        finalPayment.toString().toPersianDigit().seRagham(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Shabnam"),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Center(
                      child: Text(
                        " : مبلغ قابل پرداخت ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: "Shabnam"),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 200,
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue, padding: EdgeInsets.all(5)),
                          onPressed: () {
                            // toPaymentRoute(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  "پرداخت از درگاه بانکی",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: "Shabnam"),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.payment,
                                color: Colors.white,
                                size: 25,
                              ),
                            ],
                          ),
                        )),
                    Container(
                        width: 200,
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: storeFunc.paymentButton == false
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    fixedSize: const Size(120, 38),
                                    padding: EdgeInsets.all(5)),
                                onPressed: () {
                                  storeFunc.paymentTurnByWallet(true, context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        "پرداخت از کیف پول",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: "Shabnam"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.account_balance_wallet_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    fixedSize: const Size(120, 38),
                                    padding: EdgeInsets.all(5)),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: SpinKitThreeBounce(
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                  ],
                                ),
                              )),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
