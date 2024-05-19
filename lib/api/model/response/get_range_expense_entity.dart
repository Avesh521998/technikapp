import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/get_range_expense_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/get_range_expense_entity.g.dart';

@JsonSerializable()
class GetRangeExpenseEntity {
	@JSONField(name: "end_date")
	String? endDate;
	@JSONField(name: "overall_total_value")
	String? overallTotalValue;
	@JSONField(name: "person_name")
	String? personName;
	@JSONField(name: "start_date")
	String? startDate;
	@JSONField(name: "total_value_by_category")
	GetRangeExpenseTotalValueByCategory? totalValueByCategory;

	GetRangeExpenseEntity();

	factory GetRangeExpenseEntity.fromJson(Map<String, dynamic> json) => $GetRangeExpenseEntityFromJson(json);

	Map<String, dynamic> toJson() => $GetRangeExpenseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GetRangeExpenseTotalValueByCategory {
	@JSONField(name: "Food")
	String? food;
	@JSONField(name: "Fuel")
	String? fuel;
	@JSONField(name: "MISC")
	String? mISC;
	@JSONField(name: "Material")
	String? material;
	@JSONField(name: "Travel")
	String? travel;

	GetRangeExpenseTotalValueByCategory();

	factory GetRangeExpenseTotalValueByCategory.fromJson(Map<String, dynamic> json) => $GetRangeExpenseTotalValueByCategoryFromJson(json);

	Map<String, dynamic> toJson() => $GetRangeExpenseTotalValueByCategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}