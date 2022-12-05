import 'package:flutter_mvvm/app/global_imports.dart';
import 'package:flutter_mvvm/features/city_care/helper/webservice.dart';
import 'package:flutter_mvvm/features/city_care/models/incident.dart';

class ReportIncidentViewModel extends StateNotifier<Incident?> {
  String? title;
  String? description;

  ReportIncidentViewModel() : super(null);

  Future<void> saveIncident() async {
    final incident = Incident(title: title ?? '', description: description);
    await WebServiceCityCare.saveIncident(incident);
    return;
  }
}
