import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/login_response_entity.dart';

LoginResponseEntity $LoginResponseEntityFromJson(Map<String, dynamic> json) {
  final LoginResponseEntity loginResponseEntity = LoginResponseEntity();
  final String? authKey = jsonConvert.convert<String>(json['auth_key']);
  if (authKey != null) {
    loginResponseEntity.authKey = authKey;
  }
  final String? companyId = jsonConvert.convert<String>(json['company_id']);
  if (companyId != null) {
    loginResponseEntity.companyId = companyId;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    loginResponseEntity.email = email;
  }
  final String? lastLogin = jsonConvert.convert<String>(json['last_login']);
  if (lastLogin != null) {
    loginResponseEntity.lastLogin = lastLogin;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    loginResponseEntity.message = message;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    loginResponseEntity.name = name;
  }
  final String? userRole = jsonConvert.convert<String>(json['user_role']);
  if (userRole != null) {
    loginResponseEntity.userRole = userRole;
  }
  return loginResponseEntity;
}

Map<String, dynamic> $LoginResponseEntityToJson(LoginResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['auth_key'] = entity.authKey;
  data['company_id'] = entity.companyId;
  data['email'] = entity.email;
  data['last_login'] = entity.lastLogin;
  data['message'] = entity.message;
  data['name'] = entity.name;
  data['user_role'] = entity.userRole;
  return data;
}

extension LoginResponseEntityExtension on LoginResponseEntity {
  LoginResponseEntity copyWith({
    String? authKey,
    String? companyId,
    String? email,
    String? lastLogin,
    String? message,
    String? name,
    String? userRole,
  }) {
    return LoginResponseEntity()
      ..authKey = authKey ?? this.authKey
      ..companyId = companyId ?? this.companyId
      ..email = email ?? this.email
      ..lastLogin = lastLogin ?? this.lastLogin
      ..message = message ?? this.message
      ..name = name ?? this.name
      ..userRole = userRole ?? this.userRole;
  }
}