import 'package:flutter/material.dart';
import 'home_models_grid_screen_select.dart';

class TYPE_GALLERY extends StatelessWidget {
  final String categoryText;
  final String categoryImage;
  final String categoryRoute;
  final String modelType;

  TYPE_GALLERY(this.categoryText, this.categoryImage, this.categoryRoute,
      this.modelType);

  void selectCategoryModel(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/models-select", arguments: {
      "categoryText": categoryText,
      "image": categoryImage,
      "modelType": modelType
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          width: 400,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => selectCategoryModel(context),
                    child: Image.network(
                      categoryImage,
                      fit: BoxFit.cover,
                      width: 400,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Color.fromRGBO(9, 0, 0, 0.6),
                            child: Text(
                              categoryText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
