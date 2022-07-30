import 'package:flutter/material.dart';
import '../register/register_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../forgot_password/forgot_password.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../../fix/buttom_navigations_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

class LOGIN extends StatefulWidget {
  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  final phoneNumber = TextEditingController();

  final password = TextEditingController();
  bool obscureTextState = true;

  void RegisterRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/register");
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

  bool validNumber = false;
  bool validPass = false;

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
            : ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100, bottom: 50),
                    child: Center(child: Image.asset('images/petazh-logo.png')),
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
                        text: " ورود ",
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "Shabnam",
                            fontSize: 10)),
                    TextSpan(
                        text: "به پیتاژ اطلاعات خود را وارد کنید",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Shabnam",
                            fontSize: 10)),
                  ]))),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "شماره تلفن",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // On
                        controller: phoneNumber,
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "رمز عبور",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: obscureTextState,
                        obscuringCharacter: "*",
                        controller: password,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontFamily: "Shabnam"),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            disabledColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            icon: Icon(
                              !obscureTextState
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                              size: 15,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureTextState = !obscureTextState;
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.all(10),
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
                          if (value.length > 5) {
                            setState(() {
                              validPass = true;
                            });
                          } else {
                            setState(() {
                              validPass = false;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  validNumber && validPass
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.all(20),
                              child: !storeFunc.buttonLoader
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(10),
                                        fixedSize: const Size(80, 38),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        primary: Colors.blue,
                                      ),
                                      onPressed: () {
                                        storeFunc.loginUser(
                                            phoneNumber, password, context);
                                      },
                                      child: Text(
                                        "ورود",
                                        style: TextStyle(
                                            fontFamily: "Shabnam",
                                            fontSize: 14),
                                      ),
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(10),
                                        fixedSize: const Size(80, 38),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        primary: Colors.blue,
                                      ),
                                      onPressed: () {},
                                      child: SpinKitThreeBounce(
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    )),
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: validNumber && !validPass
                                  ? Text(
                                      "رمز عبور باید بیشتر از 6 کاراکتر باشد",
                                      style: TextStyle(
                                          fontFamily: "Shabnam", fontSize: 12),
                                    )
                                  : !validNumber && validPass
                                      ? Text(
                                          "شماره تلفن خود را به درستی وارد کنید",
                                          style: TextStyle(
                                              fontFamily: "Shabnam",
                                              fontSize: 12),
                                        )
                                      : Text(
                                          "",
                                          style: TextStyle(
                                              fontFamily: "Shabnam",
                                              fontSize: 10),
                                        ),
                            ),
                          ],
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
                          RegisterRoute(context);
                        },
                        child: Text(
                          "هنوز ثبت نام نکرده اید؟",
                          style: TextStyle(
                              fontFamily: "Shabnam",
                              fontSize: 12,
                              color: Colors.green),
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
              ));
  }
}
