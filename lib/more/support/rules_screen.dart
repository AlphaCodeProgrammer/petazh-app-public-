import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import '../../data/static.dart';

class RULES_SCREEN extends StatelessWidget {
  final String navbarName = "قوانین و توضیحات";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(navbarName),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              itemCount: rulesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      rulesList[index].rule,
                      style: TextStyle(
                          fontFamily: "Shabnam",
                          color: Colors.black87,
                          fontSize: 14),
                    ));
              }),
        ));
  }
}
