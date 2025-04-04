import 'package:injectable/injectable.dart';
import 'package:news/data/data_source/article_data_source.dart';
import 'package:news/data/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:news/repo/articles_repo.dart';
@Injectable(as:ArticlesRepo )
class ArticlesRepoImpl extends ArticlesRepo{
  ArticleDataSource articleDataSource;
  @factoryMethod
  ArticlesRepoImpl(this.articleDataSource);
  @override
  Future<ArticlesResponse> getArticles(String sourceId) {
   return articleDataSource.getArticles(sourceId);
  }

}