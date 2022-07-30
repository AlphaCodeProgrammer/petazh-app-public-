import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../../shop/shop_home/product_card_template.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../shop/products/product_template_mobile.dart';

class FAVORITE_PRODUCTS extends StatefulWidget {
  static const routeName = "/saved-product";

  @override
  State<FAVORITE_PRODUCTS> createState() => _FAVORITE_PRODUCTSState();
}

class _FAVORITE_PRODUCTSState extends State<FAVORITE_PRODUCTS> {
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Barbers>(context).getFavoriteProducts();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final favoriteProducts = storeFunc.favoriteProducts;
    return SafeArea(
        child: favoriteProducts.length < 0
            ? Center(
                child: Text(
                  "نتیجه ای یافت نشد".toPersianDigit(),
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              )
            : MediaQuery.of(context).size.width > 500
                ? Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 450,
                          mainAxisExtent: 460,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0),
                      itemCount: favoriteProducts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return PRODUCT_CARD_TEMPLATE(
                          favoriteProducts[index]["_id"],
                          favoriteProducts[index]["name"],
                          favoriteProducts[index]["images"],
                          favoriteProducts[index]["group"],
                          favoriteProducts[index]["category"],
                          favoriteProducts[index]["subCategory"],
                          favoriteProducts[index]["brand"],
                          favoriteProducts[index]["avilableColors"],
                          favoriteProducts[index]["avilable"],
                          favoriteProducts[index]["bestSeller"],
                          favoriteProducts[index]["avilableColors"],
                          favoriteProducts[index]["rating"],
                          favoriteProducts[index]["quantity"],
                          favoriteProducts[index]["changing"],
                        );
                      },
                    ),
                  )
                : ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: favoriteProducts.length,
                    itemBuilder: (context, index) {
                      return PRODUCT_TEMPLATE_MOBILE(
                        favoriteProducts[index]["_id"],
                        favoriteProducts[index]["name"],
                        favoriteProducts[index]["images"],
                        favoriteProducts[index]["group"],
                        favoriteProducts[index]["category"],
                        favoriteProducts[index]["subCategory"],
                        favoriteProducts[index]["brand"],
                        favoriteProducts[index]["avilableColors"],
                        favoriteProducts[index]["avilable"],
                        favoriteProducts[index]["bestSeller"],
                        favoriteProducts[index]["avilableColors"],
                        favoriteProducts[index]["rating"],
                        favoriteProducts[index]["quantity"],
                        favoriteProducts[index]["changing"],
                      );
                    }));
  }
}
