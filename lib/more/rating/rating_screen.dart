import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import '../../fix/buttom_navigations_favorite_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'unrated_turn_row.dart';

class RATING_SCREEN extends StatefulWidget {
  @override
  State<RATING_SCREEN> createState() => _RATING_SCREENState();
}

class _RATING_SCREENState extends State<RATING_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getUnratedTurns();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final turnsData = Provider.of<Barbers>(context);
    final unratedTurns = turnsData.unratedTurns;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR("امتیاز دهی"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: turnsData.turnsLoader == false
                ? unratedTurns.length > 0
                    ? ListView.builder(
                        itemCount: unratedTurns.length,
                        itemBuilder: (context, index) {
                          return UNRATED_TURN_ROW(
                            unratedTurns[index]["_id"],
                            unratedTurns[index]["barberName"],
                            () {
                              turnsData.ratingDetails(
                                  context, unratedTurns[index]["_id"]);
                            },
                            unratedTurns[index]["requestDate"],
                            unratedTurns[index]["Accepted"],
                            unratedTurns[index]["finished"],
                            unratedTurns[index]["onlinePaid"],
                            unratedTurns[index]["barberPhoto"],
                            unratedTurns[index]["totalServicesPrice"],
                            unratedTurns[index]["userChanged"]["rejected"],
                            unratedTurns[index]["stylistChanged"]["rejected"],
                          );
                        },
                      )
                    : Center(
                        child: Text("هیچ نوبتی برای امیتیاز دهی موجود نیمیباشد",
                            style: TextStyle(
                                fontFamily: "Shabnam",
                                fontSize: 14,
                                color: Colors.grey)),
                      )
                : Center(
                    child: SpinKitThreeBounce(
                    color: Colors.grey,
                    size: 20,
                  )),
          )
        ],
      ),
    );
  }
}
