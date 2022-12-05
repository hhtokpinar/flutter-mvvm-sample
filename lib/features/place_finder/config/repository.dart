import 'package:flutter/foundation.dart';
import '/features/place_finder/config/constants.dart';
import '/features/place_finder/models/map_response.dart';
import '/features/place_finder/models/results.dart';

import '../../../app/services/global.dart';

class PlaceFinderRepository {
  static Future<List<Results>> fetchMapResult(String keyword, double latitue, double longitute) async {
    final data = await WebServiceGlobal.fetchData(ConstantsPlaceFinder.googleNearbySearchUrl(keyword, latitue, longitute));

    final result = MapResponse.fromJson(data);
    debugPrint('${result.results?.length ?? 0} items found for "$keyword":');
    if (result.results != null) {
      for (var item in result.results!) {
        debugPrint(item.name);
      }
    }
    return result.results ?? <Results>[];
  }
}
