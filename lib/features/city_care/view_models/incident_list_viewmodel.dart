import 'package:flutter_mvvm/features/city_care/helper/webservice.dart';
import 'package:flutter_mvvm/features/city_care/view_models/incident_viewmodel.dart';

import '../../../app/global_imports.dart';

class IncidentListViewModel extends StateNotifier<List<IncidentViewModel>> {
  IncidentListViewModel([List<IncidentViewModel>? state]) : super(state ?? <IncidentViewModel>[]) {
    if (state == null) {
      getAllIncidents();
    }
  }
  bool isLoading = false;
  Future<void> getAllIncidents() async {
    isLoading = true;
    state = [];
    final incideents = await WebServiceCityCare.getAllIncidents();
    isLoading = false;
    state = incideents.map((e) => IncidentViewModel(e)).toList();
    debugPrint('${state.length} Items are provided');
  }
}
