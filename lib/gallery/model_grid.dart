import 'package:flutter/material.dart';
import './single_model.dart';
import '../providers/store.dart';
import 'package:provider/provider.dart';

class MODEL_GRID_SCREEN extends StatefulWidget {
  final String modelType;
  MODEL_GRID_SCREEN(this.modelType);

  State<MODEL_GRID_SCREEN> createState() => _MODEL_GRID_SCREENState();
}

class _MODEL_GRID_SCREENState extends State<MODEL_GRID_SCREEN> {
  var _isInitModel = true;
  void didChangeDependencies() {
    if (_isInitModel) {
      Provider.of<Barbers>(context).getModels(widget.modelType);
    }
    _isInitModel = false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final modelsData = Provider.of<Barbers>(context);
    final models = modelsData.models;
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisExtent: 400,
                childAspectRatio: 1.1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),
            itemCount: models.length,
            itemBuilder: (BuildContext ctx, index) {
              return SINGLE_MODEL(
                  models[index].id,
                  models[index].sideImage,
                  models[index].name,
                  models[index].type,
                  models[index].forMen,
                  models[index].code,
                  models[index].isFavoriteModel);
            },
          ),
        ),
      ),
    );
  }
}
