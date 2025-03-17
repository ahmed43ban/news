import 'package:flutter/material.dart';

import '../../../core/remote/ApiManger.dart';
import '../../../data/model/ArticlesResponse/Article.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article> articles = [];
  String? errorMessage;
  bool showLoading = false;

  getArticles(String source) async {
    try {
      showLoading = true;
      var response = await ApiManger.getArticle(source);
      if (response.status == "error") {
        errorMessage = response.message;
      } else {
        articles = response.articles ?? [];
      }
      showLoading = false;
    } catch (e) {
      errorMessage = e.toString();
      showLoading = false;
    }
    notifyListeners();
  }
}
