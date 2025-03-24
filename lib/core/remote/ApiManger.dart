import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news/core/remote/ApiConstants.dart';
import '../../data/model/ArticlesResponse/ArticlesResponse.dart';
import '../../data/model/sourcesResponse/SourcesResponse.dart';
@singleton
class ApiManger{
  Future<SourcesResponse> getSources(String category,String langCode)async{
    Uri uri = Uri.https(baseUrl,"v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":category,
      "language":langCode
    });
    var response=await http.get(uri);
    Map<String,dynamic>json= jsonDecode(response.body);
    SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
   Future<ArticlesResponse> getArticle(String source)async{
    Uri url=Uri.https(baseUrl,"v2/everything",{
      "apikey":apiKey,
      "sources": source
    });
    var response=await http.get(url);
    Map<String,dynamic> json=jsonDecode(response.body);
    ArticlesResponse articlesResponse=ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
  Future<ArticlesResponse> searchWay(String text)async{
    //https://newsapi.org/v2/everything?q=mass&apiKey=7f1cc15c543a4f8cbebb811ef8787e28&pageSize=20
    Uri url = Uri.https(
        baseUrl, "v2/everything", {"apikey": apiKey, "q": text,"pageSize":20.toString()});
    var response = await http.get(url);
    Map<String,dynamic>json= jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}