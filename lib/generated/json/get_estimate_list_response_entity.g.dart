import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/get_estimate_list_response_entity.dart';

GetEstimateListResponseEntity $GetEstimateListResponseEntityFromJson(
    Map<String, dynamic> json) {
  final GetEstimateListResponseEntity getEstimateListResponseEntity = GetEstimateListResponseEntity();
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    getEstimateListResponseEntity.createdAt = createdAt;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    getEstimateListResponseEntity.date = date;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    getEstimateListResponseEntity.description = description;
  }
  final String? expenseType = jsonConvert.convert<String>(json['expense_type']);
  if (expenseType != null) {
    getEstimateListResponseEntity.expenseType = expenseType;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    getEstimateListResponseEntity.id = id;
  }
  final String? personName = jsonConvert.convert<String>(json['person_name']);
  if (personName != null) {
    getEstimateListResponseEntity.personName = personName;
  }
  final String? projectId = jsonConvert.convert<String>(json['project_id']);
  if (projectId != null) {
    getEstimateListResponseEntity.projectId = projectId;
  }
  final String? projectName = jsonConvert.convert<String>(json['project_name']);
  if (projectName != null) {
    getEstimateListResponseEntity.projectName = projectName;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    getEstimateListResponseEntity.updatedAt = updatedAt;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    getEstimateListResponseEntity.userId = userId;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    getEstimateListResponseEntity.value = value;
  }
  final bool? isShowRemark = jsonConvert.convert<bool>(json['isShowRemark']);
  if (isShowRemark != null) {
    getEstimateListResponseEntity.isShowRemark = isShowRemark;
  }
  return getEstimateListResponseEntity;
}

Map<String, dynamic> $GetEstimateListResponseEntityToJson(
    GetEstimateListResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['created_at'] = entity.createdAt;
  data['date'] = entity.date;
  data['description'] = entity.description;
  data['expense_type'] = entity.expenseType;
  data['id'] = entity.id;
  data['person_name'] = entity.personName;
  data['project_id'] = entity.projectId;
  data['project_name'] = entity.projectName;
  data['updated_at'] = entity.updatedAt;
  data['user_id'] = entity.userId;
  data['value'] = entity.value;
  data['isShowRemark'] = entity.isShowRemark;
  return data;
}

extension GetEstimateListResponseEntityExtension on GetEstimateListResponseEntity {
  GetEstimateListResponseEntity copyWith({
    String? createdAt,
    String? date,
    String? description,
    String? expenseType,
    String? id,
    String? personName,
    String? projectId,
    String? projectName,
    String? updatedAt,
    String? userId,
    String? value,
    bool? isShowRemark,
  }) {
    return GetEstimateListResponseEntity()
      ..createdAt = createdAt ?? this.createdAt
      ..date = date ?? this.date
      ..description = description ?? this.description
      ..expenseType = expenseType ?? this.expenseType
      ..id = id ?? this.id
      ..personName = personName ?? this.personName
      ..projectId = projectId ?? this.projectId
      ..projectName = projectName ?? this.projectName
      ..updatedAt = updatedAt ?? this.updatedAt
      ..userId = userId ?? this.userId
      ..value = value ?? this.value
      ..isShowRemark = isShowRemark ?? this.isShowRemark;
  }
}