import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/strings_manger.dart';
import 'package:news/ui/home/screen/home_screen.dart';
import 'package:news/ui/search/widget/search_view_model.dart';
import 'package:provider/provider.dart';

import '../../newslist/widget/ArticleItem.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "search";

  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  SearchViewModel? viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<SearchViewModel>(context, listen: false);
    controller.addListener(onTextChanged);
  }

  void onTextChanged() {
    setState(() {});
    if (viewModel != null && controller.text.isNotEmpty) {
      viewModel!.getArticles(controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<SearchViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                toolbarHeight: 88.h,
                leading: SizedBox(),
                leadingWidth: 0,
                title: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: StringsManger.search.tr(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary)),
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (controller.text.isEmpty) {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.routeName);
                          }
                          controller
                              .clear(); // Clear the search input when the icon is clicked
                          viewModel?.getArticles("");
                        },
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )),
                ),
              ),
              controller.text.isEmpty
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: Text(StringsManger.wait_search.tr(),
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                    )
                  : Consumer<SearchViewModel>(
                      builder: (context, viewModel, child) {
                        if (viewModel.showLoading) {
                          return SliverFillRemaining(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (viewModel.errorMessage != null) {
                          return SliverList(
                            delegate: SliverChildListDelegate([
                              Column(
                                children: [
                                  Text(
                                    viewModel.errorMessage!,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      child: Text(
                                        StringsManger.try_again.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ))
                                ],
                              )
                            ]),
                          );
                        } else if (viewModel.articles.isEmpty) {
                          return SliverFillRemaining(
                            child: Center(
                              child: Text(
                                StringsManger.no_articles_found.tr(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          );
                        }
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Padding(
                                padding: REdgeInsets.only(
                                    bottom: 16, right: 16, left: 16),
                                child: ArticleItem(
                                  article: viewModel.articles[index],
                                ),
                              );
                            },
                            childCount: viewModel.articles.length,
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.removeListener(onTextChanged);
    controller.dispose();
    super.dispose();
  }
}
