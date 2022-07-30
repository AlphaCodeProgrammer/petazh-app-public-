import './sellers_mobile.dart';
import "package:flutter/material.dart";
import './product_images_mobile.dart';
import '../product_info.dart';
import '../product_seller.dart';
import '../info.dart';
import '../properties.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../more_sellers_screen.dart';

class PRODUCT_DETAILS_MOBILE_SCREEN extends StatefulWidget {
  final String productId;

  PRODUCT_DETAILS_MOBILE_SCREEN(this.productId);
  @override
  State<PRODUCT_DETAILS_MOBILE_SCREEN> createState() =>
      _PRODUCT_DETAILS_MOBILE_SCREENState();
}

class _PRODUCT_DETAILS_MOBILE_SCREENState
    extends State<PRODUCT_DETAILS_MOBILE_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false)
          .getProductDetailsInfo(widget.productId, context);
    });
    super.initState();
  }

  void selelrsRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/more-sellers",
    );
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Card(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PRODUCT_IMAGES_MOBILE(),
              PRODUCT_INFO(),
              storeFunc.productDetails["avilable"] &&
                      storeFunc.productDetails["sellers"].length > 0
                  ? PRODUCT_SELLER()
                  : SizedBox(
                      height: 1,
                    ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(5)),
                    onPressed: () {
                      selelrsRoute(context);
                    },
                    child: Text(
                      "مشاهده تمام فروشندگان",
                      style: TextStyle(
                          fontFamily: "Shabnam",
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              INFO(),
              PROPERTIESE()
            ],
          ),
        ),
      ),
    );
  }
}
