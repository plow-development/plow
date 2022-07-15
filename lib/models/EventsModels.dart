class EventsModel {
  final int id;
  final String name;
  final String startTime;
  final double latitude;
  final double longitude;

  EventsModel({
    required this.id,
    required this.name,
    required this.startTime,
    required this.latitude,
    required this.longitude,
  });
  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(id: json["id"], name: json["name"],
        startTime: json["startTime"], latitude: json["latitude"],
        longitude: json["longitude"]);
  }
}