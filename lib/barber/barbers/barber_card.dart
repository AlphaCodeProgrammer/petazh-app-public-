import 'package:flutter/material.dart';
import '../single_barber/barber_details_screen.dart';
import '../../repetitive_widgets/rating_star.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:seo_renderer/seo_renderer.dart';

class BARBER_CARD extends StatefulWidget {
  final String id;
  final String barberName;
  final double rating;
  final String barberPhoto;
  final bool forMen;
  final String barberCity;
  final String barberArea;
  BARBER_CARD(this.id, this.barberName, this.rating, this.barberPhoto,
      this.forMen, this.barberCity, this.barberArea);

  @override
  State<BARBER_CARD> createState() => _BARBER_CARDState();
}

class _BARBER_CARDState extends State<BARBER_CARD> {
  bool onHover = false;
  void barberDetailsRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/barber/${widget.id}", arguments: {
      "id": widget.id,
    });
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Card(
      elevation: onHover == true ? 20 : 2,
      child: InkWell(
        onHover: (isHovering) {
          setState(() {
            onHover = isHovering;
          });
        },
        onTap: () {
          // storeFunc.getBarberDetails(
          //   widget.id,
          // );
          barberDetailsRoute(context);
        },
        child: Column(
          children: [
            SizedBox(
              width: 398,
              height: 200,
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Image.network(
                    widget.barberPhoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: TextRenderer(
                        text: Text(
                          widget.barberName.toPersianDigit(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: RATING_STAR(widget.rating, true, () {}, 1),
                        ),
                        Text(
                          widget.rating.toString().toPersianDigit(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.barberCity},",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 12),
                          ),
                          Text(
                            widget.barberArea,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  child: SizedBox(
                    width: 60,
                    child: Center(
                        child: Image.asset('assets/images/petazh-logo.png')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
