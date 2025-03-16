import 'package:news/data/model/ArticlesResponse/ArticlesResponse.dart';

abstract class ArticlesRepo{
 Future<ArticlesResponse> getArticles(String sourceId);
}