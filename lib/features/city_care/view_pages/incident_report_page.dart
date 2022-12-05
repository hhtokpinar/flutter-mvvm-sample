// ignore_for_file: prefer_const_constructors

import 'package:flutter_mvvm/app/global_imports.dart';
import 'package:flutter_mvvm/app/helpers/toast.dart';
import 'package:flutter_mvvm/app/styles/text_input_decorations.dart';
import 'package:flutter_mvvm/features/city_care/helper/providers.dart';

@immutable
class IncidentReportPage extends ConsumerWidget {
  IncidentReportPage({super.key});
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report an incident')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerTitle,
              decoration: AppDecorations.outlineBordered(labelText: 'Enter Title'),
              onChanged: (value) => ref.read(ProvidersCityCare.reportIncidentProvider.notifier).title = value,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controllerDescription,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: AppDecorations.outlineBordered(labelText: 'Enter description'),
              onChanged: (value) => ref.read(ProvidersCityCare.reportIncidentProvider.notifier).description = value,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.read(ProvidersCityCare.reportIncidentProvider.notifier).saveIncident();

                showToast(message: 'Incident saved succesfully');
                ref.read(ProvidersCityCare.incidentsProvider.notifier).getAllIncidents();
                Navigator.pop(context);
              },
              child: Text('Save'),
            )
          ],
        ),
      )),
    );
  }
}
