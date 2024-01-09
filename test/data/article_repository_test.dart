
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_articles_app/data/repositories/article_repository_iml.dart';
import 'package:ny_articles_app/domain/repositories/article_repository.dart';


class MockDio extends Mock implements Dio {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ArticleRepository', () {
    late ArticleRepository articleRepository;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      articleRepository = ArticleRepositoryIml();
    });

    test('getArticles returns a list of articles', () async {
      const responseData = {'results':[{'type': 'Article','published_date': "2024-01-05" }], 'status': "OK",'numResults': 10,'copyright': ""};
      // Mock the Dio response
      when(mockDio.get("/articles")).thenAnswer((_) async => Response(data: responseData, statusCode: 200, requestOptions: RequestOptions()));
      final articles = await articleRepository.getArticleList({ 'api-key' : "sample-key"});

      expect(articles?.status, 'OK');
      expect(articles?.results?.length, 1);
      expect(articles?.results?[0].type, 'Article');
    });

    test('getArticles handles errors', () async {
      when(mockDio.get("/articles")).thenThrow(Exception('Test error'));

      expect(() async => await articleRepository.getArticleList({ 'api-key' : "sample-key"}), throwsException);
    });

  });
}
