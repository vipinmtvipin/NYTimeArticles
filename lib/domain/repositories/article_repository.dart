

import 'package:ny_articles_app/data/model/article_responds.dart';

abstract class ArticleRepository {
  Future<ArticleResponds?> getArticleList(String key);
}
