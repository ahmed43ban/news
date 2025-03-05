import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/ArticlesList.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});
  static const List<String> sources=[
    "ABC News",
    "Aftenposten",
    "ANSA.it",
    "Ary News",
    "Axios",
    "CBC",
    "bein",
    "bein"
  ];

  @override
  Widget build(BuildContext context) {
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
                tabs:sources.map((source)=>Tab(text: source,)).toList()
            ),
            SizedBox(height: 15.h,),
            Expanded(child: TabBarView(
                children: sources.map((source)=>ArticlesList()).toList()
            ))
          ],
        ),
      ),
    );
  }
}
