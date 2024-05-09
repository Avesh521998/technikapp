import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technikapp/api/model/request/add_expense_request_entity.dart';
import 'package:technikapp/api/model/request/edit_expense_request_entity.dart';
import 'package:technikapp/api/model/response/add_estimate_response_entity.dart';

import '../../../api/api_helper.dart';
import '../../../api/base/api_result.dart';
import '../../../api/base/base_response_manager.dart';
import '../../../api/network_constants.dart';

class AddEstimateCubit extends Cubit<APIResult<AddEstimateResponseEntity>?> {
  AddEstimateCubit() : super(null);

  Future<void> addExpenseAPI(AddExpenseRequestEntity addExpenseRequestEntity) async {
    emit(APIResult.loading());
    var baseParameters = (addExpenseRequestEntity.toJson());
    var networkResult = await APIHelper.instance
        .callPostApi(NetworkConstant.ADD_EXPENCE, baseParameters,headerShow: false);
    var apiResultFromNetwork =
    getAPIResultFromNetworkWithoutBase<AddEstimateResponseEntity>(networkResult);
    emit(apiResultFromNetwork);
  }
}
class EditEstimateCubit extends Cubit<APIResult<AddEstimateResponseEntity>?> {
  EditEstimateCubit() : super(null);

  Future<void> editExpenseAPI(EditExpenseRequestEntity addExpenseRequestEntity,String selectedId) async {
    emit(APIResult.loading());
    var baseParameters = (addExpenseRequestEntity.toJson());
    var networkResult = await APIHelper.instance
        .callNewPutApi("${NetworkConstant.UPDATE_EXPENCE}/$selectedId", baseParameters);
    var apiResultFromNetwork =
    getAPIResultFromNetworkWithoutBase<AddEstimateResponseEntity>(networkResult);
    emit(apiResultFromNetwork);
  }
}