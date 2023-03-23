//

import 'app_user.dart';

class LoginData {
  AppUser user;
  String token;
  LoginData({
    required this.user,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toJson(),
      'token': token,
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      user: AppUser.fromJson(map['user'] as Map<String, dynamic>),
      token: map['token'] as String,
    );
  }

  LoginData fromJson(Map<String, dynamic> m) {
    return LoginData.fromMap(m);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }
}
