import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/request/login_request_entity.dart';

LoginRequestEntity $LoginRequestEntityFromJson(Map<String, dynamic> json) {
  final LoginRequestEntity loginRequestEntity = LoginRequestEntity();
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    loginRequestEntity.username = username;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    loginRequestEntity.password = password;
  }
  return loginRequestEntity;
}

Map<String, dynamic> $LoginRequestEntityToJson(LoginRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['username'] = entity.username;
  data['password'] = entity.password;
  return data;
}

extension LoginRequestEntityExtension on LoginRequestEntity {
  LoginRequestEntity copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequestEntity()
      ..username = username ?? this.username
      ..password = password ?? this.password;
  }
}