import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../../fix/single_back.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'edite_service/edite_service_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import './turn_details_info.dart';
import './turn_payment_screen.dart';

//ignore: must_be_immutable
class TURN_DETAILS_SCREEN extends StatefulWidget {
  final String turnDetailsId;

  TURN_DETAILS_SCREEN(this.turnDetailsId);

  State<TURN_DETAILS_SCREEN> createState() => _TURN_DETAILS_SCREENState();
}

class _TURN_DETAILS_SCREENState extends State<TURN_DETAILS_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false)
          .getTurnsDetails(widget.turnDetailsId);
    });
    super.initState();
  }

  void turnPaymentRoute(ctx) {
    Navigator.of(ctx).pushNamed("/turn-payment");
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Scaffold(
      appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SINGLE_BACK(Colors.grey, Colors.white, 50, 50),
                  Text(
                    "جزییات نوبت",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "Shabnam"),
                  ),
                  storeFunc.turnDetails.length > 0 &&
                          storeFunc.turnDetails[0]["finished"] == false
                      ? PopupMenuButton(
                          enableFeedback: true,
                          tooltip: "بیشتر",
                          color: Colors.white,
                          elevation: 0,
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                                onTap: () {
                                  storeFunc.postOnRejectTurnByUser(
                                      storeFunc.turnDetails[0]["_id"], context);
                                },
                                child: Text("لغو نوبت",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "Shabnam",
                                        fontSize: 12))),
                            PopupMenuItem(
                                onTap: () => Future(
                                      () => Navigator.of(context)
                                          .pushNamed("/edite-service"),
                                    ),
                                child: Text("ویرایش خدمات",
                                    style: TextStyle(
                                        fontFamily: "Shabnam", fontSize: 12)))
                          ],
                          icon: Icon(
                            Icons.more_vert_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                        )
                      : SizedBox(
                          height: 1,
                        )
                ],
              ),
            ),
          )),
      body: storeFunc.lp1 == false && storeFunc.turnDetails.length > 0
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 9, child: TURN_DETAILS_INFO()),
                (storeFunc.turnDetails[0]["Accepted"] == true &&
                        storeFunc.turnDetails[0]["finished"] == false)
                    ? Card(
                        elevation: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50,
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "  تومان   ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontFamily: "Khandevane"),
                                  ),
                                  Text(
                                    "${storeFunc.turnDetails[0]["totalServicesPriceByFloatingPrice"]}"
                                        .toString()
                                        .toPersianDigit()
                                        .seRagham(),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  ),
                                  Text(
                                    " : مبلغ پرداختی ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontFamily: "Shabnam"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      fixedSize: const Size(80, 30),
                                      padding: EdgeInsets.all(10)),
                                  onPressed: () {
                                    turnPaymentRoute(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "پرداخت",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontFamily: "Shabnam"),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )
                    : SizedBox(height: 1)
              ],
            )
          : Center(
              child: SpinKitThreeBounce(
              color: Colors.grey,
              size: 20,
            )),
    );
  }
}
