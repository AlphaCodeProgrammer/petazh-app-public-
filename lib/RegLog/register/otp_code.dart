import 'package:flutter/material.dart';
import '../login/login.dart';
import '../forgot_password/forgot_password.dart';
// import 'package:flutter_verification_code/flutter_verification_code.dart';
import './register_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../fix/single_back.dart';

class OTP_CODE extends StatelessWidget {
  void loginRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/login");
  }

  void ForgotPassRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/forgot-password");
  }

  void registerPhone(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/register");
  }

  final otpCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Scaffold(
        body: ListView(
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: SINGLE_BACK(Colors.grey, Colors.white, 50, 50)),
        Container(
          child: Center(child: Image.asset('images/petazh-logo.png')),
        ),
        Center(
            child: Text("کد 5 رقمی ارسال شده را در کادر زیر وارد کنید",
                style: TextStyle(
                    color: Colors.blue, fontFamily: "Shabnam", fontSize: 12))),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Pinput(
            keyboardType: TextInputType.number,
            length: 5,
            onCompleted: (pin) => storeFunc.sendOtpCode(pin, context),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: !storeFunc.buttonLoader
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue, padding: EdgeInsets.all(20)),
                      onPressed: () {
                        storeFunc.sendOtpCode(otpCode.text, context);
                      },
                      child: Text(
                        "ادامه",
                        style: TextStyle(fontFamily: "Shabnam", fontSize: 14),
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        fixedSize: const Size(68, 40),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {},
                      child: SpinKitThreeBounce(
                        color: Colors.white,
                        size: 15,
                      ))),
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
                registerPhone(context);
              },
              child: Text(
                "شماره اشتباه است؟",
                style: TextStyle(
                    fontFamily: "Shabnam", fontSize: 12, color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
