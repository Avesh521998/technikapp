import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/pagination_with_search_request_entity.g.dart';

@JsonSerializable()
class PaginationWithSearchRequestEntity {

	PaginationWithSearchRequestEntity();

	factory PaginationWithSearchRequestEntity.fromJson(Map<String, dynamic> json) => $PaginationWithSearchRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $PaginationWithSearchRequestEntityToJson(this);

	@JSONField(name: "page_no")
	String? pageNo;
	String? offset = "10";
	String? name;
	@JSONField(name: "type")
	String? type;
	@JSONField(name: "product_category")
	int? productCategory;
}
