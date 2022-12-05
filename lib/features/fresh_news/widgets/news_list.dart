import '../view_pages/news_details_page.dart';

import '../../../app/global_imports.dart';
import '../viewmodels/news_article_viewmodel.dart';

@immutable
class NewsList extends ConsumerWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<NewsArticleViewmodel> newsArticleList = ref.watch(ProvidersNews.newsProvider);
    final isLoading = ref.read(ProvidersNews.newsProvider.notifier).isLoading;
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : newsArticleList.isEmpty
            ? const Center(child: Text('No result found'))
            : ListView.builder(
                itemCount: newsArticleList.length,
                itemBuilder: ((context, index) {
                  final newsArticle = newsArticleList[index];
                  return Card(
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          ref.read(ProvidersNews.newsTitle.notifier).state = newsArticle.title ?? 'null';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsPage(article: newsArticle)));
                        },
                        title: Text(newsArticle.title ?? 'title_null'),
                        leading: SizedBox(
                            width: 100,
                            height: 100,
                            child: newsArticle.urlToImage == null ? Image.asset('images/news.jpeg') : Image.network(newsArticle.urlToImage ?? '')),
                      ),
                    ),
                  );
                }));
  }
}
