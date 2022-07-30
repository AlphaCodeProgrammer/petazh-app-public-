import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../providers/store.dart';
import 'package:provider/provider.dart';
import '../../repetitive_widgets/rating_star.dart';

class SELECTED_SERVICE_RATING extends StatelessWidget {
  final String nameService;
  final double price;
  final dynamic floating;
  final double offPrice;
  final String id;
  final bool men;
  final bool ready;
  final double off;
  final dynamic material;
  final double quantity;

  SELECTED_SERVICE_RATING(
    this.nameService,
    this.price,
    this.floating,
    this.offPrice,
    this.id,
    this.men,
    this.ready,
    this.off,
    this.material,
    this.quantity,
  );
  @override
  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context, listen: true);

    return Container(
      width: 180,
      child: InkWell(
        onLongPress: () {
          // barberData.removeService(id);
        },
        child: Card(
            shadowColor: Colors.black,
            elevation: 10,
            color: Colors.white,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    child: Text(
                      nameService,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  material["has"]
                      ? SizedBox(
                          height: 25,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "متریال :",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Shabnam",
                                    fontSize: 12)),
                            TextSpan(
                                text: "${material["materialPrice"]}"
                                    .toPersianDigit()
                                    .seRagham(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "Shabnam",
                                    fontSize: 12)),
                            TextSpan(text: "   "),
                            TextSpan(
                                text: "تومان",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Khandevane",
                                  fontSize: 12,
                                ))
                          ])),
                        )
                      : SizedBox(
                          height: 25,
                        ),
                  floating["has"] == false
                      ? Column(
                          children: [
                            Text("مبلغ کل ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Shabnam",
                                    fontSize: 12)),
                            off > 0
                                ? SizedBox(
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "${price}"
                                                  .toPersianDigit()
                                                  .seRagham(),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontFamily: "Shabnam",
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor: Colors.grey,
                                                  decorationThickness: 3)),
                                          TextSpan(
                                              text: "${offPrice}"
                                                  .toPersianDigit()
                                                  .seRagham(),
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily: "Shabnam",
                                              )),
                                          TextSpan(
                                            text: "  ",
                                          ),
                                        ])),
                                        Text("تومان ",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Khandevane",
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.left,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "${price}"
                                                      .toPersianDigit()
                                                      .seRagham(),
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontFamily: "Shabnam")),
                                              TextSpan(text: " "),
                                            ])),
                                        Text("تومان ",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Khandevane",
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                  ),
                          ],
                        )
                      : Column(
                          children: [
                            Text("مبلغ شناور ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Shabnam",
                                    fontSize: 12)),
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "از".toPersianDigit(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "Shabnam",
                                        )),
                                    TextSpan(
                                        text: "${floating["min"]}"
                                            .toPersianDigit()
                                            .seRagham(),
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Shabnam",
                                        )),
                                    TextSpan(
                                      text: "  ",
                                    ),
                                  ])),
                                  Text("تومان ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Khandevane",
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                  off > 0
                      ? Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    off == 0
                                        ? ""
                                        : " ${off}% ".toPersianDigit(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        )
                      : SizedBox(
                          height: 35,
                        ),
                  quantity > 0
                      ? SizedBox(
                          height: 40,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "${quantity}".toPersianDigit(),
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Shabnam",
                                    fontSize: 12)),
                            TextSpan(
                                text: " نوبت ",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Khandevane",
                                  fontSize: 12,
                                )),
                          ])),
                        )
                      : SizedBox(
                          height: 40,
                        ),
                  RATING_STAR(5, false, (star) {
                    barberData.changeRatingTurnStar(star, id);
                  }, 5),
                ],
              ),
            )),
      ),
    );
  }
}
