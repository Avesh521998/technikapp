import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/get_project_response_list_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/get_project_response_list_entity.g.dart';

@JsonSerializable()
class GetProjectResponseListEntity {
	@JSONField(name: "Company")
	String? company;
	@JSONField(name: "CompanyID")
	String? companyID;
	@JSONField(name: "ContactPersonCustomer")
	String? contactPersonCustomer;
	@JSONField(name: "ContactPersonTechnik")
	String? contactPersonTechnik;
	@JSONField(name: "ID")
	String? iD;
	@JSONField(name: "POType")
	String? pOType;
	@JSONField(name: "PaymentTerms")
	String? paymentTerms;
	@JSONField(name: "PoDate")
	String? poDate;
	@JSONField(name: "PoNumber")
	String? poNumber;
	@JSONField(name: "ProjectName")
	String? projectName;
	@JSONField(name: "Status")
	String? status;
	@JSONField(name: "TargetDate")
	String? targetDate;
	String? address;
	@JSONField(name: "created_at")
	String? createdAt;
	@JSONField(name: "gst_no")
	String? gstNo;
	@JSONField(name: "serial_number")
	String? serialNumber;
	@JSONField(name: "service_files")
	List<dynamic>? serviceFiles;
	@JSONField(name: "supply_files")
	List<GetProjectResponseListSupplyFiles>? supplyFiles;
	@JSONField(name: "technik_company")
	String? technikCompany;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "user_id")
	String? userId;

	GetProjectResponseListEntity();

	factory GetProjectResponseListEntity.fromJson(Map<String, dynamic> json) => $GetProjectResponseListEntityFromJson(json);

	Map<String, dynamic> toJson() => $GetProjectResponseListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GetProjectResponseListSupplyFiles {
	@JSONField(name: "file_id")
	String? fileId;
	@JSONField(name: "file_path")
	String? filePath;
	String? filename;

	GetProjectResponseListSupplyFiles();

	factory GetProjectResponseListSupplyFiles.fromJson(Map<String, dynamic> json) => $GetProjectResponseListSupplyFilesFromJson(json);

	Map<String, dynamic> toJson() => $GetProjectResponseListSupplyFilesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}