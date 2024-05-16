import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/get_project_expense_entity.dart';

GetProjectExpenseEntity $GetProjectExpenseEntityFromJson(
    Map<String, dynamic> json) {
  final GetProjectExpenseEntity getProjectExpenseEntity = GetProjectExpenseEntity();
  final String? month = jsonConvert.convert<String>(json['month']);
  if (month != null) {
    getProjectExpenseEntity.month = month;
  }
  final String? personName = jsonConvert.convert<String>(json['person_name']);
  if (personName != null) {
    getProjectExpenseEntity.personName = personName;
  }
  final String? totalValue = jsonConvert.convert<String>(json['total_value']);
  if (totalValue != null) {
    getProjectExpenseEntity.totalValue = totalValue;
  }
  return getProjectExpenseEntity;
}

Map<String, dynamic> $GetProjectExpenseEntityToJson(
    GetProjectExpenseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['month'] = entity.month;
  data['person_name'] = entity.personName;
  data['total_value'] = entity.totalValue;
  return data;
}

extension GetProjectExpenseEntityExtension on GetProjectExpenseEntity {
  GetProjectExpenseEntity copyWith({
    String? month,
    String? personName,
    String? totalValue,
  }) {
    return GetProjectExpenseEntity()
      ..month = month ?? this.month
      ..personName = personName ?? this.personName
      ..totalValue = totalValue ?? this.totalValue;
  }
}