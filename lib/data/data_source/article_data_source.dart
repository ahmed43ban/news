
import '../model/ArticlesResponse/ArticlesResponse.dart';

abstract class ArticleDataSource{
  Future<ArticlesResponse> getArticles(String sourceId);
}