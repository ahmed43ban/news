import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/remote/ApiManger.dart';
import 'package:news/repo/sources_repo.dart';
import '../../../data/model/sourcesResponse/Source.dart';

class NewsListViewModel extends Cubit<NewsStates>{
  SourcesRepo sourcesRepo;
  NewsListViewModel(this.sourcesRepo):super(NewsLoadingState());

  getSources(String category , String langCode)async{
    try{
      emit(NewsLoadingState());
      var response=await sourcesRepo.getSources(category, langCode);

      if(response.status=="error"){
        emit(NewsErrorState(errorMessage: response.message!));
      }else {
        emit(NewsSuccessState(sources: response.sources??[]));
      }
    }catch(e){
      emit(NewsErrorState(errorMessage:e.toString()));
    }
  }

}


abstract class NewsStates{}
class NewsLoadingState extends NewsStates{}
class NewsErrorState extends NewsStates{
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsStates{
  List<Source>sources;
  NewsSuccessState({required this.sources});
}