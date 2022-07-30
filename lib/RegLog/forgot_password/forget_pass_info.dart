import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../fix/single_back.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class FORGET_PASS_INFO extends StatefulWidget {
  bool obscureTextState = true;
  bool validPass = false;
  @override
  State<FORGET_PASS_INFO> createState() => _FORGET_PASS_INFOState();
}

class _FORGET_PASS_INFOState extends State<FORGET_PASS_INFO> {
  final password = TextEditingController();

  final confirm_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

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

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: SINGLE_BACK(Colors.grey, Colors.white, 50, 50)),
            Container(
              child: Center(child: Image.asset('images/petazh-logo.png')),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10)),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "رمز عبور باید بیشتر از 6 کاراکتر باشد".toPersianDigit(),
                    maxLines: 10,
                    style: TextStyle(
                        fontSize: 12, color: Colors.red, fontFamily: "Shabnam"),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  "رمز عبور",
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
                  controller: password,
                  cursorColor: Colors.grey,
                  onChanged: (_) {
                    checkValidPass();
                  },
                  obscureText: widget.obscureTextState,
                  obscuringCharacter: "*",
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
              child: Container(
                child: Text(
                  "تکرار رمز عبور ",
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
                  onChanged: (_) {
                    checkValidPass();
                  },
                  obscureText: widget.obscureTextState,
                  obscuringCharacter: "*",
                  controller: confirm_password,
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
            Center(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: storeFunc.buttonLoader == false
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.all(10),
                            fixedSize: const Size(80, 38),
                          ),
                          onPressed: () {
                            storeFunc.postNewPassword(
                                password, confirm_password, context);
                          },
                          child: Text(
                            " تغیر رمز عبور ",
                            style:
                                TextStyle(fontFamily: "Shabnam", fontSize: 10),
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.all(10),
                            fixedSize: const Size(80, 38),
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
