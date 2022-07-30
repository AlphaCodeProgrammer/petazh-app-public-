import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import './search_products_template.dart';
import 'package:flutter/gestures.dart';

class LIST_SEARCH extends StatelessWidget {
  LIST_SEARCH();

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final searchProducts = storeFunc.searchProducts;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color.fromARGB(255, 250, 244, 244),
            ),
            color: Color.fromARGB(255, 247, 241, 241)),
        height: 200,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: searchProducts.length,
              itemBuilder: (context, index) {
                return SEARCH_PRODUCTS_TEMPLATE(
                  searchProducts[index]["_id"],
                  searchProducts[index]["name"],
                  searchProducts[index]["images"],
                );
              }),
        ),
      ),
    );
  }
}
