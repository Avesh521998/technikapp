import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/get_estimate_list_response_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/get_estimate_list_response_entity.g.dart';

@JsonSerializable()
class GetEstimateListResponseEntity {
	@JSONField(name: "created_at")
	String? createdAt;
	String? date;
	String? description;
	@JSONField(name: "expense_type")
	String? expenseType;
	String? id;
	@JSONField(name: "person_name")
	String? personName;
	@JSONField(name: "project_id")
	String? projectId;
	@JSONField(name: "project_name")
	String? projectName;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "user_id")
	String? userId;
	String? value;
	bool? isShowRemark;

	GetEstimateListResponseEntity();

	factory GetEstimateListResponseEntity.fromJson(Map<String, dynamic> json) => $GetEstimateListResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $GetEstimateListResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}