import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/ui/newslist/widget/ArticleItem.dart';
import 'package:news/ui/newslist/widget/article_list_view_model.dart';

import '../../../core/strings_manger.dart';
import '../../../data/model/sourcesResponse/Source.dart';

class ArticlesList extends StatefulWidget{
  Source source;
  ArticlesList({required this.source});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ArticlesListViewModel()..getArticle(widget.source.id!),
      child: BlocBuilder<ArticlesListViewModel,ArticlesState>(builder: (context, state) {
        if(state is ArticleLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }else if(state is ArticleErrorState){
          return Column(
            children: [
              Text(state.errorMessage,style: Theme.of(context).textTheme.titleMedium,),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text(StringsManger.try_again.tr(),style: Theme.of(context).textTheme.titleMedium,))
            ],);
        }else if(state is ArticleEmptyState){
          return Center(child: Text(StringsManger.no_articles_found.tr(),style: Theme.of(context).textTheme.titleMedium,),);
        }else {
          var articles= (state as ArticleSuccessState).articles;
          return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(article: articles[index],),
              separatorBuilder:  (context, index) => SizedBox(height: 16.h,),
              itemCount: articles.length);
        }
      },),)
      
      
      
      
      /*FutureBuilder(
        future: ApiManger.getArticle(widget.source.id!),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){

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
            return
          }
          return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(article: articles[index],),
              separatorBuilder:  (context, index) => SizedBox(height: 16.h,),
              itemCount: articles.length);
        },)*/;
  }
}
