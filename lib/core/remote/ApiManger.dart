import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/remote/ApiConstants.dart';
import 'package:news/model/sourcesResponse/SourcesResponse.dart';

class ApiManger{
 static Future<SourcesResponse?> getSources(String category,String langCode)async{
    Uri uri = Uri.https(baseUrl,"v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":category,
      "language":langCode
    });
     try{
       var response=await http.get(uri);
       Map<String,dynamic>json= jsonDecode(response.body);
       SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
       return sourcesResponse;
     }catch(e){
       print(e.toString());
     }
  }
}