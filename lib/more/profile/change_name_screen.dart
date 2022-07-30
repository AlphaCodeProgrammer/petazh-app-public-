import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CHANGE_NAME_SCREEN extends StatelessWidget {
  final newUsername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Barbers>(context);
    final users = userData.user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR("اطلاعات کاربری"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(users[0]["userPhoto"]),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Colors.white, // <-- Button color
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    users[0]["phone"].toString().toPersianDigit(),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(users[0]["username"])),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "نام و نام خانوادگی",
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
                      textAlign: TextAlign.right,
                      controller: newUsername,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: "Shabnam"),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText:
                            users[0]["username"].toString().toPersianDigit(),
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
                          userData.changeUsername(newUsername, context);
                        },
                        child: Text(
                          "ثبت اطلاعات",
                          style: TextStyle(fontFamily: "Shabnam", fontSize: 14),
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
