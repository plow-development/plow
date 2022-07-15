class TeamsModel {
  final int id;
  final String name;
  final int masterId;
  final int sportId;

  TeamsModel({
    required this.id,
    required this.name,
    required this.masterId,
    required this.sportId,
  });
  factory TeamsModel.fromJson(Map<String, dynamic> json) {
    return TeamsModel(id: json["id"], name: json["name"],
      masterId: json["masterId"], sportId: json["sportId"]);
  }
}