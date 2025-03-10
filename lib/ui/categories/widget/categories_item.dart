import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/strings_manger.dart';
import 'package:news/model/CategoryModel.dart';

class CategoriesItem extends StatelessWidget {
  CategoryModel categoryModel;
  final void Function(CategoryModel) onCategoryTap;

  CategoriesItem({required this.categoryModel, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: categoryModel.textDirection,
      child: Container(
        width: double.infinity,
        height: 198,
        padding: REdgeInsets.all(16),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(categoryModel.path), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(24.r)),
        alignment: AlignmentDirectional.bottomEnd,
        child: SizedBox(
          width: 169.w,
          child: ElevatedButton(
              onPressed: () {
                onCategoryTap(categoryModel);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, padding: EdgeInsets.zero),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    StringsManger.view_all.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Theme.of(context).colorScheme.primary,
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
