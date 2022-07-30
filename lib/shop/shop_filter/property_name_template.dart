import 'package:flutter/material.dart';
import 'sub_filter_screen.dart';

class PROPERTY_NAME_TEMPLATE extends StatelessWidget {
  String propertyName;
  List<dynamic> selectedProperty;
  Function findFunction;
  PROPERTY_NAME_TEMPLATE(
      this.propertyName, this.selectedProperty, this.findFunction);
  void pushToSubFilter(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/sub-filter");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: InkWell(
            onTap: () {
              findFunction();
              pushToSubFilter(context);
            },
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(propertyName,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "Shabnam",
                                    fontSize: 14)),
                            SizedBox(
                              width: 4,
                            ),
                            selectedProperty.length > 0
                                ? Icon(
                                    Icons.circle,
                                    color: Color.fromARGB(255, 124, 218, 127),
                                    size: 10,
                                  )
                                : SizedBox(
                                    width: 1,
                                  )
                          ],
                        ),
                      ],
                    ),
                    selectedProperty.length > 0
                        ? Container(
                            height: 15,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: selectedProperty.length,
                                itemBuilder: (context, index) {
                                  return selectedProperty.length < 2
                                      ? Text(
                                          "${selectedProperty[index]}",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 10),
                                        )
                                      : Text(
                                          ",${selectedProperty[index]}",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 10),
                                        );
                                }),
                          )
                        : SizedBox(
                            width: 1,
                          )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
