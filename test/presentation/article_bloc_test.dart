import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_articles_app/core/network/connectivity_service.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/domain/usecases/article_use_case.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_bloc.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_state.dart';

class MockArticleUseCase extends Mock implements ArticleUseCase {}

class MockConnectivityService extends Mock implements ConnectivityService {}


void main() {
  group('ArticleBloc', () {
    late ArticleBloc articleCubit;
    late MockArticleUseCase mockArticleUseCase;
    late MockConnectivityService mockConnectionUtil;

    const payloadRequest = {'api-key': "sample-key"};
    final article = [Result(title: "Article one", id: 101)];
    final responseData = {
      'results': article,
      'status': "OK",
      'numResults': 10,
      'copyright': "@"
    };

    setUp(() {
      mockArticleUseCase = MockArticleUseCase();
      mockConnectionUtil = MockConnectivityService();

      GetIt.I.registerSingleton<ConnectivityService>(mockConnectionUtil);
      GetIt.I.registerSingleton<ArticleUseCase>(mockArticleUseCase);

      articleCubit = ArticleBloc(mockArticleUseCase);
    });

    tearDown(() {
      GetIt.I.reset();
      articleCubit.close();
    });

    test('initial state should be empty', () {
      expect(articleCubit.state, ArticleInitial());
    });


    blocTest<ArticleBloc, ArticleState>(
        'emits [ArticleLoading, ArticleLoaded] when fetchArticles is successful',
        build: () {
          when(mockConnectionUtil.isConnected()).thenAnswer((_) async => true);

          when(mockArticleUseCase
              .execute(payloadRequest)
              .then((_) async => responseData));
          return articleCubit;
        },
        act: (cubit) => cubit.fetchArticles(),
        //wait: const Duration(milliseconds: 100),
        expect: () => [
              ArticleLoading(),
              ArticleLoaded(articles: article),
            ]);

    blocTest<ArticleBloc, ArticleState>(
        'emits [ArticleLoading, ArticleError] when fetchArticles fails',
        build: () {
          when(mockConnectionUtil.isConnected()).thenAnswer((_) async => true);

          when(mockArticleUseCase.execute(payloadRequest))
              .thenThrow(Exception('Test error'));
          return articleCubit;
        },
        act: (cubit) => cubit.fetchArticles(),
        expect: () => [
              ArticleLoading(),
              const ArticleError(message: 'Failed to load articles'),
            ]);

    blocTest<ArticleBloc, ArticleState>(
        'emits [ArticleError] when no internet connection',
        build: () {
          when(mockConnectionUtil.isConnected()).thenAnswer((_) async => false);

          return articleCubit;
        },
        act: (cubit) => cubit.fetchArticles(),
        expect: () => [
              ArticleNoNetwork(),
            ]);
  });
}
