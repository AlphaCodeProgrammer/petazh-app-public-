import 'package:flutter/material.dart';
import '../shop_filter/filter_product_appbar.dart';

import 'carousel.dart';
import 'category_select_template.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'agent_products_template.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SHOP_HOME_SCREEN extends StatefulWidget {
  @override
  State<SHOP_HOME_SCREEN> createState() => _SHOP_HOME_SCREENState();
}

class _SHOP_HOME_SCREENState extends State<SHOP_HOME_SCREEN> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getHomeProducts();
      Provider.of<Barbers>(context, listen: false).getBasicInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: FILTER_PRODUCT_APPBAR(),
          elevation: 1,
          automaticallyImplyLeading: false,
        ),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView(
            children: [
              CAROUSEL(),
              CATEGORY_SELECT_TEMPLATE(),
              storeFunc.productNumber > 0
                  ? SizedBox(
                      height: 5,
                    )
                  : Container(
                      height: 25,
                      child: Center(
                          child: SpinKitThreeBounce(
                        color: Colors.grey,
                        size: 20,
                      )),
                    ),
              storeFunc.cosmeticProducts.length > 0
                  ? AGENT_PRODUCTS_TEMPLATE(storeFunc.cosmeticProducts)
                  : SizedBox(
                      height: 5,
                    ),
              SizedBox(
                height: 5,
              ),
              storeFunc.careProducts.length > 0
                  ? AGENT_PRODUCTS_TEMPLATE(storeFunc.careProducts)
                  : SizedBox(
                      height: 5,
                    ),
              SizedBox(
                height: 5,
              ),
              storeFunc.machineProducts.length > 0
                  ? AGENT_PRODUCTS_TEMPLATE(storeFunc.machineProducts)
                  : SizedBox(
                      height: 5,
                    ),
            ],
          ),
        ));
  }
}
