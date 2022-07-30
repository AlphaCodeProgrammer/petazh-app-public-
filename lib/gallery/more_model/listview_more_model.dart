import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../providers/store.dart';
import './more_model_images.dart';
import 'package:flutter/gestures.dart';

class LISTVIEW_MORE_MODEL extends StatefulWidget {
  @override
  State<LISTVIEW_MORE_MODEL> createState() => _LISTVIEW_MORE_MODELState();
}

class _LISTVIEW_MORE_MODELState extends State<LISTVIEW_MORE_MODEL> {
  final String navbarName = "جزییات نوبت";

  @override
  Widget build(BuildContext context) {
    final moreModelData = Provider.of<Barbers>(context).moreImagesModel;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: AspectRatio(
            aspectRatio: 1,
            // width: MediaQuery.of(context).size.height/1.3,
            // height: MediaQuery.of(context).size.height/1.3,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: moreModelData.length,
                  itemBuilder: (context, index) {
                    return MORE_MODEL_IMAGES(
                      moreModelData[index],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
