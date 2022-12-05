import 'app/widgets/floating_button.dart';

import 'app/global_imports.dart';

@immutable
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Home Page Loaded');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Features'),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: List.generate(
            ROUTES.values.length,
            (index) => ElevatedButton(
                onPressed: () => NavigationRoute.goTo(context, ROUTES.values[index]),
                child: Text('Go ${ROUTES.values[index].tr.toUpperCase()} Page')),
          )),
        ),
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
