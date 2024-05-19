import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/get_project_expense_entity.dart';
import '../../api/model/response/get_range_expense_entity.dart';

GetProjectExpenseEntity $GetProjectExpenseEntityFromJson(
    Map<String, dynamic> json) {
  final GetProjectExpenseEntity getProjectExpenseEntity = GetProjectExpenseEntity();
  final String? month = jsonConvert.convert<String>(json['month']);
  if (month != null) {
    getProjectExpenseEntity.month = month;
  }
  final String? overallTotalValue = jsonConvert.convert<String>(
      json['overall_total_value']);
  if (overallTotalValue != null) {
    getProjectExpenseEntity.overallTotalValue = overallTotalValue;
  }
  final String? personName = jsonConvert.convert<String>(json['person_name']);
  if (personName != null) {
    getProjectExpenseEntity.personName = personName;
  }
  final GetRangeExpenseTotalValueByCategory? totalValueByCategory = jsonConvert
      .convert<GetRangeExpenseTotalValueByCategory>(
      json['total_value_by_category']);
  if (totalValueByCategory != null) {
    getProjectExpenseEntity.totalValueByCategory = totalValueByCategory;
  }
  return getProjectExpenseEntity;
}

Map<String, dynamic> $GetProjectExpenseEntityToJson(
    GetProjectExpenseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['month'] = entity.month;
  data['overall_total_value'] = entity.overallTotalValue;
  data['person_name'] = entity.personName;
  data['total_value_by_category'] = entity.totalValueByCategory?.toJson();
  return data;
}

extension GetProjectExpenseEntityExtension on GetProjectExpenseEntity {
  GetProjectExpenseEntity copyWith({
    String? month,
    String? overallTotalValue,
    String? personName,
    GetRangeExpenseTotalValueByCategory? totalValueByCategory,
  }) {
    return GetProjectExpenseEntity()
      ..month = month ?? this.month
      ..overallTotalValue = overallTotalValue ?? this.overallTotalValue
      ..personName = personName ?? this.personName
      ..totalValueByCategory = totalValueByCategory ??
          this.totalValueByCategory;
  }
}