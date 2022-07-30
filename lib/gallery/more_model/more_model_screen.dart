import 'package:flutter/material.dart';

import '../../repetitive_widgets/simple_appbar.dart';
import './listview_more_model.dart';

class MORE_MODEL_SCREEN extends StatelessWidget {
  final navbarName = "";
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(navbarName ),
          elevation: 0.5,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: LISTVIEW_MORE_MODEL(),
        ));
  }
}
