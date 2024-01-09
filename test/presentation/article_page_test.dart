import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_articles_app/core/network/connectivity_service.dart';
import 'package:ny_articles_app/presentation/article_screen/article_page.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_bloc.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_state.dart';

//class MockArticleCubit extends Mock implements ArticleBloc {}

class MockArticleCubit extends MockCubit<ArticleState> implements ArticleBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ArticlePage', () {
    late MockArticleCubit mockArticleCubit;

    setUp(() {
      mockArticleCubit = MockArticleCubit();
    });

    tearDown(() {
      GetIt.I.reset();
    });

    testWidgets('Scanning ArticlePage', (WidgetTester tester) async {
      // Arrange
      when(mockArticleCubit.state).thenReturn(ArticleLoading());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockArticleCubit,
            child: const ArticlePage(),
          ),
        ),
      );

      // Assert
      expect(find.text('Article List'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      verify(mockArticleCubit.fetchArticles()).called(1);
    });

    testWidgets('Scanning loading indicator when loading', (WidgetTester tester) async {
      // Arrange
      when(mockArticleCubit.state).thenReturn(ArticleLoading());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockArticleCubit,
            child: const ArticlePage(),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Scanning error message when error occurs', (WidgetTester tester) async {
      // Arrange
      when(mockArticleCubit.state).thenReturn(ArticleError(message: 'Error'));

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockArticleCubit,
            child: const ArticlePage(),
          ),
        ),
      );

      // Assert
      expect(find.text('Error'), findsOneWidget);
    });
  });
}
