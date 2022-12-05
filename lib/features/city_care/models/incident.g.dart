// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Incident _$IncidentFromJson(Map<String, dynamic> json) => Incident(
      title: json['title'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$IncidentToJson(Incident instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
