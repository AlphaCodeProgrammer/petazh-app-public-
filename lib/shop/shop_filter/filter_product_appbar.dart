import 'package:flutter/material.dart';
import 'shop_filter_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../more/shop_part/shopping_basket/shopping_basket_screen.dart';

class FILTER_PRODUCT_APPBAR extends StatelessWidget {
  final sizeAppBar = AppBar().preferredSize.height;
  void shopFilterRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/filter-shop");
  }

  void basketRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/basket");
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Row(
      children: [
        Expanded(
          flex: MediaQuery.of(context).size.width > 300 ? 3 : 4,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent),
                onPressed: () {
                  basketRoute(context);
                },
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.grey,
                  size: 25,
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              margin: EdgeInsets.only(left: 5),
              height: sizeAppBar - 15,
              child: TextField(
                onTap: () {
                  shopFilterRoute(context);
                },
                readOnly: true,
                cursorColor: Color.fromARGB(255, 220, 224, 217),
                style: TextStyle(
                    fontSize: 12.0, color: Colors.black, fontFamily: "Shabnam"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(192, 192, 192, 1),
                  contentPadding: EdgeInsets.only(top: 4),
                  hintText: "جست و جو و فیلتر در محصولات پیتاژ",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
