class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;

  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        phone: json['phone'],
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
      };
}
