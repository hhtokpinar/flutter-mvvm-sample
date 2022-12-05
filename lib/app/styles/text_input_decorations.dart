import 'package:flutter_mvvm/app/global_imports.dart';

class AppDecorations {
  static InputDecoration outlineBordered({String? labelText}) => InputDecoration(
        label: labelText != null ? Text(labelText) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      );
}
