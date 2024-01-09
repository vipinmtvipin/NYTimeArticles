
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_articles_app/core/constants/network_constants.dart';
import 'package:ny_articles_app/data/api/api_service.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/domain/repositories/article_repository.dart';

import '../../core/network/dio_exception.dart';

class ArticleRepositoryIml extends ArticleRepository {

  @override
  Future<ArticleResponds?> getArticleList(Map<String, dynamic> payload) async {
      try {
      Response response = await GetIt.instance
          .get<ApiService>().get(NetworkKeys.article_list,
          queryParameters: payload,
          options: Options(contentType: 'application/json',));

      if(response.statusCode == 200) {
        final ArticleResponds data = articleRespondsFromJson(
            response.toString());
        return data;
      }
    }on DioException catch(e){
      var error = DioExceptionData.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
