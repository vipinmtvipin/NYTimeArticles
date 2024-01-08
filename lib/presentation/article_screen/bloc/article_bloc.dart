import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../config.dart' show environmentHost;
import 'package:ny_articles_app/core/constants/string_constants.dart';
import 'package:ny_articles_app/core/network/connectivity_service.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/domain/usecases/article_use_case.dart';

import 'article_state.dart';


class ArticleBloc extends Cubit<ArticleState> {

  final ArticleUseCase _articleUseCase;

  ArticleBloc(this._articleUseCase) : super(ArticleInitial());


  Future<void> fetchArticles() async {
    if(await GetIt.instance.get<ConnectivityService>().isConnected()) {
      try {
        emit(ArticleLoading());
        String apiKey = environmentHost[AppStrings.apikey]!;
        Map<String, dynamic> payload = { AppStrings.apikey : apiKey, };

        ArticleResponds? responds = await _articleUseCase.execute(payload);

        if (responds != null && responds.status == 'OK') {
          emit(ArticleLoaded(articles: responds.results!));
          }else {
          emit(ArticleError(message: AppStrings.serverError));
        }
      } catch (e) {
        emit(ArticleError(message: AppStrings.serverError));
      }
    }else{
      emit(ArticleNoNetwork());
    }
  }

}



