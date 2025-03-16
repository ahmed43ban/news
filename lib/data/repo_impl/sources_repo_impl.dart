import 'package:news/data/data_source/sources_data_source.dart';
import 'package:news/data/model/sourcesResponse/SourcesResponse.dart';
import 'package:news/repo/sources_repo.dart';

class SourcesRepoImpl extends SourcesRepo{
  SourcesDataSource sourcesDataSource;
  SourcesRepoImpl(this.sourcesDataSource);
  @override
  Future<SourcesResponse> getSources(String categoryId, String langCode) {
    return sourcesDataSource.getSources(categoryId, langCode);
  }
  
}