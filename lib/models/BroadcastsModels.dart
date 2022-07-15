class BroadcastsModel {
  final int id;
  final String title;
  final String description;
  final String preview;
  final String link;

  BroadcastsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.preview,
    required this.link,
  });
  factory BroadcastsModel.fromJson(Map<String, dynamic> json) {
    return BroadcastsModel(id: json["broadcast_id"], title: json["title"],
        description: json["description"], preview: json["preview"], link: json["link"]);
  }
}