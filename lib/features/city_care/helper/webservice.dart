import 'package:flutter_mvvm/app/global_imports.dart';
import 'package:flutter_mvvm/features/city_care/helper/constants.dart';
import 'package:flutter_mvvm/features/city_care/models/incident.dart';

class WebServiceCityCare {
  static Future<void> saveIncident(Incident incident) async {
    final response = await WebServiceGlobal.post(ConstantsCityCare.saveIncidentNoImageUrl, data: incident.toJson());
    debugPrint(response.toString());
  }

  static Future<List<Incident>> getAllIncidents() async {
    final response = await WebServiceGlobal.fetchData(ConstantsCityCare.getAllIncidents);
    return Incident.fromJsonList(response);
  }
}
