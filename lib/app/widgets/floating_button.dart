import '../global_imports.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => NavigationRoute.goTo(context, ROUTES.home),
      child: const Icon(Icons.home),
    );
  }
}
