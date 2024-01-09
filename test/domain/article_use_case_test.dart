
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/domain/repositories/article_repository.dart';
import 'package:ny_articles_app/domain/usecases/article_use_case.dart';


class MockArticleRepository extends Mock implements ArticleRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ArticleUseCase', () {
    late ArticleUseCase articleUseCase;
    late MockArticleRepository mockArticleRepository;

    setUp(() {
      mockArticleRepository = MockArticleRepository();
      articleUseCase = ArticleUseCase(mockArticleRepository);
    });

    const payloadRequest = {'api-key': "sample-key"};
    const responseData = {
      'results': [
        {'type': 'Article', 'published_date': "2024-01-05"}
      ],
      'status': "OK",
      'numResults': 10,
      'copyright': "@"
    };

    test('getArticles calls repository.getArticleList', () async {
      // Arrange
      when(mockArticleRepository.getArticleList(payloadRequest)).thenAnswer(
            (_) async => responseData as ArticleResponds,
      );
      // Act
      final articles = await articleUseCase.execute(payloadRequest);
      // Assert
      expect(articles?.status, 'OK');
      expect(articles?.results?.length, 1);
      expect(articles?.results?[0].type, 'Article');
      // Ensure that repository.getArticleList was called
      verify(mockArticleRepository.getArticleList(payloadRequest)).called(1);
    });

  });
}
