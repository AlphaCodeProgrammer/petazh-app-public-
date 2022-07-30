import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TURN_ROW extends StatelessWidget {
  final String id;
  final String barberName;
  final Function routeHandler;
  final String requestDate;
  final bool Accepted;
  final bool finished;
  final bool onlinePaid;
  final String barberPhoto;
  final double totalServicesPrice;
  final bool userRejection;
  final bool stylistRejection;

  String get totalServicePricePersian {
    var totalServicePricePersianDigit;
    totalServicePricePersianDigit =
        totalServicesPrice.toString().toPersianDigit();
    return totalServicePricePersianDigit;
  }

  String get stateOfTurn {
    String stateOfTurnText;
    if (Accepted && finished && onlinePaid) {
      stateOfTurnText = "  به اتمام رسید(پردخت آنلاین)";
    } else if (Accepted && finished && !onlinePaid) {
      stateOfTurnText = "به اتمام رسید(پرداخت آفلاین)";
    } else if (!Accepted && !finished) {
      stateOfTurnText = "در انتظار تایید";
    } else if (Accepted && !finished) {
      stateOfTurnText = "در انتظار پرداخت";
    } else if (userRejection == true) {
      stateOfTurnText = "لغو شده توسط کاربر";
    } else if (stylistRejection == true) {
      stateOfTurnText = "لغو شده ";
    } else {
      stateOfTurnText = "نامشخص";
    }
    return stateOfTurnText;
  }

  Color get colorOfState {
    Color colorOfStateText;
    if (Accepted && finished && onlinePaid) {
      colorOfStateText = Colors.green;
    } else if (Accepted && finished && !onlinePaid) {
      colorOfStateText = Colors.black;
    } else if (!Accepted && !finished) {
      colorOfStateText = Color.fromARGB(255, 0, 119, 255);
    } else if (Accepted && !finished) {
      colorOfStateText = Colors.cyan;
    } else if (userRejection == true) {
      colorOfStateText = Colors.red;
    } else if (stylistRejection == true) {
      colorOfStateText = Colors.red;
    } else {
      colorOfStateText = Colors.grey;
    }
    return colorOfStateText;
  }

  @override
  TURN_ROW(
      this.id,
      this.barberName,
      this.routeHandler,
      this.requestDate,
      this.Accepted,
      this.finished,
      this.onlinePaid,
      this.barberPhoto,
      this.totalServicesPrice,
      this.userRejection,
      this.stylistRejection);
  Widget build(BuildContext context) {
    final turnsData = Provider.of<Barbers>(context);

    return InkWell(
      onTap: () {
        routeHandler();
        // turnsData.getTurnsDetails(id);
      },
      child: Card(
        elevation: 5,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        requestDate.toPersianDigit(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${totalServicePricePersian.seRagham()} ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Shabnam"),
                          ),
                          Text(
                            " تومان",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Khandevane"),
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
                              Text(stateOfTurn,
                                  style: TextStyle(
                                    color: colorOfState,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  flex: 5,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(barberPhoto),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " ${barberName} ".toPersianDigit(),
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ],
                  ),
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
