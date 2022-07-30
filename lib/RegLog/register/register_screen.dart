import 'package:flutter/material.dart';
import '../login/login.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../forgot_password/forgot_password.dart';
import './register_info.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../../fix/buttom_navigations_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

class REGISTER_SCREEN extends StatefulWidget {
  @override
  State<REGISTER_SCREEN> createState() => _REGISTER_SCREENState();
}

class _REGISTER_SCREENState extends State<REGISTER_SCREEN> {
  void loginRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/login");
  }

  void homeRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      "/",
    );
  }

  void ForgotPassRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      "/forgot-password",
    );
  }

  void RegisterInfoRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/register-info");
  }

  final registerPhone = TextEditingController();
  bool isValid = false;

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
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
              )
            : Center(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100, bottom: 50),
                      child: Center(
                          child: Image.asset('assets/images/petazh-logo.png')),
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
                          text: " ثبت نام ",
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: "Shabnam",
                              fontSize: 14)),
                      TextSpan(
                          text: "در پیتاژ شماره خود را وارد کنید",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Shabnam",
                              fontSize: 14)),
                    ]))),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 200,
                      child: Align(
                        alignment: Alignment.center,
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
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // On
                          controller: registerPhone,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(192, 192, 192, 1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(192, 192, 192, 1)),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.length > 10 &&
                                value.length < 12 &&
                                value.startsWith("09")) {
                              setState(() {
                                isValid = true;
                              });
                            } else {
                              setState(() {
                                isValid = false;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    isValid
                        ? Center(
                            child: Container(
                                padding: EdgeInsets.all(20),
                                child: !storeFunc.buttonLoader
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: EdgeInsets.all(20),
                                          primary: Colors.blue,
                                        ),
                                        onPressed: () async {
                                          try {
                                            storeFunc.checkRegisteration(
                                                registerPhone, context);
                                          } catch (error) {}
                                        },
                                        child: Text(
                                          "ثبت نام",
                                          style: TextStyle(
                                              fontFamily: "Shabnam",
                                              fontSize: 10),
                                        ),
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          fixedSize: const Size(72, 38),
                                          padding: EdgeInsets.all(20),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
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
                              shadowColor: Colors.transparent,
                              primary: Colors.white,
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
                              shadowColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(5)),
                          onPressed: () {
                            ForgotPassRoute(context);
                          },
                          child: Text(
                            "رمز عبور خود را فراموش کرده اید؟",
                            style: TextStyle(
                                fontFamily: "Shabnam",
                                fontSize: 12,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
