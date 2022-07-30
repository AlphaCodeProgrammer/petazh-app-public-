import 'package:flutter/material.dart';
import "package:persian_number_utility/persian_number_utility.dart";
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class TURN_DIALOG extends StatelessWidget {
  @override
  TURN_DIALOG();
  Widget build(BuildContext context) {
    final userData = Provider.of<Barbers>(context);
    final turnDetailsInfo = userData.turnDetails[0];
    final users = userData.user;
    return Container(
      child: Column(
        children: [
          turnDetailsInfo["textToStylist"].length > 1
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width > 600
                        ? 500
                        : MediaQuery.of(context).size.width / 1.2,
                    child: Card(
                      elevation: 0,
                      color: Color.fromARGB(255, 237, 232, 238),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.white, BlendMode.color),
                                      image:
                                          NetworkImage(users[0]["userPhoto"]),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "${users[0]["username"]}",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                  ))
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "${turnDetailsInfo["textToStylist"]}"
                                    .toPersianDigit(),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 1,
                ),
          SizedBox(
            height: 5,
          ),
          turnDetailsInfo["turnDate"]["TextToUser"].length > 1 &&
                  turnDetailsInfo["Accepted"]
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width > 400 ? 300 : 280,
                    child: Card(
                      elevation: 0,
                      color: Color.fromARGB(255, 237, 232, 238),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "${turnDetailsInfo["stylistName"]}",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                  )),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.white, BlendMode.color),
                                      image: NetworkImage(
                                          turnDetailsInfo["stylistPhoto"]),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "${turnDetailsInfo["turnDate"]["TextToUser"]}"
                                    .toPersianDigit(),
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(height: 1),
        ],
      ),
    );
  }
}
