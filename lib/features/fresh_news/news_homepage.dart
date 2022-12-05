// ignore_for_file: prefer_const_constructors

import '../../app/widgets/floating_button.dart';

import '../../app/global_imports.dart';
import 'widgets/view.dart';

@immutable
class NewsHomePage extends ConsumerWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('FRESH NEWS, Home Page Loaded');
    TextEditingController txtKeyword = TextEditingController();
    return Scaffold(
      appBar: NewsAppBar(),
      body: Column(
        children: [
          SearchBox(
            txtKeyword: txtKeyword,
            onSubmitted: (value) => ref.read(ProvidersNews.newsProvider.notifier).searchNews(value),
          ),
          const Expanded(child: NewsList()),
        ],
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
