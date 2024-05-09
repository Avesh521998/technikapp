import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/edit_expense_request_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/edit_expense_request_entity.g.dart';

@JsonSerializable()
class EditExpenseRequestEntity {
	@JSONField(name: "project_name")
	String? projectName;
	@JSONField(name: "person_name")
	String? personName;
	@JSONField(name: "type_of_expense")
	String? typeOfExpense;
	String? description;
	String? date;
	String? value;

	EditExpenseRequestEntity();

	factory EditExpenseRequestEntity.fromJson(Map<String, dynamic> json) => $EditExpenseRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $EditExpenseRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}