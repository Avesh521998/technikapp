import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/generate_token_response_entity.g.dart';

@JsonSerializable()
class GenerateTokenResponseEntity {

	String? message;
	String? mid;
	String? txnToken;
  String? orderId;
  
  GenerateTokenResponseEntity();

  factory GenerateTokenResponseEntity.fromJson(Map<String, dynamic> json) => $GenerateTokenResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $GenerateTokenResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}