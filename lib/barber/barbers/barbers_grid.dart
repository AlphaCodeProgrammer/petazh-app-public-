import 'package:flutter/material.dart';
import 'barber_card.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BARBERS_GRID extends StatefulWidget {
  @override
  State<BARBERS_GRID> createState() => _BARBERS_GRIDState();
}

class _BARBERS_GRIDState extends State<BARBERS_GRID> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Barbers>(context).firstGetBarbers(false, context);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final barbersData = Provider.of<Barbers>(context);
    final barbers = barbersData.barbers;

    return SafeArea(
        child: barbersData.barbersLoader != 0
            ? barbersData.barbersLoader == 1 && barbersData.barbers.length == 0
                ? Center(
                    child: Text(
                    "برای فیلتر های شما نتیجه ای یافت نشد ",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 14,
                        color: Colors.black),
                  ))
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 500,
                          childAspectRatio: 1,
                          mainAxisExtent: 300,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemCount: barbers.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return BARBER_CARD(
                          barbers[index]["_id"],
                          barbers[index]["barberName"],
                          barbers[index]["finalRating"],
                          barbers[index]["barberPhoto"],
                          barbers[index]["Men"],
                          barbers[index]["barberCity"],
                          barbers[index]["barberArea"],
                        );
                      },
                    ),
                  )
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
