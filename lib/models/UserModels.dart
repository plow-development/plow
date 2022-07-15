class UserModel {
  final int id;
  final String firstname;
  final String username;
  final String hashedPassword;
  final String email;
  final String avatar;
  final String lastname;
  final DateTime birthday;
  final String type;
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
    required this.type,
    required this.money,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(id: json["id"]);
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json["id"]);
  }
}

class UserSportModel {
  final int userId;
  final int sportId;

  UserSportModel({
    required this.userId,
    required this.sportId,

  });
}

class TeamsUsersModel {
  final int teamId;
  final int userId;

  TeamsUsersModel({
    required this.teamId,
    required this.userId,

  });
}

