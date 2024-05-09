import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/add_expense_request_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/add_expense_request_entity.g.dart';

@JsonSerializable()
class AddExpenseRequestEntity {
	@JSONField(name: "project_id")
	String? projectId;
	@JSONField(name: "project_name")
	String? projectName;
	@JSONField(name: "person_name")
	String? personName;
	String? description;
	String? date;
	@JSONField(name: "type_of_expense")
	String? typeOfExpense;
	String? value;

	AddExpenseRequestEntity();

	factory AddExpenseRequestEntity.fromJson(Map<String, dynamic> json) => $AddExpenseRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $AddExpenseRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}