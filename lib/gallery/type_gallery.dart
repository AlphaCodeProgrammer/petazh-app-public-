import 'package:flutter/material.dart';
import 'home_models_grid_screen.dart';

class TYPE_GALLERY extends StatelessWidget {
  final String categoryText;
  final String categoryImage;
  final String modelType;

  final String categoryRoute;
  TYPE_GALLERY(this.categoryText, this.categoryImage, this.categoryRoute,
      this.modelType);

  void selectCategoryModel(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/models", arguments: {
      "categoryText": categoryText,
      "image": categoryImage,
      "modelType": modelType
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width > 700
                ? MediaQuery.of(context).size.height / 1.2
                : MediaQuery.of(context).size.height / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: InkWell(
                onTap: () => selectCategoryModel(context),
                child: Image.network(
                  categoryImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Color.fromRGBO(9, 0, 0, 0.6),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          categoryText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
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
    );
  }
}
