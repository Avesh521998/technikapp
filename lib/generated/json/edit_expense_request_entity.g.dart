import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/request/edit_expense_request_entity.dart';

EditExpenseRequestEntity $EditExpenseRequestEntityFromJson(
    Map<String, dynamic> json) {
  final EditExpenseRequestEntity editExpenseRequestEntity = EditExpenseRequestEntity();
  final String? projectName = jsonConvert.convert<String>(json['project_name']);
  if (projectName != null) {
    editExpenseRequestEntity.projectName = projectName;
  }
  final String? personName = jsonConvert.convert<String>(json['person_name']);
  if (personName != null) {
    editExpenseRequestEntity.personName = personName;
  }
  final String? typeOfExpense = jsonConvert.convert<String>(
      json['type_of_expense']);
  if (typeOfExpense != null) {
    editExpenseRequestEntity.typeOfExpense = typeOfExpense;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    editExpenseRequestEntity.description = description;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    editExpenseRequestEntity.date = date;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    editExpenseRequestEntity.value = value;
  }
  return editExpenseRequestEntity;
}

Map<String, dynamic> $EditExpenseRequestEntityToJson(
    EditExpenseRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['project_name'] = entity.projectName;
  data['person_name'] = entity.personName;
  data['type_of_expense'] = entity.typeOfExpense;
  data['description'] = entity.description;
  data['date'] = entity.date;
  data['value'] = entity.value;
  return data;
}

extension EditExpenseRequestEntityExtension on EditExpenseRequestEntity {
  EditExpenseRequestEntity copyWith({
    String? projectName,
    String? personName,
    String? typeOfExpense,
    String? description,
    String? date,
    String? value,
  }) {
    return EditExpenseRequestEntity()
      ..projectName = projectName ?? this.projectName
      ..personName = personName ?? this.personName
      ..typeOfExpense = typeOfExpense ?? this.typeOfExpense
      ..description = description ?? this.description
      ..date = date ?? this.date
      ..value = value ?? this.value;
  }
}