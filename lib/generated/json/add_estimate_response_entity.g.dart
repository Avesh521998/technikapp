import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/add_estimate_response_entity.dart';

AddEstimateResponseEntity $AddEstimateResponseEntityFromJson(
    Map<String, dynamic> json) {
  final AddEstimateResponseEntity addEstimateResponseEntity = AddEstimateResponseEntity();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    addEstimateResponseEntity.message = message;
  }
  return addEstimateResponseEntity;
}

Map<String, dynamic> $AddEstimateResponseEntityToJson(
    AddEstimateResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message'] = entity.message;
  return data;
}

extension AddEstimateResponseEntityExtension on AddEstimateResponseEntity {
  AddEstimateResponseEntity copyWith({
    String? message,
  }) {
    return AddEstimateResponseEntity()
      ..message = message ?? this.message;
  }
}