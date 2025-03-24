// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_source/article_data_source.dart' as _i647;
import '../../data/data_source/sources_data_source.dart' as _i748;
import '../../data/data_source_impl/articles_api_data_source_impl.dart'
    as _i677;
import '../../data/data_source_impl/sources_api_data_source_impl.dart' as _i802;
import '../../data/repo_impl/articles_repo_impl.dart' as _i348;
import '../../data/repo_impl/sources_repo_impl.dart' as _i564;
import '../../repo/articles_repo.dart' as _i981;
import '../../repo/sources_repo.dart' as _i255;
import '../../ui/newslist/screen/news_list_view_model.dart' as _i939;
import '../../ui/newslist/widget/article_list_view_model.dart' as _i235;
import '../remote/ApiManger.dart' as _i851;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i851.ApiManger>(() => _i851.ApiManger());
    gh.factory<_i748.SourcesDataSource>(
        () => _i802.SourcesApiDataSourceImpl(gh<_i851.ApiManger>()));
    gh.factory<_i647.ArticleDataSource>(
        () => _i677.ArticlesApiDataSourceImpl(gh<_i851.ApiManger>()));
    gh.factory<_i981.ArticlesRepo>(
        () => _i348.ArticlesRepoImpl(gh<_i647.ArticleDataSource>()));
    gh.factory<_i255.SourcesRepo>(
        () => _i564.SourcesRepoImpl(gh<_i748.SourcesDataSource>()));
    gh.factory<_i235.ArticlesListViewModel>(
        () => _i235.ArticlesListViewModel(gh<_i981.ArticlesRepo>()));
    gh.factory<_i939.NewsListViewModel>(
        () => _i939.NewsListViewModel(gh<_i255.SourcesRepo>()));
    return this;
  }
}
