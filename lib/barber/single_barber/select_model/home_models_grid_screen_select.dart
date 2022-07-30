import 'package:flutter/material.dart';
import 'model_grid_select.dart';
import 'appbar_single_models_select.dart';
import './request_button_models.dart';

class HOME_MODELS_GRID_SCREEN_SELECT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final titleModelsSelected = routeArgs["categoryText"];
    final modelTypeSelected = routeArgs["modelType"];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: APPBAR_SINGLE_MODELS_SELECT(
              titleModelsSelected != null ? titleModelsSelected : ""),
          elevation: 0.5,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                child: MODEL_GRID_SCREEN_SELECT(
                    modelTypeSelected != null ? modelTypeSelected : ""),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(child: REQUEST_BUTTON_MODELS()),
            )
          ],
        ));
  }
}
