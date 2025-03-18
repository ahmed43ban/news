import 'package:injectable/injectable.dart';
import 'package:news/core/remote/ApiManger.dart';
import 'package:news/data/data_source/article_data_source.dart';
import 'package:news/data/model/ArticlesResponse/ArticlesResponse.dart';
@Injectable(as:ArticleDataSource )
class ArticlesApiDataSourceImpl extends ArticleDataSource{
  ApiManger apiManger;
  @factoryMethod
  ArticlesApiDataSourceImpl(this.apiManger);
  @override
  Future<ArticlesResponse> getArticles(String sourceId) {
    return apiManger.getArticle(sourceId);
  }
  
}