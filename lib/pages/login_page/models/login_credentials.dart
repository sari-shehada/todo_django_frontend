// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginCredentials {
  final String userName;
  final String password;
  LoginCredentials({
    required this.userName,
    required this.password,
  });

  LoginCredentials copyWith({
    String? userName,
    String? password,
  }) {
    return LoginCredentials(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
    };
  }

  factory LoginCredentials.fromMap(Map<String, dynamic> map) {
    return LoginCredentials(
      userName: map['userName'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginCredentials.fromJson(String source) =>
      LoginCredentials.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginCredentials(userName: $userName, password: $password)';

  @override
  bool operator ==(covariant LoginCredentials other) {
    if (identical(this, other)) return true;

    return other.userName == userName && other.password == password;
  }

  @override
  int get hashCode => userName.hashCode ^ password.hashCode;
}
