import '/features/fresh_news/viewmodels/news_article_viewmodel.dart';
import '../config/repository.dart';
import '../../../app/global_imports.dart';

class NewsArticleListViewmodel extends StateNotifier<List<NewsArticleViewmodel>> {
  NewsArticleListViewmodel([List<NewsArticleViewmodel>? state]) : super(state ?? <NewsArticleViewmodel>[]) {
    if (state == null) {
      populateTopHeadlines();
    }
  }
  bool isLoading = true;

  void populateTopHeadlines() {
    final String url = ConstantsNews.topHeadlinesUrl;
    _fetchData(url);
  }

  void searchNews(String keyword) {
    if (keyword.isNotEmpty) {
      isLoading = true;
      final String url = ConstantsNews.newsFilteredUrl(keyword);
      _fetchData(url);
    } else {
      populateTopHeadlines();
    }
  }

  void clearState() {
    state = <NewsArticleViewmodel>[];
  }

  void _fetchData(String url) async {
    clearState();
    final newsArticles = await NewsRepository.fetchNews(url);
    isLoading = false;
    state = newsArticles.map((e) => NewsArticleViewmodel(e)).toList();
    debugPrint('populated TopHeadlines: ${state.length} matches found');
  }
}
