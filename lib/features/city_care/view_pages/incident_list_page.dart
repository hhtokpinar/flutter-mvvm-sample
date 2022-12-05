import 'package:flutter_mvvm/features/city_care/helper/providers.dart';

import '../../../app/global_imports.dart';

class IncidentListPage extends ConsumerWidget {
  const IncidentListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('IncidentListPage build ran');
    final incidents = ref.watch(ProvidersCityCare.incidentsProvider);
    return ref.read(ProvidersCityCare.incidentsProvider.notifier).isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: incidents.length,
            itemBuilder: (context, index) {
              final incident = incidents[index];
              return ListTile(title: Text(incident.title), subtitle: Text(incident.description ?? ''));
            });
  }
}
