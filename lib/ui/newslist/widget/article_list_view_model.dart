import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/remote/ApiManger.dart';
import 'package:news/data/data_source/article_data_source.dart';
import 'package:news/data/data_source_impl/articles_api_data_source_impl.dart';
import 'package:news/data/repo_impl/articles_repo_impl.dart';
import 'package:news/repo/articles_repo.dart';
import '../../../data/model/ArticlesResponse/Article.dart';
@injectable
class ArticlesListViewModel extends Cubit<ArticlesState>{
 ArticlesRepo articlesRepo;
 @factoryMethod
  ArticlesListViewModel(this.articlesRepo):super(ArticleLoadingState());

  getArticle(String id )async{
    try{
      emit(ArticleLoadingState());
      var response=await articlesRepo.getArticles(id);

      if(response.status=="error"){
        emit(ArticleErrorState(errorMessage: response.message!));
      }else {
        if(response.articles?.isNotEmpty??false){
          emit(ArticleSuccessState(articles: response.articles!));
        }else{
          emit(ArticleEmptyState());
        }
      }
    }catch(e){
      emit(ArticleErrorState(errorMessage:e.toString()));
    }
  }

}


abstract class ArticlesState{}
class ArticleLoadingState extends ArticlesState{}
class ArticleErrorState extends ArticlesState{
  String errorMessage;
  ArticleErrorState({required this.errorMessage});
}
class ArticleSuccessState extends ArticlesState{
  List<Article>articles;
  ArticleSuccessState({required this.articles});
}
class ArticleEmptyState extends ArticlesState{

}