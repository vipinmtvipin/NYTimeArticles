import 'dart:async';



import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:ny_articles_app/core/constants/string_constants.dart';
import 'package:ny_articles_app/core/network/connectivity_service.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';

import 'article_state.dart';


class ArticleBloc extends Cubit<ArticleState> {

  final IAppRepository appRepository;


  ArticleBloc({@required this.appRepository}) : super(ArticleState.initial());


  Future<void> callCart(String token,int page) async {
    if(await ConnectivityService.isConnected()) {
      try {
          emit(state.dataWith(isLoading: true,));

        Map<String, dynamic> payload = {
          "page":page,
          "limit":10
        };

        ArticleResponds responds = await appRepository.callCart(payload,token);

        if (responds != null) {
              emit(state.dataWith(noNetwork: false,
                  isLoading: false,
                  cartList: responds.results,));
          }else {
          setStateValues(AppStrings.serverError);
        }
      } catch (e) {
        setStateValues(AppStrings.serverError);
      }
    }else{
      emit(state.dataWith(noNetwork: true));
    }

  }


  Future<void> setStateValues(String msg) async{
    emit(state.dataWith(noNetwork: false,isFailure: true,  isLoading: false, cartList: [],
      errorMessage: msg));
}


}



