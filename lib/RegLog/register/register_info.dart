import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login/login.dart';
import '../forgot_password/forgot_password.dart';
import './register_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import '../../fix/single_back.dart';

//ignore: must_be_immutable
class REGISTER_INFO extends StatefulWidget {
  bool Men = true;
  bool obscureTextState = true;
  bool validPass = false;

  @override
  State<REGISTER_INFO> createState() => _REGISTER_INFOState();
}

class _REGISTER_INFOState extends State<REGISTER_INFO> {
  final username = TextEditingController();

  final password = TextEditingController();

  final confirm_password = TextEditingController();

  final invitationCode = TextEditingController();

  void checkValidPass() {
    if (password.text == confirm_password.text && password.text.length > 5) {
      setState(() {
        widget.validPass = true;
      });
    } else {
      setState(() {
        widget.validPass = false;
      });
    }
  }

  void changeTypeState() {
    setState(() {
      widget.Men = !widget.Men;
    });
  }

  void loginRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/login");
  }

  void ForgotPassRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      "/forgot-password",
    );
  }

  void registerPhone(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/register");
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: SINGLE_BACK(Colors.grey, Colors.white, 50, 50)),
            Align(
              alignment: Alignment.center,
              child: Text(
                "اطلاعات کاربری خود را وارد کنید",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "نام کاربری",
                style: TextStyle(fontSize: 12, color: Colors.black),
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
                  textDirection: TextDirection.rtl,
                  controller: username,
                  cursorColor: Colors.grey,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontFamily: "Shabnam"),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
                width: 200,
                child: TextField(
                  onChanged: (_) {
                    checkValidPass();
                  },
                  obscureText: widget.obscureTextState,
                  obscuringCharacter: "*",
                  controller: password,
                  textDirection: TextDirection.ltr,
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
                        !widget.obscureTextState
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: 15,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.obscureTextState = !widget.obscureTextState;
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: widget.validPass
                              ? Color.fromRGBO(192, 192, 192, 1)
                              : Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: widget.validPass
                              ? Color.fromRGBO(192, 192, 192, 1)
                              : Colors.red),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "تکرار رمز عبور ",
                style: TextStyle(fontSize: 12, color: Colors.black),
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
                  controller: confirm_password,
                  obscureText: widget.obscureTextState,
                  obscuringCharacter: "*",
                  cursorColor: Colors.grey,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontFamily: "Shabnam"),
                  cursorHeight: 20,
                  onChanged: (_) {
                    checkValidPass();
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      disabledColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      icon: Icon(
                        !widget.obscureTextState
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: 15,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.obscureTextState = !widget.obscureTextState;
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: widget.validPass == true
                              ? Color.fromRGBO(192, 192, 192, 1)
                              : Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: widget.validPass
                              ? Color.fromRGBO(192, 192, 192, 1)
                              : Colors.red),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "توجه : لطفا جنسیت خود را به دقت وارد کنید زیرا پس از انتخاب محتوایی مرتبط با اطلاعات شخصی شما نمایش داده خواهد شد و قابل تغیر نخواهد بود",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(widget.Men == true ? "جنسیت آقا" : "جنسیت : خانم",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Shabnam",
                      fontSize: 12)),
            ),
            SizedBox(
              height: 2,
            ),
            Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                  trackColor: Color.fromARGB(255, 231, 38, 157),
                  activeColor: Colors.green,
                  value: widget.Men,
                  onChanged: (_) {
                    changeTypeState();
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 120,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "کد دعوت",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: TextField(
                        controller: invitationCode,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontFamily: "Shabnam"),
                        cursorHeight: 20,
                        decoration: InputDecoration(
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: !storeFunc.buttonLoader
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              fixedSize: const Size(100, 38),
                              padding: EdgeInsets.all(10)),
                          onPressed: () {
                            storeFunc.register(
                                username,
                                password,
                                confirm_password,
                                invitationCode,
                                widget.Men,
                                context);
                          },
                          child: Text(
                            "ثبت اطلاعات ",
                            style:
                                TextStyle(fontFamily: "Shabnam", fontSize: 14),
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 38),
                            primary: Colors.blue,
                          ),
                          onPressed: () {},
                          child: SpinKitThreeBounce(
                            color: Colors.white,
                            size: 15,
                          ))),
            ),
          ],
        ),
      ),
    );
  }
}
