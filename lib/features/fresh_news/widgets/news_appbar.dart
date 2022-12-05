import '/app/global_imports.dart';

class NewsAppBar extends ConsumerWidget with PreferredSizeWidget {
  const NewsAppBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(ref.watch(ProvidersNews.newsTitle)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
