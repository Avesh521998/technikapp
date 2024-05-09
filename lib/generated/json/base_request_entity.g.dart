import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/base/base_request_entity.dart';

BaseRequestEntity $BaseRequestEntityFromJson(Map<String, dynamic> json) {
  final BaseRequestEntity baseRequestEntity = BaseRequestEntity();
  final dynamic data = json['data'];
  if (data != null) {
    baseRequestEntity.data = data;
  }
  return baseRequestEntity;
}

Map<String, dynamic> $BaseRequestEntityToJson(BaseRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data;
  return data;
}

extension BaseRequestEntityExtension on BaseRequestEntity {
  BaseRequestEntity copyWith({
    dynamic data,
  }) {
    return BaseRequestEntity()
      ..data = data ?? this.data;
  }
}