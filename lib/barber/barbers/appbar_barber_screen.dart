import 'package:flutter/material.dart';
import '../barbers/barbers_filter_screen.dart';

class APPBAR_BARBER_SCREEN extends StatelessWidget {
  final sizeAppBar = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.only(left: 5),
        height: sizeAppBar - 15,
        child: TextField(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/filter-barber',
            );
          },
          readOnly: true,
          cursorColor: Color.fromARGB(255, 220, 224, 217),
          style: TextStyle(
              fontSize: 12.0, color: Colors.black, fontFamily: "Shabnam"),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(192, 192, 192, 1),
            contentPadding: EdgeInsets.only(top: 4),
            hintText: "جست و جو و فیلتر در پیتاژ",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
