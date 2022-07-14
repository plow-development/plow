class EventsModel {
  final int id;
  final String name;
  final DateTime startTime;
  final double latitude;
  final double longitude;

  EventsModel({
    required this.id,
    required this.name,
    required this.startTime,
    required this.latitude,
    required this.longitude,
  });
}