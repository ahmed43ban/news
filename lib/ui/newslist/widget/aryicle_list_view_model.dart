import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/remote/ApiManger.dart';
import '../../../data/model/ArticlesResponse/Article.dart';

class ArticlesListViewModel extends Cubit<ArticlesState>{
  ArticlesListViewModel():super(ArticleLoadingState());

  getArticle(String id )async{
    try{
      emit(ArticleLoadingState());
      var response=await ApiManger.getArticle(id);

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