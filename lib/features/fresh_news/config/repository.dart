import '../../../app/services/global.dart';
import '/features/fresh_news/models/news_article.dart';

import '../models/news_reponse.dart';

class NewsRepository {
  static Future<List<NewsArticle>> fetchNews(String url) async {
    final data = await WebServiceGlobal.fetchData(url);

    final result = NewsResponse.fromJson(data);
    return result.articles ?? <NewsArticle>[];
  }
}
