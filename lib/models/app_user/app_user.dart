// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  final String id;
  final String name;
  final String userName;
  AppUser({
    required this.id,
    required this.name,
    required this.userName,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? userName,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'userName': userName,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['name'] as String,
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppUser(id: $id, name: $name, userName: $userName)';

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.userName == userName;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ userName.hashCode;
}
