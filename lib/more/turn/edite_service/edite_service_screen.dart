import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../../fix/single_back.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './stylist_edite_service_template.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

//ignore: must_be_immutable
class EDITE_SERVICE_SCREEN extends StatefulWidget {
  @override
  State<EDITE_SERVICE_SCREEN> createState() => _EDITE_SERVICE_SCREENState();
}

class _EDITE_SERVICE_SCREENState extends State<EDITE_SERVICE_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).editeServicesByUser(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final stylistServicesInEdite = storeFunc.stylistServicesInEdite;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SINGLE_BACK(Colors.grey, Colors.white, 50, 50),
                  Text(
                    "ویرایش خدمات",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "Shabnam"),
                  ),
                ],
              ),
            ),
          )),
      // body: Text(""),
      body: storeFunc.lp1 == false
          ? Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                            child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: stylistServicesInEdite.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 270,
                                  mainAxisExtent: 270,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return STYLIST_EDITE_SERVICE_TEMPLATE(
                              stylistServicesInEdite[index]["name"],
                              stylistServicesInEdite[index]["price"],
                              stylistServicesInEdite[index]["floating"],
                              stylistServicesInEdite[index]["offPrice"],
                              stylistServicesInEdite[index]["id"],
                              stylistServicesInEdite[index]["men"],
                              stylistServicesInEdite[index]["ready"],
                              stylistServicesInEdite[index]["off"],
                              stylistServicesInEdite[index]["material"],
                              stylistServicesInEdite[index]["quantity"],
                            );
                          },
                          scrollDirection: Axis.vertical,
                        )),
                      ),
                    ],
                  ),
                ),
                storeFunc.totalEditeServicePrice > 0
                    ? Card(
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    "  تومان   ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontFamily: "Khandevane"),
                                  ),
                                  Text(
                                    (storeFunc.totalEditeServicePrice
                                            .toString()
                                            .toPersianDigit())
                                        .seRagham(),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  ),
                                  Text(
                                    " : مبلغ پرداختی ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontFamily: "Shabnam"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(20),
                                child: storeFunc.buttonLoader == false
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(10),
                                          fixedSize: const Size(60, 38),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          primary: Colors.blue,
                                        ),
                                        onPressed: () {
                                          storeFunc.updateTurnServicesByUser(
                                              context);
                                        },
                                        child: Text(
                                          "ثبت ",
                                          style: TextStyle(
                                              fontFamily: "Shabnam",
                                              fontSize: 14),
                                        ),
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(10),
                                          fixedSize: const Size(60, 38),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          primary: Colors.blue,
                                        ),
                                        onPressed: () {},
                                        child: SpinKitThreeBounce(
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      )),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 1,
                      ),
              ],
            )
          : Center(
              child: SpinKitThreeBounce(
              color: Colors.grey,
              size: 15,
            )),
    );
  }
}
