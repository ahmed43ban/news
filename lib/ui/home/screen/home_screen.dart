import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/core/assets_manger.dart';
import 'package:news/core/remote/ApiManger.dart';
import 'package:news/core/strings_manger.dart';
import 'package:news/ui/newslist/screen/News_list.dart';
import 'package:news/ui/search/screen/search_screen.dart';

import '../../../data/model/CategoryModel.dart';
import '../../categories/screen/categories_widget.dart';
import '../widget/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isShowNewsList=false;
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: HomeDrawer(onHomeTap: onHomeTap,),
        appBar: AppBar(
          title: Text(selectedCategory!=null?selectedCategory!.title:StringsManger.home.tr()),
          actions: [
            IconButton(onPressed: (){},
                icon: SvgPicture.asset(AssetsManger.search,height: 24.h,width: 24.w,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn),))
          ],
        ),
        body: isShowNewsList?NewsList(category:selectedCategory! ,):CategoriesWidget(onCategoryTap: onCategorySelected,)
      ),
    );
  }

  onCategorySelected(CategoryModel category){
    setState(() {
      isShowNewsList=true;
      selectedCategory = category;
    });
  }
  onHomeTap(){
    setState(() {
      isShowNewsList=false;
      selectedCategory=null;
    });
  }
}
