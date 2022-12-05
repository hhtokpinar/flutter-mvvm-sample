import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/news_article_list_viewmodel.dart';
import '../viewmodels/news_article_viewmodel.dart';

class ProvidersNews {
  static final newsProvider = StateNotifierProvider<NewsArticleListViewmodel, List<NewsArticleViewmodel>>((ref) => NewsArticleListViewmodel());

  static final webViewLoading = StateProvider<bool>((ref) => false);
  static final newsTitle = StateProvider((ref) => 'Fresh News');
}
