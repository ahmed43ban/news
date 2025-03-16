import 'package:news/data/model/sourcesResponse/SourcesResponse.dart';

abstract class SourcesDataSource{
  Future<SourcesResponse> getSources(String categoryId);
}