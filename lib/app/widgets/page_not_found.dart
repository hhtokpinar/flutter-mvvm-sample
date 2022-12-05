// ignore_for_file: prefer_const_constructors

import '../global_imports.dart';

@immutable
class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MVVM Apps'),
        ),
        body: Center(
          child: Text('Page not found'),
        ));
  }
}
