import 'package:plow/models/SportsModels.dart';

class EventsModel {
  final int id;
  final String name;
  final String description;
  final String preview;
  final String startTime;
  final double latitude;
  final double longitude;
  final SportsModel sport;

  EventsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.preview,
    required this.startTime,
    required this.latitude,
    required this.longitude,
    required this.sport,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
        id: json["event_id"],
        name: json["name"],
        description: json["description"],
        preview: json["preview"],
        startTime: json["starttime"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        sport: SportsModel.fromJson(json["sports"]));
  }
}
