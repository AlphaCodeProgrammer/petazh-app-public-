import 'package:flutter/material.dart';
import '../fix/single_back.dart';

class SIMPLE_APPBAR extends StatelessWidget {
  final String navbarName;

  @override
  SIMPLE_APPBAR(this.navbarName);
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SINGLE_BACK(Colors.grey, Colors.white, 40, 40)),
          Expanded(
            flex: 6,
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: widthSize / 1.5,
                  height: 20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text(
                        navbarName,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontFamily: "Shabnam"),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
