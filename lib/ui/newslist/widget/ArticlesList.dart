import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/model/sourcesResponse/Source.dart';
import 'package:news/ui/newslist/widget/ArticleItem.dart';
import 'package:news/ui/newslist/widget/articles_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/strings_manger.dart';

class ArticlesList extends StatefulWidget {
  Source source;

  ArticlesList({required this.source});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticlesViewModel()..getArticles(widget.source.id!),
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.showLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      StringsManger.try_again.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ))
              ],
            );
          } else if (viewModel.articles.isEmpty) {
            return Center(
              child: Text(
                StringsManger.no_articles_found.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                    article: viewModel.articles[index],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 16.h,
                  ),
              itemCount: viewModel.articles.length);
        },
      ),
    );
  }
}
