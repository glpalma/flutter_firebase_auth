import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(uid: json['uid'], email: json['email']);
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(uid: user.uid, email: user.email!);
  }

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email};
  }
}
