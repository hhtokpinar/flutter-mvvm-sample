import 'package:flutter_mvvm/app/global_imports.dart';
import 'package:flutter_mvvm/features/city_care/models/incident.dart';
import 'package:flutter_mvvm/features/city_care/view_models/incident_list_viewmodel.dart';
import 'package:flutter_mvvm/features/city_care/view_models/incident_viewmodel.dart';
import 'package:flutter_mvvm/features/city_care/view_models/report_incident_viewmodel.dart';

class ProvidersCityCare {
  ProvidersCityCare._();

  /// save incident provider [ReportIncidentViewModel] returns [Incident]?
  static final reportIncidentProvider = StateNotifierProvider<ReportIncidentViewModel, Incident?>(((ref) => ReportIncidentViewModel()));

  /// show incidents list provider [IncidentListViewModel] returns List[IncidentViewModel]
  static final incidentsProvider = StateNotifierProvider<IncidentListViewModel, List<IncidentViewModel>>((ref) => IncidentListViewModel());
}
