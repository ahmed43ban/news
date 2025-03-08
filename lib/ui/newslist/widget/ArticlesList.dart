import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/remote/ApiManger.dart';
import 'package:news/model/sourcesResponse/Source.dart';
import 'package:news/ui/newslist/widget/ArticleItem.dart';

import '../../../core/strings_manger.dart';

class ArticlesList extends StatefulWidget{
  Source source;
  ArticlesList({required this.source});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManger.getArticle(widget.source.id!),
        builder: (context, snapshot) {
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
          var articles=response?.articles??[];
          if(articles.isEmpty){
            return Center(child: Text(StringsManger.no_articles_found.tr(),style: Theme.of(context).textTheme.titleMedium,),);
          }
          return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(article: articles[index],),
              separatorBuilder:  (context, index) => SizedBox(height: 16.h,),
              itemCount: articles.length);
        },);
  }
}
