import 'package:flutter/material.dart';
import './type_gallery.dart';
import '../data/static.dart';
import 'package:provider/provider.dart';
import '../providers/store.dart';

class HOME_PAGE_GALLERY_SCREEN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Barbers>(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: MediaQuery.of(context).size.width > 700
            ? GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                children: userData.user[0]["isMan"]
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
              )
            : userData.user[0]["isMan"]
                ? Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: maleGenderGalleryData.length,
                      itemBuilder: (context, index) {
                        return TYPE_GALLERY(
                            maleGenderGalleryData[index].categoryText,
                            maleGenderGalleryData[index].categoryImage,
                            maleGenderGalleryData[index].categoryRoute,
                            maleGenderGalleryData[index].modelType);
                      }),
                )
                : Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: femaleGenderGalleryData.length,
                      itemBuilder: (context, index) {
                        return TYPE_GALLERY(
                            femaleGenderGalleryData[index].categoryText,
                            femaleGenderGalleryData[index].categoryImage,
                            femaleGenderGalleryData[index].categoryRoute,
                            femaleGenderGalleryData[index].modelType);
                      }),
                ),
      ),
    );
  }
}
