import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'select_model/home_page_gallry_screen_select.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class REQUEST_BUTTON extends StatelessWidget {
  const REQUEST_BUTTON({Key? key}) : super(key: key);

  void ContinueSelectModels(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "models-category-select",
    );
  }

  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context, listen: true);

    return Card(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  "  تومان   ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: "Khandevane"),
                ),
                Text(
                  (barberData.totalServicePrice.toString().toPersianDigit())
                      .seRagham(),
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                Text(
                  " : مبلغ پرداختی ",
                  style: TextStyle(
                      color: Colors.black, fontSize: 10, fontFamily: "Shabnam"),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    fixedSize: const Size(80, 35),
                    padding: EdgeInsets.all(10)),
                onPressed: () => ContinueSelectModels(context),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "ادامه",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: "Shabnam"),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
