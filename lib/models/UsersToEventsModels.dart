class UsersToEventsModel {
  final int userId;
  final int eventId;
  final String userType;

  UsersToEventsModel({
    required this.userId,
    required this.eventId,
    required this.userType,

  });
  factory UsersToEventsModel.fromJson(Map<String, dynamic> json) {
    return UsersToEventsModel(userId: json["userI"],
        eventId: json["eventId"],
        userType: json["userType"]);
  }
}