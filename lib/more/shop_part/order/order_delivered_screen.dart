import 'package:flutter/material.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import '../../../providers/store.dart';
import 'package:provider/provider.dart';
import './order_template.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ORDER_DELIVERED_SCREEN extends StatefulWidget {
  @override
  State<ORDER_DELIVERED_SCREEN> createState() => _ORDER_DELIVERED_SCREENState();
}

class _ORDER_DELIVERED_SCREENState extends State<ORDER_DELIVERED_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getUserOrders(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final orders = storeFunc.orders;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("سفارشات ارسال شده"),
        ),
        body: storeFunc.orderPageLoader == false
            ? storeFunc.orders.length > 0 && storeFunc.orderPageLoader == false
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return ORDER_TEMPLATE(
                            () {
                              storeFunc.getSpeceficOrder(orders[index]["_id"]);
                            },
                            orders[index]["specialId"],
                            orders[index]["_id"],
                            orders[index]["productsImagesArray"],
                            orders[index]["payment"],
                            orders[index]["postManSending"],
                            orders[index]["petazhPost"],
                            orders[index]["productCount"],
                            orders[index]["recivedByUser"],
                            orders[index]["deleteOrderByUser"],
                          );
                        }),
                  )
                : Center(child: Text("هیچ سفارش تحویل داده ای موجود نمیباشد"))
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
