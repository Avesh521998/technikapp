import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/get_project_response_list_entity.dart';

GetProjectResponseListEntity $GetProjectResponseListEntityFromJson(
    Map<String, dynamic> json) {
  final GetProjectResponseListEntity getProjectResponseListEntity = GetProjectResponseListEntity();
  final String? company = jsonConvert.convert<String>(json['Company']);
  if (company != null) {
    getProjectResponseListEntity.company = company;
  }
  final String? companyID = jsonConvert.convert<String>(json['CompanyID']);
  if (companyID != null) {
    getProjectResponseListEntity.companyID = companyID;
  }
  final String? contactPersonCustomer = jsonConvert.convert<String>(
      json['ContactPersonCustomer']);
  if (contactPersonCustomer != null) {
    getProjectResponseListEntity.contactPersonCustomer = contactPersonCustomer;
  }
  final String? contactPersonTechnik = jsonConvert.convert<String>(
      json['ContactPersonTechnik']);
  if (contactPersonTechnik != null) {
    getProjectResponseListEntity.contactPersonTechnik = contactPersonTechnik;
  }
  final String? iD = jsonConvert.convert<String>(json['ID']);
  if (iD != null) {
    getProjectResponseListEntity.iD = iD;
  }
  final String? pOType = jsonConvert.convert<String>(json['POType']);
  if (pOType != null) {
    getProjectResponseListEntity.pOType = pOType;
  }
  final String? paymentTerms = jsonConvert.convert<String>(
      json['PaymentTerms']);
  if (paymentTerms != null) {
    getProjectResponseListEntity.paymentTerms = paymentTerms;
  }
  final String? poDate = jsonConvert.convert<String>(json['PoDate']);
  if (poDate != null) {
    getProjectResponseListEntity.poDate = poDate;
  }
  final String? poNumber = jsonConvert.convert<String>(json['PoNumber']);
  if (poNumber != null) {
    getProjectResponseListEntity.poNumber = poNumber;
  }
  final String? projectName = jsonConvert.convert<String>(json['ProjectName']);
  if (projectName != null) {
    getProjectResponseListEntity.projectName = projectName;
  }
  final String? status = jsonConvert.convert<String>(json['Status']);
  if (status != null) {
    getProjectResponseListEntity.status = status;
  }
  final String? targetDate = jsonConvert.convert<String>(json['TargetDate']);
  if (targetDate != null) {
    getProjectResponseListEntity.targetDate = targetDate;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    getProjectResponseListEntity.address = address;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    getProjectResponseListEntity.createdAt = createdAt;
  }
  final String? gstNo = jsonConvert.convert<String>(json['gst_no']);
  if (gstNo != null) {
    getProjectResponseListEntity.gstNo = gstNo;
  }
  final String? serialNumber = jsonConvert.convert<String>(
      json['serial_number']);
  if (serialNumber != null) {
    getProjectResponseListEntity.serialNumber = serialNumber;
  }
  final List<dynamic>? serviceFiles = (json['service_files'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (serviceFiles != null) {
    getProjectResponseListEntity.serviceFiles = serviceFiles;
  }
  final List<
      GetProjectResponseListSupplyFiles>? supplyFiles = (json['supply_files'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GetProjectResponseListSupplyFiles>(
          e) as GetProjectResponseListSupplyFiles).toList();
  if (supplyFiles != null) {
    getProjectResponseListEntity.supplyFiles = supplyFiles;
  }
  final String? technikCompany = jsonConvert.convert<String>(
      json['technik_company']);
  if (technikCompany != null) {
    getProjectResponseListEntity.technikCompany = technikCompany;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    getProjectResponseListEntity.updatedAt = updatedAt;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    getProjectResponseListEntity.userId = userId;
  }
  return getProjectResponseListEntity;
}

Map<String, dynamic> $GetProjectResponseListEntityToJson(
    GetProjectResponseListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Company'] = entity.company;
  data['CompanyID'] = entity.companyID;
  data['ContactPersonCustomer'] = entity.contactPersonCustomer;
  data['ContactPersonTechnik'] = entity.contactPersonTechnik;
  data['ID'] = entity.iD;
  data['POType'] = entity.pOType;
  data['PaymentTerms'] = entity.paymentTerms;
  data['PoDate'] = entity.poDate;
  data['PoNumber'] = entity.poNumber;
  data['ProjectName'] = entity.projectName;
  data['Status'] = entity.status;
  data['TargetDate'] = entity.targetDate;
  data['address'] = entity.address;
  data['created_at'] = entity.createdAt;
  data['gst_no'] = entity.gstNo;
  data['serial_number'] = entity.serialNumber;
  data['service_files'] = entity.serviceFiles;
  data['supply_files'] = entity.supplyFiles?.map((v) => v.toJson()).toList();
  data['technik_company'] = entity.technikCompany;
  data['updated_at'] = entity.updatedAt;
  data['user_id'] = entity.userId;
  return data;
}

extension GetProjectResponseListEntityExtension on GetProjectResponseListEntity {
  GetProjectResponseListEntity copyWith({
    String? company,
    String? companyID,
    String? contactPersonCustomer,
    String? contactPersonTechnik,
    String? iD,
    String? pOType,
    String? paymentTerms,
    String? poDate,
    String? poNumber,
    String? projectName,
    String? status,
    String? targetDate,
    String? address,
    String? createdAt,
    String? gstNo,
    String? serialNumber,
    List<dynamic>? serviceFiles,
    List<GetProjectResponseListSupplyFiles>? supplyFiles,
    String? technikCompany,
    String? updatedAt,
    String? userId,
  }) {
    return GetProjectResponseListEntity()
      ..company = company ?? this.company
      ..companyID = companyID ?? this.companyID
      ..contactPersonCustomer = contactPersonCustomer ??
          this.contactPersonCustomer
      ..contactPersonTechnik = contactPersonTechnik ?? this.contactPersonTechnik
      ..iD = iD ?? this.iD
      ..pOType = pOType ?? this.pOType
      ..paymentTerms = paymentTerms ?? this.paymentTerms
      ..poDate = poDate ?? this.poDate
      ..poNumber = poNumber ?? this.poNumber
      ..projectName = projectName ?? this.projectName
      ..status = status ?? this.status
      ..targetDate = targetDate ?? this.targetDate
      ..address = address ?? this.address
      ..createdAt = createdAt ?? this.createdAt
      ..gstNo = gstNo ?? this.gstNo
      ..serialNumber = serialNumber ?? this.serialNumber
      ..serviceFiles = serviceFiles ?? this.serviceFiles
      ..supplyFiles = supplyFiles ?? this.supplyFiles
      ..technikCompany = technikCompany ?? this.technikCompany
      ..updatedAt = updatedAt ?? this.updatedAt
      ..userId = userId ?? this.userId;
  }
}

GetProjectResponseListSupplyFiles $GetProjectResponseListSupplyFilesFromJson(
    Map<String, dynamic> json) {
  final GetProjectResponseListSupplyFiles getProjectResponseListSupplyFiles = GetProjectResponseListSupplyFiles();
  final String? fileId = jsonConvert.convert<String>(json['file_id']);
  if (fileId != null) {
    getProjectResponseListSupplyFiles.fileId = fileId;
  }
  final String? filePath = jsonConvert.convert<String>(json['file_path']);
  if (filePath != null) {
    getProjectResponseListSupplyFiles.filePath = filePath;
  }
  final String? filename = jsonConvert.convert<String>(json['filename']);
  if (filename != null) {
    getProjectResponseListSupplyFiles.filename = filename;
  }
  return getProjectResponseListSupplyFiles;
}

Map<String, dynamic> $GetProjectResponseListSupplyFilesToJson(
    GetProjectResponseListSupplyFiles entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['file_id'] = entity.fileId;
  data['file_path'] = entity.filePath;
  data['filename'] = entity.filename;
  return data;
}

extension GetProjectResponseListSupplyFilesExtension on GetProjectResponseListSupplyFiles {
  GetProjectResponseListSupplyFiles copyWith({
    String? fileId,
    String? filePath,
    String? filename,
  }) {
    return GetProjectResponseListSupplyFiles()
      ..fileId = fileId ?? this.fileId
      ..filePath = filePath ?? this.filePath
      ..filename = filename ?? this.filename;
  }
}