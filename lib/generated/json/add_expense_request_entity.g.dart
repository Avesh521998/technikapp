import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/request/add_expense_request_entity.dart';

AddExpenseRequestEntity $AddExpenseRequestEntityFromJson(
    Map<String, dynamic> json) {
  final AddExpenseRequestEntity addExpenseRequestEntity = AddExpenseRequestEntity();
  final String? projectId = jsonConvert.convert<String>(json['project_id']);
  if (projectId != null) {
    addExpenseRequestEntity.projectId = projectId;
  }
  final String? projectName = jsonConvert.convert<String>(json['project_name']);
  if (projectName != null) {
    addExpenseRequestEntity.projectName = projectName;
  }
  final String? personName = jsonConvert.convert<String>(json['person_name']);
  if (personName != null) {
    addExpenseRequestEntity.personName = personName;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    addExpenseRequestEntity.description = description;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    addExpenseRequestEntity.date = date;
  }
  final String? typeOfExpense = jsonConvert.convert<String>(
      json['type_of_expense']);
  if (typeOfExpense != null) {
    addExpenseRequestEntity.typeOfExpense = typeOfExpense;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    addExpenseRequestEntity.value = value;
  }
  return addExpenseRequestEntity;
}

Map<String, dynamic> $AddExpenseRequestEntityToJson(
    AddExpenseRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['project_id'] = entity.projectId;
  data['project_name'] = entity.projectName;
  data['person_name'] = entity.personName;
  data['description'] = entity.description;
  data['date'] = entity.date;
  data['type_of_expense'] = entity.typeOfExpense;
  data['value'] = entity.value;
  return data;
}

extension AddExpenseRequestEntityExtension on AddExpenseRequestEntity {
  AddExpenseRequestEntity copyWith({
    String? projectId,
    String? projectName,
    String? personName,
    String? description,
    String? date,
    String? typeOfExpense,
    String? value,
  }) {
    return AddExpenseRequestEntity()
      ..projectId = projectId ?? this.projectId
      ..projectName = projectName ?? this.projectName
      ..personName = personName ?? this.personName
      ..description = description ?? this.description
      ..date = date ?? this.date
      ..typeOfExpense = typeOfExpense ?? this.typeOfExpense
      ..value = value ?? this.value;
  }
}