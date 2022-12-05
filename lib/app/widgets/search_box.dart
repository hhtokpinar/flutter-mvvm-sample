import '../global_imports.dart';

class SearchBox extends ConsumerWidget {
  const SearchBox({
    required this.txtKeyword,
    required this.onSubmitted,
    super.key,
  });
  final void Function(String)? onSubmitted;
  final TextEditingController txtKeyword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: TextField(
        controller: txtKeyword,
        decoration: InputDecoration(
          fillColor: Colors.white,
          icon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          hintText: 'Enter search term',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => txtKeyword.clear(),
          ),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
