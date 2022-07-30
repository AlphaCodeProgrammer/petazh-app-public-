import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import '../../repetitive_widgets/textfeild.dart';

class CONTACT_US_SCREEN extends StatelessWidget {
  final String navbarName = "ارتباط با ما";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR(navbarName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "pytazh@gmail.com :ایمیل",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Text(
                      "تلفن تماس : 32741228-031",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Text(
                      "آدرس : اصفهان - خیابان هشت بهشت شرقی- خیابان رکن الدوله - کوچه شهرزاد اول - پلاک 11 طبقه اول",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Container(
                        width: 200,
                        child: TEXTFEILD("", " شماره تلفن یا ایمیل "))),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Container(
                        width: 200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "متن توضیحات شما",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: TextField(
                                maxLines: 8,
                                cursorColor: Colors.grey,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: "Shabnam"),
                                cursorHeight: 20,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "توضیحات ",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(192, 192, 192, 1)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(192, 192, 192, 1)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  fixedSize: const Size(30, 30),
                  padding: EdgeInsets.all(5)),
              onPressed: () {},
              child: Text(
                " ارسال نظر",
                style: TextStyle(fontFamily: "Shabnam", fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
