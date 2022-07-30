import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PAYMENT_SCREEN extends StatefulWidget {
  @override
  State<PAYMENT_SCREEN> createState() => _PAYMENT_SCREENState();
}

class _PAYMENT_SCREENState extends State<PAYMENT_SCREEN> {
  // var _isInit = true;
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     Provider.of<Barbers>(context).getAvilableDaysForSendProduct();
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }
  final shopOffCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    final finalPayment = storeFunc.totalPriceByOff + storeFunc.postPrice;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("پرداخت "),
        ),
        body: Center(
          child: Container(
            // width: 200,
            // height: 400,
            // padding: EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.grey),
            //   borderRadius: BorderRadius.circular(10),
            //   shape: BoxShape.rectangle,
            // ),
            child: ListView(
              children: [
                Center(
                  child: Container(
                    child: Center(
                        child: Image.asset('assets/images/petazh-logo.png')),
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
                        child: storeFunc.buttonLoader == false
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    padding: EdgeInsets.all(5)),
                                onPressed: () {
                                  storeFunc.orderProductsFunction(
                                      true, context);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 120,
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.cyan, padding: EdgeInsets.all(5)),
                          onPressed: () {
                            // toPaymentRoute(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "اعمال کد تخفیف",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: "Shabnam"),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 120,
                      child: TextField(
                        controller: shopOffCode,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontFamily: "Shabnam"),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "کد تخفیف دارید؟",
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
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
