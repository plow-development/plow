class UserModel {
  final int id;
  final String firstname;
  final String username;
  final String hashedPassword;
  final String email;
  final String avatar;
  final String lastname;
  final DateTime birthday;
  final int money;

  UserModel({
    required this.id,
    required this.firstname,
    required this.username,
    required this.hashedPassword,
    required this.email,
    required this.avatar,
    required this.lastname,
    required this.birthday,
    required this.money,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json["id"], firstname: json["firstname"], username: json["username"],
      hashedPassword: json["hashedPassword"], email: json["email"], avatar: json["avatar"], lastname: json["lastname"],
      birthday: json["birthday"], money: json["money"]);
  }
}

class UserSportModel {
  final int userId;
  final int sportId;

  UserSportModel({
    required this.userId,
    required this.sportId,

  });
  factory UserSportModel.fromJson(Map<String, dynamic> json) {
    return UserSportModel(userId: json["userId"], sportId: json["sportId"]);
  }
}

class TeamsUsersModel {
  final int teamId;
  final int userId;

  TeamsUsersModel({
    required this.teamId,
    required this.userId,

  });
  factory TeamsUsersModel.fromJson(Map<String, dynamic> json) {
    return TeamsUsersModel(teamId: json["teamId"], userId: json["userId"]);
  }
}

