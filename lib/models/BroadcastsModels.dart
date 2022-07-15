class BroadcastsModel {
  final int id;
  final String title;
  final String description;
  final String preview;
  final int eventId;
  final String link;

  BroadcastsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.preview,
    required this.eventId,
    required this.link,
  });
  factory BroadcastsModel.fromJson(Map<String, dynamic> json) {
    return BroadcastsModel(id: json["id"], title: json["title"],
        description: json["description"], preview: json["preview"],
        eventId: json["eventId"], link: json["link"]);
  }
}