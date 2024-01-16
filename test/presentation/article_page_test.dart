import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ny_articles_app/core/constants/string_constants.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/presentation/article_screen/article_page.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_bloc.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_state.dart';
import 'package:ny_articles_app/presentation/common_widgets/article_item.dart';


class MockArticleCubit extends MockCubit<ArticleState> implements ArticleBloc {}

void main() {
  late MockArticleCubit mockArticleCubit;

  setUp(() {
    mockArticleCubit = MockArticleCubit();
    GetIt.I.registerFactory<ArticleBloc>(() => mockArticleCubit);
    // Provide an initial state for the mock bloc.
    when(mockArticleCubit.state).thenReturn(ArticleInitial());
  });

  tearDown(() {
    mockArticleCubit.close();
    GetIt.I.reset();
  });


  Widget createTestableWidget() {
    return MaterialApp(
      home: BlocProvider<ArticleBloc>(
        create: (context) => mockArticleCubit,
        child: const ArticlePage(),
      ),
    );
  }


  testWidgets('should display a loading indicator when state is ArticleLoading', (WidgetTester tester) async {
    when(mockArticleCubit.state).thenReturn(ArticleLoading());
    await tester.pumpWidget(createTestableWidget());
    //    await tester.pumpWidget(MaterialApp(home: ArticlePage()));
    await tester.pump(); // Pump again to settle animations
    expect(find.byType(SpinKitPouringHourGlass), findsOneWidget);
  });

  testWidgets('should display a list of articles when state is ArticleLoaded', (WidgetTester tester) async {
    final responseData = [Result(title: "Article one", id: 101)];

    when(mockArticleCubit.state).thenReturn(ArticleLoaded(articles: responseData));
    await tester.pumpWidget(createTestableWidget());
    await tester.pumpAndSettle(); // Pump and wait for animations
    expect(find.byType(ArticleItemWidget), findsNWidgets(responseData.length));
  });

  testWidgets('should display no network toast when state is ArticleNoNetwork', (WidgetTester tester) async {
    when(mockArticleCubit.state).thenReturn(ArticleNoNetwork());
    await tester.pumpWidget(createTestableWidget());
    await tester.pump(); // Pump again for the UI to settle
    expect(find.text(AppStrings.noDataFound), findsOneWidget);
  });


  testWidgets('should display an error message when state is ArticleError', (WidgetTester tester) async {
    when(mockArticleCubit.state).thenReturn(const ArticleError(message: AppStrings.noDataFound));
    await tester.pumpWidget(createTestableWidget());
    await tester.pumpAndSettle(); // Pump again for the UI to settle
    expect(find.text(AppStrings.noDataFound), findsOneWidget);
  });

}