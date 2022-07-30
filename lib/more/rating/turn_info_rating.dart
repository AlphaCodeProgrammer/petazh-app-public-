import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../repetitive_widgets/simple_text.dart';
import '../../providers/store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TURN_INFO_RATING extends StatefulWidget {
  @override
  State<TURN_INFO_RATING> createState() => _TURN_INFO_RATINGState();
}

class _TURN_INFO_RATINGState extends State<TURN_INFO_RATING> {
  String stateOfTurn = "";
  Color colorOfState = Colors.white;
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var turnD = Provider.of<Barbers>(context, listen: false).turnDetails[0];

      setState(() {
        stateOfTurn = returnState(turnD);
        colorOfState = returnColor(turnD);
      });
    });
    super.initState();
  }

  String returnState(dynamic turnD) {
    String stateOfTurnText = "";
    if (turnD["Accepted"] && turnD["finished"] && turnD["onlinePaid"]) {
      stateOfTurnText = "  به اتمام رسید(پردخت آنلاین)";
    } else if (turnD["Accepted"] && turnD["finished"] && !turnD["onlinePaid"]) {
      stateOfTurnText = "به اتمام رسید(پرداخت آفلاین)";
    } else if (!turnD["Accepted"] && !turnD["finished"]) {
      stateOfTurnText = "در انتظار تایید";
    } else if (turnD["Accepted"] && !turnD["finished"]) {
      stateOfTurnText = "در انتظار پرداخت";
    } else if (turnD["userChanged"]["rejected"] == true) {
      stateOfTurnText = "لغو شده توسط کاربر";
    } else if (turnD["stylistChanged"]["rejected"] == true) {
      stateOfTurnText = "لغو شده ";
    } else {
      stateOfTurnText = "نامشخص";
    }
    return stateOfTurnText;
  }

  Color returnColor(dynamic turnD) {
    Color colorOfStateText = Colors.white;
    if (turnD["Accepted"] && turnD["finished"] && turnD["onlinePaid"]) {
      colorOfStateText = Colors.green;
    } else if (turnD["Accepted"] && turnD["finished"] && !turnD["onlinePaid"]) {
      colorOfStateText = Colors.black;
    } else if (!turnD["Accepted"] && !turnD["finished"]) {
      colorOfStateText = Color.fromARGB(255, 0, 119, 255);
    } else if (turnD["Accepted"] && !turnD["finished"]) {
      colorOfStateText = Colors.cyan;
    } else if (turnD["userChanged"]["rejected"] == true) {
      colorOfStateText = Colors.red;
    } else if (turnD["stylistChanged"]["rejected"] == true) {
      colorOfStateText = Colors.red;
    } else {
      colorOfStateText = Colors.grey;
    }
    return colorOfStateText;
  }

  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final turnInfo = storeFunc.turnDetails[0];
    final MediaQueryData = MediaQuery.of(context).size;

    return MediaQueryData.width > 600
        ? Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 234, 238),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(
                              12,
                              "${turnInfo["requestDate"]} :  تاریخ درخواست   ",
                              Colors.black,
                              Colors.blue,
                              ""),
                        ),
                      ),

                      //             turnDetailsData[index]["turnDate"]["duration"],
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(
                              12,
                              turnInfo["turnDate"]["StartIn"].length > 0
                                  ? "${turnInfo["turnDate"]["StartIn"]} : شروع نوبت"
                                  : "",
                              Colors.black,
                              Colors.blue,
                              ""),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(
                              12,
                              turnInfo["turnDate"]["EndIn"].length > 0
                                  ? "${turnInfo["turnDate"]["EndIn"]} : اتمام نوبت"
                                  : "",
                              Colors.black,
                              Colors.blue,
                              ""),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: "${turnInfo["turnDate"]["duration"]}".length >
                                  0
                              ? SIMPLE_TEXT(
                                  12,
                                  "مدت زمان نوبت : ${turnInfo["turnDate"]["duration"]} دقیقه  ",
                                  Colors.black,
                                  Colors.blue,
                                  "")
                              : SIMPLE_TEXT(12, "- : مدت زمان نوبت ",
                                  Colors.black, Colors.black, ""),
                        ),
                      ),
                      turnInfo["floatingPrice"] > 0
                          ? Container(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(" تومان ",
                                        style: TextStyle(
                                            fontFamily: "Khandevane",
                                            fontSize: 10,
                                            color: Colors.black87)),
                                    Text(
                                      ("${turnInfo["floatingPrice"]}"
                                              .toPersianDigit())
                                          .seRagham(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Shabnam",
                                          fontSize: 14),
                                    ),
                                    Text(
                                      " : مبلغ شناور ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: "Shabnam"),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 1,
                            ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " : مبلغ کل ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "Shabnam"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(" تومان ",
                                      style: TextStyle(
                                          fontFamily: "Khandevane",
                                          fontSize: 8,
                                          color: Colors.black87)),
                                  Text(
                                    ("${storeFunc.turnDetails[0]["totalServicesPriceByFloatingPrice"]}"
                                            .toPersianDigit())
                                        .seRagham(),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Shabnam",
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      stateOfTurn == "در انتظار تایید" ||
                                              stateOfTurn == "در انتظار پرداخت"
                                          ? SpinKitThreeBounce(
                                              color: colorOfState,
                                              size: 10,
                                            )
                                          : SizedBox(
                                              width: 1,
                                            ),
                                      SIMPLE_TEXT(10, "${stateOfTurn} ",
                                          colorOfState, Colors.black, ""),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.white, BlendMode.color),
                              image: NetworkImage(turnInfo["stylistPhoto"]),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(12, "${turnInfo["stylistName"]}",
                              Colors.blue, Colors.black, " : آرایشگر "),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(
                              12,
                              " آرایشگاه ${turnInfo["barberName"]} ",
                              Colors.blue,
                              Colors.black,
                              ":  محل مراجعه نوبت "),
                        ),
                      ),
                    ],
                  ),
                ]),
          )
        : Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 234, 238),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.white, BlendMode.color),
                              image: NetworkImage(turnInfo["stylistPhoto"]),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(12, "${turnInfo["stylistName"]}",
                              Colors.blue, Colors.black, " : آرایشگر "),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(
                              12,
                              " آرایشگاه ${turnInfo["barberName"]} ",
                              Colors.blue,
                              Colors.black,
                              ":  محل مراجعه نوبت "),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(
                              12,
                              "${turnInfo["requestDate"]} :  تاریخ درخواست   ",
                              Colors.black,
                              Colors.blue,
                              ""),
                        ),
                      ),

                      //             turnDetailsData[index]["turnDate"]["duration"],
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(
                              12,
                              turnInfo["turnDate"]["StartIn"].length > 0
                                  ? "${turnInfo["turnDate"]["StartIn"]} : شروع نوبت"
                                  : "",
                              Colors.black,
                              Colors.blue,
                              ""),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: SIMPLE_TEXT(
                              12,
                              turnInfo["turnDate"]["EndIn"].length > 0
                                  ? "${turnInfo["turnDate"]["EndIn"]} : اتمام نوبت"
                                  : "",
                              Colors.black,
                              Colors.blue,
                              ""),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: "${turnInfo["turnDate"]["duration"]}".length >
                                  0
                              ? SIMPLE_TEXT(
                                  12,
                                  "مدت زمان نوبت : ${turnInfo["turnDate"]["duration"]} دقیقه  ",
                                  Colors.black,
                                  Colors.blue,
                                  "")
                              : SIMPLE_TEXT(12, "- : مدت زمان نوبت ",
                                  Colors.black, Colors.black, ""),
                        ),
                      ),
                      turnInfo["floatingPrice"] > 0
                          ? Container(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(" تومان ",
                                        style: TextStyle(
                                            fontFamily: "Khandevane",
                                            fontSize: 10,
                                            color: Colors.black87)),
                                    Text(
                                      ("${turnInfo["floatingPrice"]}"
                                              .toPersianDigit())
                                          .seRagham(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Shabnam",
                                          fontSize: 14),
                                    ),
                                    Text(
                                      " : مبلغ شناور ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: "Shabnam"),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 1,
                            ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(" تومان ",
                                  style: TextStyle(
                                      fontFamily: "Khandevane",
                                      fontSize: 10,
                                      color: Colors.black87)),
                              Text(
                                ("${storeFunc.turnDetails[0]["totalServicesPriceByFloatingPrice"]}"
                                        .toPersianDigit())
                                    .seRagham(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "Shabnam",
                                    fontSize: 14),
                              ),
                              Text(
                                " : مبلغ کل ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "Shabnam"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              stateOfTurn == "در انتظار تایید" ||
                                      stateOfTurn == "در انتظار پرداخت"
                                  ? SpinKitThreeBounce(
                                      color: colorOfState,
                                      size: 10,
                                    )
                                  : SizedBox(
                                      width: 1,
                                    ),
                              SIMPLE_TEXT(10, "${stateOfTurn} ", colorOfState,
                                  Colors.black, " : وضعیت "),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          );
  }
}
