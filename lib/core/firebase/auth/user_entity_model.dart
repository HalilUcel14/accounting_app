import 'package:hucel_core/hucel_core.dart';

class UserEntity extends BaseModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? password;

  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.imageUrl,
    required this.lastName,
    required this.password,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      imageUrl: json['imageUrl'],
      lastName: json['lastName'],
      password: json['password'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'imageUrl': imageUrl,
      'password': password,
    };
  }
}
