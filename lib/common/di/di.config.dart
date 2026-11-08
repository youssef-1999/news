// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app/features/news/data/data_source/news_data_source.dart'
    as _i283;
import 'package:news_app/features/news/data/data_source/remote/news_remote_data_source.dart'
    as _i768;
import 'package:news_app/features/news/data/repository/news_repository_impl.dart'
    as _i1019;
import 'package:news_app/features/news/domain/repository/news_repository.dart'
    as _i299;
import 'package:news_app/features/news/domain/use_case/get_articles_use_case.dart'
    as _i706;
import 'package:news_app/features/news/domain/use_case/get_sources_use_case.dart'
    as _i500;
import 'package:news_app/features/news/presentation/cubit/news_cubit.dart'
    as _i472;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i283.NewsDataSource>(() => _i768.NewsRemoteDataSource());
    gh.factory<_i299.NewsRepository>(
      () => _i1019.NewsRepositoryImpl(gh<_i283.NewsDataSource>()),
    );
    gh.factory<_i706.GetArticlesUseCase>(
      () => _i706.GetArticlesUseCase(gh<_i299.NewsRepository>()),
    );
    gh.factory<_i500.GetSourcesUseCase>(
      () => _i500.GetSourcesUseCase(gh<_i299.NewsRepository>()),
    );
    gh.factory<_i472.NewsCubit>(
      () => _i472.NewsCubit(
        gh<_i500.GetSourcesUseCase>(),
        gh<_i706.GetArticlesUseCase>(),
      ),
    );
    return this;
  }
}
