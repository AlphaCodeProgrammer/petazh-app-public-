import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CHANGE_EMAIL_SCREEN extends StatelessWidget {
  final newEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Barbers>(context);
    final users = userData.user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR("ایمیل"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "لطفا ایمیل خود را وارد کنید",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: "Shabnam"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "ایمیل",
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
                        controller: newEmail,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontFamily: "Shabnam"),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText:
                              users[0]["email"].toString().toPersianDigit(),
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
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                padding: EdgeInsets.all(20),
                child: !userData.buttonLoader
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          fixedSize: const Size(100, 38),
                          primary: Colors.blue,
                        ),
                        onPressed: () {
                          userData.changeEmail(newEmail, context);
                        },
                        child: Text(
                          "ثبت ایمیل",
                          style: TextStyle(fontFamily: "Shabnam", fontSize: 12),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.all(10),
                          fixedSize: const Size(100, 38),
                        ),
                        onPressed: () {},
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                          size: 15,
                        ))),
          ),
        ],
      ),
    );
  }
}
