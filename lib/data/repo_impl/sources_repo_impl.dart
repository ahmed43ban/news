import 'package:injectable/injectable.dart';
import 'package:news/data/data_source/sources_data_source.dart';
import 'package:news/data/model/sourcesResponse/SourcesResponse.dart';
import 'package:news/repo/sources_repo.dart';
@Injectable(as:SourcesRepo )
class SourcesRepoImpl extends SourcesRepo{
  SourcesDataSource sourcesDataSource;
  @factoryMethod
  SourcesRepoImpl(this.sourcesDataSource);
  @override
  Future<SourcesResponse> getSources(String categoryId, String langCode) {
    return sourcesDataSource.getSources(categoryId, langCode);
  }
  
}