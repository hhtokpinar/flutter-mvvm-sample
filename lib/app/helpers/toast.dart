import 'package:fluttertoast/fluttertoast.dart';

import '../global_imports.dart';

enum MessageType { error, success, warning }

showToast({required String message, MessageType? type}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: type == MessageType.error
          ? Colors.red
          : type == MessageType.warning
              ? Colors.amber.shade700
              : Colors.green.shade700,
      textColor: Colors.white,
      fontSize: 16.0);
}
