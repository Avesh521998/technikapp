import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/get_range_expense_entity.dart';

GetRangeExpenseEntity $GetRangeExpenseEntityFromJson(
    Map<String, dynamic> json) {
  final GetRangeExpenseEntity getRangeExpenseEntity = GetRangeExpenseEntity();
  final String? endDate = jsonConvert.convert<String>(json['end_date']);
  if (endDate != null) {
    getRangeExpenseEntity.endDate = endDate;
  }
  final String? overallTotalValue = jsonConvert.convert<String>(
      json['overall_total_value']);
  if (overallTotalValue != null) {
    getRangeExpenseEntity.overallTotalValue = overallTotalValue;
  }
  final String? personName = jsonConvert.convert<String>(json['person_name']);
  if (personName != null) {
    getRangeExpenseEntity.personName = personName;
  }
  final String? startDate = jsonConvert.convert<String>(json['start_date']);
  if (startDate != null) {
    getRangeExpenseEntity.startDate = startDate;
  }
  final GetRangeExpenseTotalValueByCategory? totalValueByCategory = jsonConvert
      .convert<GetRangeExpenseTotalValueByCategory>(
      json['total_value_by_category']);
  if (totalValueByCategory != null) {
    getRangeExpenseEntity.totalValueByCategory = totalValueByCategory;
  }
  return getRangeExpenseEntity;
}

Map<String, dynamic> $GetRangeExpenseEntityToJson(
    GetRangeExpenseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['end_date'] = entity.endDate;
  data['overall_total_value'] = entity.overallTotalValue;
  data['person_name'] = entity.personName;
  data['start_date'] = entity.startDate;
  data['total_value_by_category'] = entity.totalValueByCategory?.toJson();
  return data;
}

extension GetRangeExpenseEntityExtension on GetRangeExpenseEntity {
  GetRangeExpenseEntity copyWith({
    String? endDate,
    String? overallTotalValue,
    String? personName,
    String? startDate,
    GetRangeExpenseTotalValueByCategory? totalValueByCategory,
  }) {
    return GetRangeExpenseEntity()
      ..endDate = endDate ?? this.endDate
      ..overallTotalValue = overallTotalValue ?? this.overallTotalValue
      ..personName = personName ?? this.personName
      ..startDate = startDate ?? this.startDate
      ..totalValueByCategory = totalValueByCategory ??
          this.totalValueByCategory;
  }
}

GetRangeExpenseTotalValueByCategory $GetRangeExpenseTotalValueByCategoryFromJson(
    Map<String, dynamic> json) {
  final GetRangeExpenseTotalValueByCategory getRangeExpenseTotalValueByCategory = GetRangeExpenseTotalValueByCategory();
  final String? food = jsonConvert.convert<String>(json['Food']);
  if (food != null) {
    getRangeExpenseTotalValueByCategory.food = food;
  }
  final String? fuel = jsonConvert.convert<String>(json['Fuel']);
  if (fuel != null) {
    getRangeExpenseTotalValueByCategory.fuel = fuel;
  }
  final String? mISC = jsonConvert.convert<String>(json['MISC']);
  if (mISC != null) {
    getRangeExpenseTotalValueByCategory.mISC = mISC;
  }
  final String? material = jsonConvert.convert<String>(json['Material']);
  if (material != null) {
    getRangeExpenseTotalValueByCategory.material = material;
  }
  final String? travel = jsonConvert.convert<String>(json['Travel']);
  if (travel != null) {
    getRangeExpenseTotalValueByCategory.travel = travel;
  }
  return getRangeExpenseTotalValueByCategory;
}

Map<String, dynamic> $GetRangeExpenseTotalValueByCategoryToJson(
    GetRangeExpenseTotalValueByCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Food'] = entity.food;
  data['Fuel'] = entity.fuel;
  data['MISC'] = entity.mISC;
  data['Material'] = entity.material;
  data['Travel'] = entity.travel;
  return data;
}

extension GetRangeExpenseTotalValueByCategoryExtension on GetRangeExpenseTotalValueByCategory {
  GetRangeExpenseTotalValueByCategory copyWith({
    String? food,
    String? fuel,
    String? mISC,
    String? material,
    String? travel,
  }) {
    return GetRangeExpenseTotalValueByCategory()
      ..food = food ?? this.food
      ..fuel = fuel ?? this.fuel
      ..mISC = mISC ?? this.mISC
      ..material = material ?? this.material
      ..travel = travel ?? this.travel;
  }
}