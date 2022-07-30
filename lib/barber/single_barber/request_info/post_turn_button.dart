import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class POST_TURN_BUTTON extends StatelessWidget {
  final textToStylistText;
  POST_TURN_BUTTON(this.textToStylistText);
  void ContinueTextToHome(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamedAndRemoveUntil('', (Route<dynamic> route) => false);
    // Navigator.of(ctx)
    //     .pushNamedAndRemoveUntil('/turn', (Route<dynamic> route) => false);
  }

  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context, listen: true);

    return Card(
      elevation: 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(left: 12),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "مبلغ پرداختی :",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Shabnam",
                      fontSize: 10)),
              TextSpan(
                  text: barberData.totalServicePrice
                      .toString()
                      .toPersianDigit()
                      .seRagham(),
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: "Shabnam",
                    fontSize: 16,
                  )),
              TextSpan(text: " "),
              TextSpan(
                  text: "تومان",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Khandevane",
                    fontSize: 10,
                  )),
            ])),
          ),
          Container(
              child: !barberData.buttonLoader
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 30),
                        primary: Colors.blue,
                      ),
                      onPressed: () {
                        barberData.postTurn(textToStylistText, context);
                      },
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              "ثبت درخواست",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Shabnam"),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 12,
                          ),
                        ],
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        fixedSize: const Size(120, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: () {},
                      child: Center(
                          child: SpinKitThreeBounce(
                        color: Colors.white,
                        size: 15,
                      )))),
        ],
      ),
    );
  }
}
