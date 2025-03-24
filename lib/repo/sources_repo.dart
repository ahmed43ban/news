import 'package:news/data/model/sourcesResponse/SourcesResponse.dart';

abstract class SourcesRepo{
  Future<SourcesResponse>getSources(String categoryId,String langCode);
}