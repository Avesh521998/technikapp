import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/base/status_checker_entity.dart';

StatusCheckerEntity $StatusCheckerEntityFromJson(Map<String, dynamic> json) {
  final StatusCheckerEntity statusCheckerEntity = StatusCheckerEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    statusCheckerEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    statusCheckerEntity.message = message;
  }
  return statusCheckerEntity;
}

Map<String, dynamic> $StatusCheckerEntityToJson(StatusCheckerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  return data;
}

extension StatusCheckerEntityExtension on StatusCheckerEntity {
  StatusCheckerEntity copyWith({
    int? status,
    String? message,
  }) {
    return StatusCheckerEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message;
  }
}