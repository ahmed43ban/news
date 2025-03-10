import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/strings_manger.dart';
import 'package:news/model/CategoryModel.dart';
import 'package:news/ui/newslist/screen/news_list_view_model.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_NewsListState) => NewsListViewModel()
        ..getSources(widget.category.id, context.locale.languageCode),
      child: Consumer<NewsListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.showLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
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
          }
          return DefaultTabController(
            length: viewModel.sources.length,
            child: Padding(
              padding: REdgeInsetsDirectional.only(top: 16, end: 16, start: 16),
              child: Column(
                children: [
                  TabBar(
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 14.sp),
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      labelColor: Theme.of(context).colorScheme.primary,
                      indicatorColor: Theme.of(context).colorScheme.primary,
                      dividerHeight: 0,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: viewModel.sources
                          .map((source) => Tab(
                                text: source.name,
                              ))
                          .toList()),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                      child: TabBarView(
                          children: viewModel.sources
                              .map((source) => ArticlesList(
                                    source: source,
                                  ))
                              .toList()))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
