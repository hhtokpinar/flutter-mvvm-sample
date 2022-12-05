import '/features/fresh_news/models/news_article.dart';

class NewsArticleViewmodel {
  final NewsArticle _newsArticle;

  NewsArticleViewmodel(this._newsArticle);

  String? get title => _newsArticle.title;
  String? get description => _newsArticle.description;
  String? get url => _newsArticle.url;
  String? get urlToImage => _newsArticle.urlToImage;

  void edit() {}
}
