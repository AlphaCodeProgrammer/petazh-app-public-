import 'package:flutter/material.dart';
import '../../../../repetitive_widgets/simple_appbar.dart';
import '../../../../providers/store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './rejected_template.dart';

class ORDER_REJECTED_SCREEN extends StatefulWidget {
  @override
  State<ORDER_REJECTED_SCREEN> createState() => _ORDER_REJECTED_SCREENState();
}

class _ORDER_REJECTED_SCREENState extends State<ORDER_REJECTED_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getRejectedOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final rejectedOrders = storeFunc.rejectedOrders;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("سفارشات مرجوعی شده"),
        ),
        body: storeFunc.orderPageLoader == false
            ? storeFunc.rejectedOrders.length > 0 &&
                    storeFunc.orderPageLoader == false
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: rejectedOrders.length,
                        itemBuilder: (context, index) {
                          return REJECTED_TEMPLATE(
                            () {
                              storeFunc.getSpeceficRejectedOrder(
                                  rejectedOrders[index]["_id"]);
                            },
                            rejectedOrders[index]["specialId"],
                            rejectedOrders[index]["_id"],
                            rejectedOrders[index]["productsImage"],
                            rejectedOrders[index]["totalOrderRejectPayment"],
                            rejectedOrders[index]["acceptedByPetazh"],
                            rejectedOrders[index]["checkedByPetazh"],
                            rejectedOrders[index]["productCount"],
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
