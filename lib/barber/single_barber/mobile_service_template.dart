import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../providers/store.dart';
import 'package:provider/provider.dart';
import 'package:seo_renderer/seo_renderer.dart';
class MOBILE_SERVICE_TEMPLATE extends StatefulWidget {
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

  MOBILE_SERVICE_TEMPLATE(
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
  State<MOBILE_SERVICE_TEMPLATE> createState() =>
      _MOBILE_SERVICE_TEMPLATEState();
}

class _MOBILE_SERVICE_TEMPLATEState extends State<MOBILE_SERVICE_TEMPLATE> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context, listen: true);

    return Container(
      child: InkWell(
        onHover: (isHover) {
          setState(() {
            isHovering = isHover;
          });
        },
        onTap: () {
          barberData.addService({
            "id": widget.id,
            "floating": widget.floating,
            "material": {
              "has": widget.material["has"],
              "materialPrice": widget.material["materialPrice"]
            },
            "men": widget.men,
            "name": widget.nameService,
            "off": widget.off,
            "offPrice": widget.offPrice,
            "price": widget.price,
            "quantity": widget.quantity,
            "ready": widget.ready
          });
        },
        onLongPress: () {
          barberData.removeService(widget.id);
        },
        child: Card(
            shadowColor: Colors.black,
            elevation: isHovering == true ? 20 : 5,
            child: Container(
              decoration: BoxDecoration(
                  gradient: widget.quantity > 0
                      ? LinearGradient(
                          colors: [
                            const Color(0xFF00CCFF),
                            Color.fromARGB(255, 81, 121, 241),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )
                      : LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                        )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: TextRenderer(
                          text: Text(
                            widget.nameService,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.quantity > 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      widget.quantity > 0
                          ? SizedBox(
                              height: 40,
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "${widget.quantity}".toPersianDigit(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Shabnam",
                                        fontSize: 12)),
                                TextSpan(
                                    text: " نوبت ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Khandevane",
                                      fontSize: 12,
                                    )),
                              ])),
                            )
                          : SizedBox(
                              height: 40,
                            ),
                    ],
                  ),
                  Column(
                    children: [
                      widget.material["has"]
                          ? SizedBox(
                              height: 25,
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "متریال :",
                                    style: TextStyle(
                                        color: widget.quantity > 0
                                            ? Colors.white
                                            : Colors.black,
                                        fontFamily: "Shabnam",
                                        fontSize: 12)),
                                TextSpan(
                                    text: "${widget.material["materialPrice"]}"
                                        .toPersianDigit()
                                        .seRagham(),
                                    style: TextStyle(
                                        color: widget.quantity > 0
                                            ? Colors.white
                                            : Colors.blue,
                                        fontFamily: "Shabnam",
                                        fontSize: 12)),
                                TextSpan(text: "   "),
                                TextSpan(
                                    text: "تومان",
                                    style: TextStyle(
                                      color: widget.quantity > 0
                                          ? Colors.black
                                          : Colors.grey,
                                      fontFamily: "Khandevane",
                                      fontSize: 12,
                                    ))
                              ])),
                            )
                          : SizedBox(
                              height: 25,
                            ),
                      widget.floating["has"] == false
                          ? Column(
                              children: [
                                Text("مبلغ کل ",
                                    style: TextStyle(
                                        color: widget.quantity > 0
                                            ? Colors.white
                                            : Colors.black,
                                        fontFamily: "Shabnam",
                                        fontSize: 12)),
                                widget.off > 0
                                    ? SizedBox(
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: "${widget.price}"
                                                      .toPersianDigit()
                                                      .seRagham(),
                                                  style: TextStyle(
                                                      color: widget.quantity > 0
                                                          ? Colors.white
                                                          : Colors.grey,
                                                      fontSize: 12,
                                                      fontFamily: "Shabnam",
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Colors.grey,
                                                      decorationThickness: 3)),
                                              TextSpan(
                                                  text: "${widget.offPrice}"
                                                      .toPersianDigit()
                                                      .seRagham(),
                                                  style: TextStyle(
                                                    color: widget.quantity > 0
                                                        ? Colors.white
                                                        : Colors.blue,
                                                    fontFamily: "Shabnam",
                                                  )),
                                              TextSpan(
                                                text: "  ",
                                              ),
                                            ])),
                                            Text("تومان ",
                                                style: TextStyle(
                                                  color: widget.quantity > 0
                                                      ? Colors.black
                                                      : Colors.grey,
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
                                                      text: "${widget.price}"
                                                          .toPersianDigit()
                                                          .seRagham(),
                                                      style: TextStyle(
                                                          color:
                                                              widget.quantity >
                                                                      0
                                                                  ? Colors.white
                                                                  : Colors.blue,
                                                          fontFamily:
                                                              "Shabnam")),
                                                  TextSpan(text: " "),
                                                ])),
                                            Text("تومان ",
                                                style: TextStyle(
                                                  color: widget.quantity > 0
                                                      ? Colors.grey
                                                      : Colors.grey,
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
                                        color: widget.quantity > 0
                                            ? Colors.white
                                            : Colors.black,
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
                                            text: "از ".toPersianDigit(),
                                            style: TextStyle(
                                              color: widget.quantity > 0
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12,
                                              fontFamily: "Shabnam",
                                            )),
                                        TextSpan(
                                            text: "${widget.floating["min"]}"
                                                .toPersianDigit()
                                                .seRagham(),
                                            style: TextStyle(
                                              color: widget.quantity > 0
                                                  ? Colors.white
                                                  : Colors.blue,
                                              fontFamily: "Shabnam",
                                            )),
                                        widget.floating["max"] >
                                                widget.floating["min"]
                                            ? TextSpan(
                                                text:
                                                    " الی ${widget.floating["max"].toString().toPersianDigit().seRagham()}  ",
                                                style: TextStyle(
                                                  color: widget.quantity > 0
                                                      ? Colors.white
                                                      : Colors.blue,
                                                  fontFamily: "Shabnam",
                                                ))
                                            : TextSpan(
                                                text: "  ",
                                              ),
                                      ])),
                                      Text("تومان ",
                                          style: TextStyle(
                                            color: widget.quantity > 0
                                                ? Colors.black
                                                : Colors.grey,
                                            fontFamily: "Khandevane",
                                            fontSize: 12,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                      widget.off > 0
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: ClipOval(
                                    child: Container(
                                      color: Colors.red,
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        widget.off == 0
                                            ? ""
                                            : " ${widget.off}% "
                                                .toPersianDigit(),
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
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
