import 'package:flutter/material.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'type_gallery_select.dart';
import '../../../data/static.dart';

class HOME_PAGE_GALLERY_SCREEN_SELECT extends StatelessWidget {
  final bool isMan = true;
  final String navbarName = "دسته بندی را انتخاب کنید ";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(navbarName),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              childAspectRatio: 1.3,
              crossAxisSpacing: 25,
              mainAxisSpacing: 5),
          children: isMan
              ? maleGenderGalleryData
                  .map((galeryData) => TYPE_GALLERY(
                      galeryData.categoryText,
                      galeryData.categoryImage,
                      galeryData.categoryRoute,
                      galeryData.modelType))
                  .toList()
              : femaleGenderGalleryData
                  .map((galeryData) => TYPE_GALLERY(
                      galeryData.categoryText,
                      galeryData.categoryImage,
                      galeryData.categoryRoute,
                      galeryData.modelType))
                  .toList(),
        ),
      ),
    );
  }
}
