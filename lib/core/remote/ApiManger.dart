import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/remote/ApiConstants.dart';
import 'package:news/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:news/model/sourcesResponse/SourcesResponse.dart';

class ApiManger {
  static Future<SourcesResponse?> getSources(
      String category, String langCode) async {
    Uri uri = Uri.https(baseUrl, "v2/top-headlines/sources",
        {"apiKey": apiKey, "category": category, "language": langCode});
    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticle(String source) async {
    Uri url = Uri.https(
        baseUrl, "v2/everything", {"apikey": apiKey, "sources": source});
    var response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}
