import 'package:json_annotation/json_annotation.dart';

part 'incident.g.dart';

@JsonSerializable()
class Incident {
  final String title;
  final String? description;
  Incident({required this.title, this.description});

  factory Incident.fromJson(Map<String, dynamic> json) => _$IncidentFromJson(json);

  /// Connect the generated [_$IncidentToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$IncidentToJson(this);

  static List<Incident> fromJsonList(List<dynamic> data) => data.map((e) => Incident.fromJson(e)).toList();
}
