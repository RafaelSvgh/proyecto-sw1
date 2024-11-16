class User {
  String? email;
  String? name;

  User({
    this.email,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
      };
}
