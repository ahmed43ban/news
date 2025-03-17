import 'package:news/core/remote/ApiManger.dart';
import 'package:news/data/data_source/sources_data_source.dart';
import 'package:news/data/model/sourcesResponse/SourcesResponse.dart';

class SourcesApiDataSourceImpl extends SourcesDataSource{
  ApiManger apiManger;
  SourcesApiDataSourceImpl(this.apiManger);

  @override
  Future<SourcesResponse> getSources(String categoryId, String langCode) {
    return apiManger.getSources(categoryId, langCode);
  }}