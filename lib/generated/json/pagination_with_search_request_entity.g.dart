import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/request/pagination_with_search_request_entity.dart';

PaginationWithSearchRequestEntity $PaginationWithSearchRequestEntityFromJson(
    Map<String, dynamic> json) {
  final PaginationWithSearchRequestEntity paginationWithSearchRequestEntity = PaginationWithSearchRequestEntity();
  final String? pageNo = jsonConvert.convert<String>(json['page_no']);
  if (pageNo != null) {
    paginationWithSearchRequestEntity.pageNo = pageNo;
  }
  final String? offset = jsonConvert.convert<String>(json['offset']);
  if (offset != null) {
    paginationWithSearchRequestEntity.offset = offset;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    paginationWithSearchRequestEntity.name = name;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    paginationWithSearchRequestEntity.type = type;
  }
  final int? productCategory = jsonConvert.convert<int>(
      json['product_category']);
  if (productCategory != null) {
    paginationWithSearchRequestEntity.productCategory = productCategory;
  }
  return paginationWithSearchRequestEntity;
}

Map<String, dynamic> $PaginationWithSearchRequestEntityToJson(
    PaginationWithSearchRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['page_no'] = entity.pageNo;
  data['offset'] = entity.offset;
  data['name'] = entity.name;
  data['type'] = entity.type;
  data['product_category'] = entity.productCategory;
  return data;
}

extension PaginationWithSearchRequestEntityExtension on PaginationWithSearchRequestEntity {
  PaginationWithSearchRequestEntity copyWith({
    String? pageNo,
    String? offset,
    String? name,
    String? type,
    int? productCategory,
  }) {
    return PaginationWithSearchRequestEntity()
      ..pageNo = pageNo ?? this.pageNo
      ..offset = offset ?? this.offset
      ..name = name ?? this.name
      ..type = type ?? this.type
      ..productCategory = productCategory ?? this.productCategory;
  }
}