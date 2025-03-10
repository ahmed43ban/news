import 'package:flutter/material.dart';
import 'package:news/core/remote/ApiManger.dart';
import 'package:news/model/sourcesResponse/Source.dart';

class NewsListViewModel extends ChangeNotifier{
  List<Source>sources=[];
  String? errorMessage;
  bool showLoading=false;
   getSources(String categoryId,String lang)async{
    try{
      showLoading=true;
      var response=await ApiManger.getSources(categoryId, lang);
      if(response?.status=="error"){
        errorMessage=response?.message;
      }else{
        sources = response?.sources??[];
      }
      showLoading=false;
    }catch(e){
      errorMessage=e.toString();
      showLoading=false;
    }
    notifyListeners();
  }
}