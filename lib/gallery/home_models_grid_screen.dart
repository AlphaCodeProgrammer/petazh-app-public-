import 'package:flutter/material.dart';
import 'model_grid.dart';
import 'appbar_single_models.dart';

class HOME_MODELS_GRID_SCREEN extends StatelessWidget {
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final titleModelsSelected = routeArgs["categoryText"];
    final modelTypeSelected = routeArgs["modelType"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: APPBAR_SINGLE_MODELS(
            titleModelsSelected != null ? titleModelsSelected : ""),
        elevation: 0.5,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: MODEL_GRID_SCREEN(
            modelTypeSelected != null ? modelTypeSelected : ""),
      ),
    );
  }
}
