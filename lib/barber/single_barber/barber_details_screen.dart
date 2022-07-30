import 'package:flutter/material.dart';
import './barber_intro.dart';
import './dropdown.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'stylist_services.dart';
import '../single_barber/request_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'mobile_service_template.dart';

class BARBER_DETAILS_SCREEN extends StatefulWidget {
  final String barberId;
  BARBER_DETAILS_SCREEN(this.barberId);
  @override
  State<BARBER_DETAILS_SCREEN> createState() => _BARBER_DETAILS_SCREENState();
}

class _BARBER_DETAILS_SCREENState extends State<BARBER_DETAILS_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false)
          .getBarberDetails(widget.barberId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context);
    final stylistServices = barberData.stylistServices;
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String> ;
    // final barberId = routeArgs["id"];
    final barberId = barberData.barberDetailsId;
    return Scaffold(
        body: SafeArea(
      child: !barberData.barberDetailsLoader
          ? Column(
              children: [
                Expanded(
                  flex: 9,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      BARBER_INTRO(barberId),
                      SizedBox(
                        height: 5,
                      ),
                      DROPDOWN(),
                      barberData.switchStylistLoader == false
                          ? Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                  child: MediaQuery.of(context).size.width > 400
                                      ? barberData.filterStylistServicesInfo
                                                  .length ==
                                              0
                                          ? GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: stylistServices.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent: 270,
                                                      mainAxisExtent: 270,
                                                      childAspectRatio: 2,
                                                      crossAxisSpacing: 5,
                                                      mainAxisSpacing: 5),
                                              itemBuilder: (context, index) {
                                                return STYLIST_SERVICE(
                                                  stylistServices[index]
                                                      ["name"],
                                                  stylistServices[index]
                                                      ["price"],
                                                  stylistServices[index]
                                                      ["floating"],
                                                  stylistServices[index]
                                                      ["offPrice"],
                                                  stylistServices[index]["id"],
                                                  stylistServices[index]["men"],
                                                  stylistServices[index]
                                                      ["ready"],
                                                  stylistServices[index]["off"],
                                                  stylistServices[index]
                                                      ["material"],
                                                  stylistServices[index]
                                                      ["quantity"],
                                                );
                                              },
                                              scrollDirection: Axis.vertical,
                                            )
                                          : GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: barberData
                                                  .filterStylistServicesInfo
                                                  .length,
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent: 270,
                                                      mainAxisExtent: 270,
                                                      childAspectRatio: 2,
                                                      crossAxisSpacing: 5,
                                                      mainAxisSpacing: 5),
                                              itemBuilder: (context, index) {
                                                return STYLIST_SERVICE(
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["name"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["price"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["floating"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["offPrice"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["id"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["men"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["ready"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["off"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["material"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["quantity"],
                                                );
                                              },
                                              scrollDirection: Axis.vertical,
                                            )
                                      : barberData.filterStylistServicesInfo
                                                  .length ==
                                              0
                                          ? ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: stylistServices.length,
                                              itemBuilder: (context, index) {
                                                return MOBILE_SERVICE_TEMPLATE(
                                                  stylistServices[index]["id"],
                                                  stylistServices[index]
                                                      ["name"],
                                                  stylistServices[index]
                                                      ["price"],
                                                  stylistServices[index]
                                                      ["floating"],
                                                  stylistServices[index]["men"],
                                                  stylistServices[index]
                                                      ["ready"],
                                                  stylistServices[index]["off"],
                                                  stylistServices[index]
                                                      ["material"],
                                                  stylistServices[index]
                                                      ["background"],
                                                  stylistServices[index]
                                                      ["offPrice"],
                                                );
                                              })
                                          : ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: barberData
                                                  .filterStylistServicesInfo
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return MOBILE_SERVICE_TEMPLATE(
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["name"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["price"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["floating"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["offPrice"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["id"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["men"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["ready"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["off"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["material"],
                                                  barberData
                                                          .filterStylistServicesInfo[
                                                      index]["quantity"],
                                                );
                                              },
                                              scrollDirection: Axis.vertical,
                                            )),
                            )
                          : Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                child: SpinKitThreeBounce(
                                  color: Colors.grey,
                                  size: 12,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                barberData.totalServicePrice > 0
                    ? Expanded(flex: 1, child: REQUEST_BUTTON())
                    : Text("")
              ],
            )
          : Center(
              child: SpinKitThreeBounce(
              color: Colors.grey,
              size: 20,
            )),
    ));
  }
}
