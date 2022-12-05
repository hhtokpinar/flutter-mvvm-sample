import 'package:flutter/foundation.dart';
import 'navigation_route.dart';

extension RouteEnumExtension on ROUTES {
  String get tr => describeEnum(this);
}
