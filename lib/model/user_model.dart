class UserModel {
  int? id;
  String username;
  String password;
  String email;
  String? cpf;
  String? phone;
  bool active = true;
  List roles;

  UserModel(
      {this.id,
      required this.username,
      required this.password,
      required this.email,
      this.cpf,
      this.phone,
      required this.roles});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "cpf": cpf,
      "phone": phone,
      "email": email,
      "roles": roles,
    };
  }

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return switch (json) {
  //     {
  //       'id': int id,
  //       'username': String username,
  //       'email': String email,
  //       'cpf': String cpf,
  //       'phone': String phone,
  //       'roles': List roles,
  //     } =>
  //       UserModel(
  //         username: username,
  //         id: id,
  //         title: title,
  //       ),
  //     _ => throw const FormatException('Failed to load album.'),
  //   };
  // }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"]?.toInt(),
      password: map["password"] ?? "",
      username: map["username"] ?? "",
      email: map["email"] ?? "",
      cpf: map["cpf"] ?? "",
      phone: map["phone"] ?? "",
      roles: map["roles"] ?? "",
    );
  }
}

class UserRequestModel {
  String? username;
  String? password;
  String? token;

  UserRequestModel({this.username, this.password, this.token});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': username,
      'password': password,
    };

    return map;
  }

  factory UserRequestModel.fromJson(Map<String, dynamic> map) {
    return UserRequestModel(
      token: map["token"],
    );
  }

  String? getToken() {
    return this.token;
  }
}
