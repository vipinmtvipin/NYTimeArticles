import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:ny_articles_app/core/network/connectivity_service.dart';
import 'package:ny_articles_app/core/utils/common_util.dart';
import 'package:ny_articles_app/core/utils/size_utils.dart';
import 'package:ny_articles_app/data/api/api_service.dart';
import 'package:ny_articles_app/data/repositories/article_repository_iml.dart';
import 'package:ny_articles_app/domain/repositories/article_repository.dart';
import 'package:ny_articles_app/domain/usecases/article_use_case.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_bloc.dart';


final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // BLoC setup
  getIt.registerFactory<ArticleBloc>(
        () => ArticleBloc(getIt<ArticleUseCase>()),
  );
  // Use cases
  getIt.registerLazySingleton(
        () => ArticleUseCase(getIt()),
  );

  // Repository setup
  getIt.registerLazySingleton<ArticleRepository>(
        () => ArticleRepositoryIml(),
  );

  // Dio setup
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton(()=> ApiService());

  // Utils setup
  getIt.registerLazySingleton(()=> ConnectivityService());
  getIt.registerLazySingleton(()=> CommonUtil());
  getIt.registerLazySingleton(()=> ResponsiveSize());


}

void clearGetItObjects(){
  // Clear all objects
  getIt.reset();
}

