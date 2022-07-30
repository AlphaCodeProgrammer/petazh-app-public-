import 'package:flutter/material.dart';
import '../../../../repetitive_widgets/simple_appbar.dart';
import '../../../../providers/store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../order_template.dart';

class ORDER_CANCELED_SCREEN extends StatefulWidget {
  @override
  State<ORDER_CANCELED_SCREEN> createState() => _ORDER_CANCELED_SCREENState();
}

class _ORDER_CANCELED_SCREENState extends State<ORDER_CANCELED_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getCanceledOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final canceledOrders = storeFunc.canceledOrders;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("سفارشات لغو شده"),
        ),
        body: storeFunc.orderPageLoader == false
            ? storeFunc.canceledOrders.length > 0 &&
                    storeFunc.orderPageLoader == false
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: canceledOrders.length,
                        itemBuilder: (context, index) {
                          return ORDER_TEMPLATE(
                            () {
                              storeFunc.getSpeceficCanceledOrder(
                                  canceledOrders[index]["_id"]);
                            },
                            canceledOrders[index]["specialId"],
                            canceledOrders[index]["_id"],
                            canceledOrders[index]["productsImagesArray"],
                            canceledOrders[index]["payment"],
                            canceledOrders[index]["postManSending"],
                            canceledOrders[index]["petazhPost"],
                            canceledOrders[index]["productCount"],
                            canceledOrders[index]["recivedByUser"],
                            canceledOrders[index]["deleteOrderByUser"],
                          );
                        }),
                  )
                : Center(child: Text("هیچ سفارشی لغو شده ای  نمیباشد"))
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
