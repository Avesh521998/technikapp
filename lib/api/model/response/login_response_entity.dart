import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/login_response_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/login_response_entity.g.dart';

@JsonSerializable()
class LoginResponseEntity {
	@JSONField(name: "auth_key")
	String? authKey;
	@JSONField(name: "company_id")
	String? companyId;
	String? email;
	@JSONField(name: "last_login")
	String? lastLogin;
	String? message;
	String? name;
	@JSONField(name: "user_role")
	String? userRole;

	LoginResponseEntity();

	factory LoginResponseEntity.fromJson(Map<String, dynamic> json) => $LoginResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}