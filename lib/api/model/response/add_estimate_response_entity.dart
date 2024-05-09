import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/add_estimate_response_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/add_estimate_response_entity.g.dart';

@JsonSerializable()
class AddEstimateResponseEntity {
	String? message;

	AddEstimateResponseEntity();

	factory AddEstimateResponseEntity.fromJson(Map<String, dynamic> json) => $AddEstimateResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $AddEstimateResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}