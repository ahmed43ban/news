import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/remote/ApiManger.dart';
import 'package:news/core/strings_manger.dart';
import 'package:news/model/CategoryModel.dart';

import '../widget/ArticlesList.dart';

class NewsList extends StatefulWidget {
  CategoryModel category;
   NewsList({required this.category});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManger.getSources(widget.category.id, context.locale.languageCode),
        builder:(context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text(StringsManger.try_again.tr(),style: Theme.of(context).textTheme.titleMedium,))
              ],);
          }
          var response =snapshot.data;
          if(response?.status=="error"){
            return Column(
              children: [
                Text(response?.message??""),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text(StringsManger.try_again.tr(),style: Theme.of(context).textTheme.titleMedium,))
              ],);
          }
          var sources=response?.sources??[];
          return DefaultTabController(
              length: sources.length,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 16,
                    end: 16,
                    start: 16
                ),
                child: Column(
                  children: [
                    TabBar(
                        unselectedLabelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14.sp),
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                        labelColor: Theme.of(context).colorScheme.primary,
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        dividerHeight: 0,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        tabs:sources.map((source)=>Tab(text: source.name,)).toList()
                    ),
                    SizedBox(height: 15.h,),
                    Expanded(child: TabBarView(
                        children: sources.map((source)=>ArticlesList(source: source,)).toList()
                    ))
                  ],
                ),
              ),
            );

        }, );
  }
}
