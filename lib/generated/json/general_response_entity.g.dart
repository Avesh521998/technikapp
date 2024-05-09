import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/general_response_entity.dart';

GeneralResponseEntity $GeneralResponseEntityFromJson(
    Map<String, dynamic> json) {
  final GeneralResponseEntity generalResponseEntity = GeneralResponseEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    generalResponseEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    generalResponseEntity.message = message;
  }
  return generalResponseEntity;
}

Map<String, dynamic> $GeneralResponseEntityToJson(
    GeneralResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  return data;
}

extension GeneralResponseEntityExtension on GeneralResponseEntity {
  GeneralResponseEntity copyWith({
    int? status,
    String? message,
  }) {
    return GeneralResponseEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message;
  }
}