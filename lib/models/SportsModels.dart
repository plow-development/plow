class SportsModel {
  final int id;
  final String name;
  final String description;
  final String type;

  SportsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
  });
  factory SportsModel.fromJson(Map<String, dynamic> json) {
    return SportsModel(id: json["sport_id"], name: json["name"],
        description: json["description"], type: json["sport_type"]);
  }
}