import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/login_request_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/login_request_entity.g.dart';

@JsonSerializable()
class LoginRequestEntity {
	String? username;
	String? password;

	LoginRequestEntity();

	factory LoginRequestEntity.fromJson(Map<String, dynamic> json) => $LoginRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}