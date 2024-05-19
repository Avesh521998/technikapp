import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/get_project_expense_entity.g.dart';
import 'dart:convert';

import 'get_range_expense_entity.dart';
export 'package:technikapp/generated/json/get_project_expense_entity.g.dart';

@JsonSerializable()
class GetProjectExpenseEntity {
	String? month;
	@JSONField(name: "overall_total_value")
	String? overallTotalValue;
	@JSONField(name: "person_name")
	String? personName;
	@JSONField(name: "total_value_by_category")
	GetRangeExpenseTotalValueByCategory? totalValueByCategory;

	GetProjectExpenseEntity();

	factory GetProjectExpenseEntity.fromJson(Map<String, dynamic> json) => $GetProjectExpenseEntityFromJson(json);

	Map<String, dynamic> toJson() => $GetProjectExpenseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}