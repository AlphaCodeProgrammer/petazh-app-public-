import 'package:flutter/material.dart';
import 'turn_row.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import './turn_details_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TURN_SCREEN extends StatefulWidget {
  @override
  State<TURN_SCREEN> createState() => _TURN_SCREENState();
}

class _TURN_SCREENState extends State<TURN_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getTurns();
    });
    super.initState();
  }

  void TurnDetails(BuildContext ctx, turnId) {
    Navigator.of(ctx).pushNamed(
      "/turn/${turnId}",
    );
  }

  @override
  Widget build(BuildContext context) {
    final turnsData = Provider.of<Barbers>(context);
    final turns = turnsData.turns;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR("نوبت ها"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: turnsData.turnsLoader == false
                ? turnsData.turns.length > 0
                    ? ListView.builder(
                        itemCount: turns.length,
                        itemBuilder: (context, index) {
                          return TURN_ROW(
                            turns[index]["_id"],
                            turns[index]["barberName"],
                            () {
                              Navigator.of(context)
                                  .pushNamed("/turn/${turns[index]["_id"]}");
                              // TurnDetails(context, turns[index]["_id"]);
                            },
                            turns[index]["requestDate"],
                            turns[index]["Accepted"],
                            turns[index]["finished"],
                            turns[index]["onlinePaid"],
                            turns[index]["barberPhoto"],
                            turns[index]["totalServicesPrice"],
                            turns[index]["userChanged"]["rejected"],
                            turns[index]["stylistChanged"]["rejected"],
                          );
                        },
                      )
                    : Center(
                        child: Text("هیچ نوبتی ثبت نشده است",
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
