
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/domain/repositories/article_repository.dart';

import '../../core/usecases/pram_usecase.dart';

class ArticleUseCase extends ParamUseCase<ArticleResponds?, String> {
  final ArticleRepository _repo;
  ArticleUseCase(this._repo);

  @override
  Future<ArticleResponds?> execute(String params) {
    return _repo.getArticleList(params);
  }
}
