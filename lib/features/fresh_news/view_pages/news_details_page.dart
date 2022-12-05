import '/features/fresh_news/widgets/news_details_webview.dart';
import '/features/fresh_news/widgets/view.dart';
import '/features/fresh_news/viewmodels/news_article_viewmodel.dart';

import '../../../app/global_imports.dart';

class NewsDetailsPage extends ConsumerWidget {
  const NewsDetailsPage({required this.article, super.key});
  final NewsArticleViewmodel article;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: Center(
        child: article.url == null ? const Text('no url found') : NewsDetailsWebview(url: article.url!),
      ),
    );
  }
}
