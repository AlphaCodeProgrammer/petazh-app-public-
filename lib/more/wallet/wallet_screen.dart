import 'package:flutter/material.dart';
import '../../fix/single_back.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter/services.dart';

class WALLET_SCREEN extends StatefulWidget {
  @override
  State<WALLET_SCREEN> createState() => _WALLET_SCREENState();
}

class _WALLET_SCREENState extends State<WALLET_SCREEN> {
  final value = TextEditingController();
  var showValue = "";
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      value.text = "500000";
      showValue = value.text.toString().toPersianDigit().seRagham();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void updateValue(price) {
    if (int.parse(price) < 50000000 && int.parse(price) >= 0) {
      setState(() {
        value.text = int.parse(price).toString();
        showValue = value.text.toString().toPersianDigit().seRagham();
      });
    }
  }

  void increaseValue() {
    if (int.parse(value.text) < 50000000) {
      var isValid = int.parse(value.text) + 100000;
      if (isValid < 50000001) {
        setState(() {
          value.text = (int.parse(value.text) + 100000).toString();
          showValue = value.text.toString().toPersianDigit().seRagham();
        });
      }
    }
  }

  void increaseMore() {
    if (int.parse(value.text) < 49700000) {
      setState(() {
        value.text = (int.parse(value.text) + 300000).toString();
        showValue = value.text.toString().toPersianDigit().seRagham();
      });
    }
  }

  void decreaseValue() {
    if (int.parse(value.text) != 0) {
      var isValid = int.parse(value.text) - 100000;
      if (isValid > 0) {
        setState(() {
          value.text = (int.parse(value.text) - 100000).toString();
          showValue = value.text.toString().toPersianDigit().seRagham();
        });
      }
    }
  }

  void decreaseMore() {
    if (int.parse(value.text) > 300000) {
      setState(() {
        value.text = (int.parse(value.text) - 300000).toString();
        showValue = value.text.toString().toPersianDigit().seRagham();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Barbers>(context);
    final users = userData.user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SINGLE_BACK(Colors.grey, Colors.white, 50, 50),
              flex: 1,
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "تومان",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Khandevane"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "${users[0]["wallet"]}"
                          .toString()
                          .toPersianDigit()
                          .seRagham(separator: ","),
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: "Shabnam"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "اعتبار فعلی شما",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Shabnam",
                      ),
                    ),
                  ),
                ],
              ),
              flex: 6,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 200,
                            child: Tab(
                              icon:
                                  Image.asset("assets/images/add-balance.png"),
                              height: 100,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "شمادر حال افزایش اعتبار برای شماره ${users[0]["phone"].toString().toPersianDigit()} هستید ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      height: 70,
                      width: MediaQuery.of(context).size.width / 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            fixedSize: const Size(30, 30),
                            padding: EdgeInsets.all(5)),
                        child: Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          decreaseValue();
                        },
                        onLongPress: () {
                          decreaseMore();
                        },
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                          controller: value,
                          cursorColor: Colors.grey,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: "Shabnam"),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(192, 192, 192, 1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(192, 192, 192, 1)),
                            ),
                          ),
                          onEditingComplete: () {
                            updateValue(value.text);
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3),
                      height: 70,
                      width: MediaQuery.of(context).size.width / 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            fixedSize: const Size(30, 30),
                            padding: EdgeInsets.all(5)),
                        child: Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          increaseValue();
                        },
                        onLongPress: () {
                          increaseMore();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Text(
                      "تومان",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: "Khandevane"),
                    )),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                        child: Text(
                      "${showValue}",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontFamily: "Shabnam"),
                    )),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                        child: Text(
                      "مبلغ انتخابی شما برای افزایش",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: "Shabnam"),
                    )),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.all(10),
                    fixedSize: const Size(90, 38),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "انصراف",
                    style: TextStyle(fontFamily: "Shabnam", fontSize: 10),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    fixedSize: const Size(90, 38),
                    primary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text(
                    "افزایش موجودی",
                    style: TextStyle(fontFamily: "Shabnam", fontSize: 10),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
