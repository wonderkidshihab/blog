// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  final int id;
  final String username;
  final String email;
  ProfileModel({
    required this.id,
    required this.username,
    required this.email,
  });
  

  ProfileModel copyWith({
    int? id,
    String? username,
    String? email,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileModel(id: $id, username: $username, email: $email)';

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.username == username &&
      other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ email.hashCode;
}
