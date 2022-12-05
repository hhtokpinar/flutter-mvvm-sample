// ignore_for_file: prefer_const_constructors

import '/app/utils/font_manager.dart';
import '../../app/widgets/floating_button.dart';
import '/features/counter/config/providers.dart';

import '../../app/global_imports.dart';

@immutable
class CounterHomePage extends ConsumerWidget {
  const CounterHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
          actions: [IconButton(onPressed: () => ref.refresh(ProvidersCounter.counter), icon: Icon(Icons.refresh))],
        ),
        body: Center(
            child: Column(
          children: [
            Text(
              ref.watch(ProvidersCounter.counter).toString(),
              style: TextStyle(fontSize: FontSizeManager.huge),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(onPressed: () => ref.read(ProvidersCounter.counter.notifier).state++, child: Icon(Icons.add))
          ],
        )),
        floatingActionButton: const FloatingButton());
  }
}
