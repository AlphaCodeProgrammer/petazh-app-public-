import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import './ann-template.dart';
import '../../repetitive_widgets/simple_appbar.dart';

class ANN_SCREEN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final anns = Provider.of<Barbers>(context).anns;
    final navbarName = "اعلانات";
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR(navbarName),
      ),
      body: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: anns.length,
          itemBuilder: (context, index) {
            return ANN_TEMPLATE(
              anns[index]["_id"],
              anns[index]["title"],
              anns[index]["description"],
              anns[index]["annPostDate"],
              anns[index]["didRead"],
            );
          }),
    );
  }
}
