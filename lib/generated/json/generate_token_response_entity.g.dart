import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/generate_token_response_entity.dart';

GenerateTokenResponseEntity $GenerateTokenResponseEntityFromJson(
    Map<String, dynamic> json) {
  final GenerateTokenResponseEntity generateTokenResponseEntity = GenerateTokenResponseEntity();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    generateTokenResponseEntity.message = message;
  }
  final String? mid = jsonConvert.convert<String>(json['mid']);
  if (mid != null) {
    generateTokenResponseEntity.mid = mid;
  }
  final String? txnToken = jsonConvert.convert<String>(json['txnToken']);
  if (txnToken != null) {
    generateTokenResponseEntity.txnToken = txnToken;
  }
  final String? orderId = jsonConvert.convert<String>(json['orderId']);
  if (orderId != null) {
    generateTokenResponseEntity.orderId = orderId;
  }
  return generateTokenResponseEntity;
}

Map<String, dynamic> $GenerateTokenResponseEntityToJson(
    GenerateTokenResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message'] = entity.message;
  data['mid'] = entity.mid;
  data['txnToken'] = entity.txnToken;
  data['orderId'] = entity.orderId;
  return data;
}

extension GenerateTokenResponseEntityExtension on GenerateTokenResponseEntity {
  GenerateTokenResponseEntity copyWith({
    String? message,
    String? mid,
    String? txnToken,
    String? orderId,
  }) {
    return GenerateTokenResponseEntity()
      ..message = message ?? this.message
      ..mid = mid ?? this.mid
      ..txnToken = txnToken ?? this.txnToken
      ..orderId = orderId ?? this.orderId;
  }
}