import '/app/global_imports.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        title: 'Flutter MVVM',
        initialRoute: ROUTES.home.tr,
        onGenerateRoute: NavigationRoute.generateRoute,
      ),
    );
  }
}
