import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../shop/product_details/product_details_screen.dart';
import '../../providers/store.dart';

class SELECT_DAY_TEMPLATE extends StatelessWidget {
  String weekDayName;
  String fullDate;
  bool selected;

  SELECT_DAY_TEMPLATE(this.weekDayName, this.fullDate, this.selected);

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return InkWell(
      onTap: () {
        storeFunc.selecteDayForSendProductFunction(fullDate);
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('', (Route<dynamic> route) => false);
        // Navigator.of(context).pushNamed(
        //   PRODUCT_DETAILS_SCREEN.routeName,
        // );
        // storeFunc.getProductDetailsInfo(productId, context);
      },
      child: Card(
        elevation: 5,
        color: selected ? Color.fromARGB(255, 166, 239, 248) : Colors.white,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  weekDayName.toString().toPersianDigit(),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  fullDate.toString().toPersianDigit(),
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Text(
                  "ارسال از ساعت 9 صبح الی 9 شب".toString().toPersianDigit(),
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
