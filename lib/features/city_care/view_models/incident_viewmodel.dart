import 'package:flutter_mvvm/features/city_care/models/incident.dart';

class IncidentViewModel {
  final Incident incident;
  IncidentViewModel(this.incident);

  String get title => incident.title;
  String? get description => incident.description;
}
