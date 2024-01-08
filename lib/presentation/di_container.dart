
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_articles_app/domain/repositories/article_repository.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  // Dio setup
  getIt.registerSingleton<Dio>(Dio());

  // Repository setup
  getIt.registerLazySingleton<ArticleRepository>(
        () => ArticleRepositoryImpl(getIt<Dio>()),
  );

  // BLoC setup
  getIt.registerFactory<ArticleBloc>(
        () => ArticleBloc(getIt<ArticleRepository>()),
  );
}
