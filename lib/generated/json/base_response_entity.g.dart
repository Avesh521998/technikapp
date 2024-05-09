import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/base/base_response_entity.dart';

BaseResponseEntity $BaseResponseEntityFromJson(Map<String, dynamic> json) {
  final BaseResponseEntity baseResponseEntity = BaseResponseEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    baseResponseEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    baseResponseEntity.message = message;
  }
  final dynamic data = json['data'];
  if (data != null) {
    baseResponseEntity.data = data;
  }
  return baseResponseEntity;
}

Map<String, dynamic> $BaseResponseEntityToJson(BaseResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data;
  return data;
}

extension BaseResponseEntityExtension on BaseResponseEntity {
  BaseResponseEntity copyWith({
    int? status,
    String? message,
    dynamic data,
  }) {
    return BaseResponseEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}