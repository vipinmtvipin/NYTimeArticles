

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles_app/core/constants/string_constants.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_bloc.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_state.dart';
import 'package:ny_articles_app/presentation/article_screen/di/di_container.dart';
import 'package:ny_articles_app/presentation/base_page.dart';
import 'package:ny_articles_app/presentation/common_widgets/no_data_found.dart';


class ArticlePage extends BasePage {
  static const routeName = '/article-screen';
  const ArticlePage({super.key});

  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends BasePageState<ArticlePage> {

   late ArticleBloc _articleCubit;

  @override
  void initState() {
    super.initState();
     _articleCubit = getIt<ArticleBloc>();
     _articleCubit.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.homeToolbarTitle),),
           body: BlocConsumer(
            bloc: _articleCubit,
            listener: (BuildContext context, ArticleState state) {
              if (state is ArticleLoading) {
                  showLoadingDialog();
              }
              else if (state is ArticleNoNetwork) {
                showToast(AppStrings.noNetwork);
              }
              else if (state is ArticleError) {
                hideLoadingDialog();
                if (state.message != null && state.message.isNotEmpty) {
                  showToast(state.message);
                } else {
                  showToast(AppStrings.serverError);
                }
              }
              if(state is ArticleLoaded){
                hideLoadingDialog();
              }
            },
            builder: (BuildContext context, ArticleState state) {
               if(state is ArticleLoaded){
                 return articleLister(state.articles);
              }else{
                 return const NoDataUI(AppStrings.noDataFound);
               }
            },
          ),
        ),
    );
  }



  Widget articleLister(List<Result> articles) {
    return (articles.isEmpty)
        ? const NoDataUI(AppStrings.noDataFound)
        : ListView.builder(
        shrinkWrap: false,
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return articleCard(articles[index]);
        },
      );
  }


  Widget articleCard(Result article) {
        return Container(color: Colors.red,height: 20,
        child: Text(article.title.toString()),);
  }

  /// we can move this text logic to generic class for entire application use
  /// also add different constraints based on our scenarios
  Widget textBinder(String text, TextStyle styles, TextAlign pos) {
    return Text(
        text,
        style: styles,
        textAlign: pos,
    );
  }

  @override
  void dispose() {
    _articleCubit.close(); // Close the cubit to avoid memory leaks
    super.dispose();
  }

}
