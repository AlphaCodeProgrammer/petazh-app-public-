import 'package:flutter/material.dart';
import 'single_model_select.dart';
import '../../../providers/store.dart';
import 'package:provider/provider.dart';

class MODEL_GRID_SCREEN_SELECT extends StatefulWidget {
  final String modelType;
  MODEL_GRID_SCREEN_SELECT(this.modelType);

  @override
  State<MODEL_GRID_SCREEN_SELECT> createState() =>
      _MODEL_GRID_SCREEN_SELECTState();
}

class _MODEL_GRID_SCREEN_SELECTState extends State<MODEL_GRID_SCREEN_SELECT> {
  var _isInitModel = true;
  void didChangeDependencies() {
    if (_isInitModel) {
      Provider.of<Barbers>(context).getModels(widget.modelType);
    }
    _isInitModel = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final modelsData = Provider.of<Barbers>(context);
    final models = modelsData.models;
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 1.1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemCount: models.length,
        itemBuilder: (BuildContext ctx, index) {
          return SINGLE_MODEL(
              models[index].id,
              models[index].sideImage[0],
              models[index].name,
              models[index].type,
              models[index].code,
              models[index].forMen);
        },
      ),
    );
  }
}
