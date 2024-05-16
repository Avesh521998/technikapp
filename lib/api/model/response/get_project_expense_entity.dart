import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/get_project_expense_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/get_project_expense_entity.g.dart';

@JsonSerializable()
class GetProjectExpenseEntity {
	String? month;
	@JSONField(name: "person_name")
	String? personName;
	@JSONField(name: "total_value")
	String? totalValue;

	GetProjectExpenseEntity();

	factory GetProjectExpenseEntity.fromJson(Map<String, dynamic> json) => $GetProjectExpenseEntityFromJson(json);

	Map<String, dynamic> toJson() => $GetProjectExpenseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}