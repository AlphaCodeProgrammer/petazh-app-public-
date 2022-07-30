import 'package:flutter/material.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import '../../../providers/store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './order_template.dart';

class ORDER_SENDING_SCREEN extends StatefulWidget {
  @override
  State<ORDER_SENDING_SCREEN> createState() => _ORDER_SENDING_SCREENState();
}

class _ORDER_SENDING_SCREENState extends State<ORDER_SENDING_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getUserOrders(
        false,
      );
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
          title: SIMPLE_APPBAR("سفارشات در حال ارسال"),
        ),
        body: storeFunc.orderPageLoader == false
            ? storeFunc.orders.length > 0 && storeFunc.orderPageLoader == false
                ? Container(
                    width: MediaQuery.of(context).size.width,
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
                : Center(child: Text("هیچ سفارش درحال ارسالی موجود  نمیباشد"))
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
