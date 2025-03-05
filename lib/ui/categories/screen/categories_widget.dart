import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/assets_manger.dart';
import '../../../core/strings_manger.dart';
import '../../../model/CategoryModel.dart';
import '../widget/categories_item.dart';
import 'dart:ui' as myText;

class CategoriesWidget extends StatefulWidget {
  final void Function(CategoryModel) onCategoryTap;
  CategoriesWidget({required this.onCategoryTap});
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late ThemeProvider themeProvider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access ThemeProvider after dependencies have been initialized
    themeProvider = Provider.of<ThemeProvider>(context);
  }
  @override
  Widget build(BuildContext context) {
    List<CategoryModel>categories=[
      CategoryModel(title: StringsManger.general.tr(), path:(themeProvider.currentTheme==ThemeMode.light)? AssetsManger.general:AssetsManger.generalDark, id: 'general'),
      CategoryModel(title: StringsManger.business.tr(), path: (themeProvider.currentTheme==ThemeMode.light)? AssetsManger.business:AssetsManger.businessDark, id: 'business',textDirection: myText.TextDirection.rtl),
      CategoryModel(title: StringsManger.sports.tr(), path: (themeProvider.currentTheme==ThemeMode.light)? AssetsManger.sports:AssetsManger.sportsDark, id: 'sports'),
      CategoryModel(title: StringsManger.technology.tr(), path: (themeProvider.currentTheme==ThemeMode.light)? AssetsManger.technology:AssetsManger.technologyDark, id: 'technology',textDirection: myText.TextDirection.rtl),
      CategoryModel(title: StringsManger.health.tr(), path: (themeProvider.currentTheme==ThemeMode.light)? AssetsManger.health:AssetsManger.healthDark, id: 'health'),
      CategoryModel(title: StringsManger.entertainment.tr(), path: (themeProvider.currentTheme==ThemeMode.light)? AssetsManger.entertainment:AssetsManger.entertainmentDark, id: 'entertainment',textDirection: myText.TextDirection.rtl),
      CategoryModel(title: StringsManger.science.tr(), path: (themeProvider.currentTheme==ThemeMode.light)? AssetsManger.science:AssetsManger.scienceDark, id: 'science'),
    ];
    return Padding(
      padding:  REdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringsManger.good_morning.tr(),style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 16.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CategoriesItem(
                  onCategoryTap: widget.onCategoryTap,
                  categoryModel: categories[index],),
                separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                itemCount: categories.length),
          )
        ],
      ),
    );
  }

}
