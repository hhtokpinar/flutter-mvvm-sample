import 'package:flutter_mvvm/app/global_imports.dart';
import 'package:flutter_mvvm/features/city_care/view_pages/incident_list_page.dart';
import 'package:flutter_mvvm/features/city_care/view_pages/incident_report_page.dart';

class CityCareHomePage extends ConsumerWidget {
  const CityCareHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text('Incidents')),
        body: Stack(
          children: [
            const IncidentListPage(),
            SafeArea(
                child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    //   WebServiceCityCare.saveIncident(Incident('title X', 'description X'));
                    NavigationRoute.goToWidget(context, IncidentReportPage(), isFullscreenDialog: true);
                  },
                ),
              ),
            ))
          ],
        ));
  }
}
