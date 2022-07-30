import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'radio_button_template.dart';

class PROPERTY_LIST extends StatelessWidget {
  String propertyName;
  List<dynamic> subProperty;
  PROPERTY_LIST(this.propertyName, this.subProperty,);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: subProperty.length,
              itemBuilder: (context, index) {
                return RADIO_BUTTON_TEMPLATE(propertyName,subProperty[index]);
              }),
        ),
      ),
    );
  }
}
