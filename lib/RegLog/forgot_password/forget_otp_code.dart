import 'package:flutter/material.dart';
import '../login/login.dart';
import '../forgot_password/forgot_password.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../fix/single_back.dart';

class FORGET_OTP_CODE extends StatelessWidget {

  void loginRoute(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
     "/login",
    );
  }

  void forgetPass(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      "/forgot-password",
    );
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
            onCompleted: (pin) => storeFunc.sendForgetOtpCode(pin, context),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: storeFunc.buttonLoader == false
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        primary: Colors.blue,
                        padding: EdgeInsets.all(10),
                        fixedSize: const Size(80, 38),
                      ),
                      onPressed: () {},
                      child: Text(
                        "ادامه",
                        style: TextStyle(fontFamily: "Shabnam", fontSize: 10),
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
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  primary: Colors.white,
                  padding: EdgeInsets.all(5)),
              onPressed: () {
                forgetPass(context);
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
