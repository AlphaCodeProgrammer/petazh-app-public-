import 'package:flutter/material.dart';
import '../login/login.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../register/register_screen.dart';
import '../register/register_info.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../../fix/buttom_navigations_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FORGOT_PASSWORD extends StatefulWidget {
  @override
  State<FORGOT_PASSWORD> createState() => _FORGOT_PASSWORDState();
}

class _FORGOT_PASSWORDState extends State<FORGOT_PASSWORD> {
  void loginRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/login");
  }

  void homeRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      "/",
    );
  }

  void register(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/register");
  }

  void RegisterInfoRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/register-info");
  }

  final forgetedPhone = TextEditingController();
  bool validNumber = false;
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Scaffold(
        body: storeFunc.token.contains("Bearer")
            ? Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(30, 30),
                      padding: EdgeInsets.all(5)),
                  onPressed: () {
                    homeRoute(context);
                  },
                  child: Text(
                    "بازگشت به صفحه ی اصلی",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ),
              )
            : ListView(
                children: [
                  Container(
                    child: Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 100, bottom: 50),
                            child:
                                Image.asset('assets/images/petazh-logo.png'))),
                  ),
                  Center(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                        text: "برای ",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Shabnam",
                            fontSize: 14)),
                    TextSpan(
                        text: " فراموشی رمز عبور ",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Shabnam",
                            fontSize: 14)),
                    TextSpan(
                        text: "خود در  پیتاژ شماره خود را وارد کنید",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Shabnam",
                            fontSize: 14)),
                  ]))),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text(
                        "شماره تلفن",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: forgetedPhone,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontFamily: "Shabnam"),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "09...".toPersianDigit(),
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
                        onChanged: (value) {
                          if (value.length > 10 &&
                              value.length < 12 &&
                              value.startsWith("09")) {
                            setState(() {
                              validNumber = true;
                            });
                          } else {
                            setState(() {
                              validNumber = false;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  validNumber
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.all(20),
                              child: storeFunc.buttonLoader == false
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(10),
                                        fixedSize: const Size(100, 38),
                                        primary: Colors.blue,
                                      ),
                                      onPressed: () {
                                        storeFunc.checkForgetPassword(
                                            forgetedPhone, context);
                                      },
                                      child: Text(
                                        "  بازیابی رمز عبور",
                                        style: TextStyle(
                                            fontFamily: "Shabnam",
                                            fontSize: 10),
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
                      : SizedBox(
                          height: 1,
                        ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.all(5)),
                        onPressed: () {
                          loginRoute(context);
                        },
                        child: Text(
                          "قبلا ثبت نام کرده اید؟",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.all(5)),
                        onPressed: () {
                          register(context);
                        },
                        child: Text(
                          "!ثبت نام کنید ",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}
