import 'package:flutter/material.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import '../../../providers/store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'unrated_order_row_template.dart';

class UNRATED_ORDER_SCREEN extends StatefulWidget {
  @override
  State<UNRATED_ORDER_SCREEN> createState() => _UNRATED_ORDER_SCREENState();
}

class _UNRATED_ORDER_SCREENState extends State<UNRATED_ORDER_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<Barbers>(context, listen: false).getUnratedProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final unratedOrders = storeFunc.unratedOrders;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("امتیاز دهی سفارشات"),
        ),
        body: storeFunc.orderPageLoader == false
            ? storeFunc.unratedOrders.length > 0 &&
                    storeFunc.orderPageLoader == false
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: unratedOrders.length,
                        itemBuilder: (context, index) {
                          return UNRATED_ORDER_ROW_TEMPLATE(
                            () {
                              storeFunc.ratingOrderDetails(
                                  context, unratedOrders[index]["_id"]);
                            },
                            unratedOrders[index]["specialId"],
                            unratedOrders[index]["_id"],
                            unratedOrders[index]["productsImagesArray"],
                            unratedOrders[index]["payment"],
                            unratedOrders[index]["postManSending"],
                            unratedOrders[index]["petazhPost"],
                            unratedOrders[index]["productCount"],
                            unratedOrders[index]["recivedByUser"],
                            unratedOrders[index]["deleteOrderByUser"],
                          );
                        }),
                  )
                : Center(child: Text("هیچ سفارشی برای امتیاز دهی موجود نیست"))
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
