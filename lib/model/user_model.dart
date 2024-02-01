class UserModel {
  int? id;
  String fullName;
  String email;
  String profileIimageUrl;
  String userName;
  String password;

  UserModel(
      { this.id,
       required this.fullName,
      required this.email,
      required this.userName,
      required this.password,
      this.profileIimageUrl = ""});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        fullName: json["fullname"],
        email: json["email"],
        userName: json["username"],
        password: json["password"],
        profileIimageUrl: json["profile_image_url"]);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'fullname': fullName,
      'email': email,
      'username': userName,
      'password': password,
      'profile_image_url': profileIimageUrl,

    };
  }
}
