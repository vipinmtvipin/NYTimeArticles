

import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/domain/repositories/article_repository.dart';

class ArticleRepositoryIml extends ArticleRepository {

  @override
  Future<ArticleResponds?> getArticleList(String key) {
    // TODO: implement getPostList
    throw UnimplementedError();
  }

  @override
  Future<ArticleResponds?> getPostList() async {
  /*  try {
      Response response = await ApiService.instance.get(NetworkKeys.products,
        // queryParameters: "",
          options: Options(contentType: 'application/json',));

        // final Map responseBody = json.decode(response.data);
        final List<PostResponds> _datas =  cartFromJson(response.toString());
        return _datas;

    }on DioException catch(e){
      var error = DioExceptionData.fromDioError(e);
      throw error.errorMessage;
    }*/

    // TODO: implement getPostList
    throw UnimplementedError();
  }


}
