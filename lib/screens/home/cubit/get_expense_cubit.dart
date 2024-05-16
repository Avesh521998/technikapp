import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_helper.dart';
import '../../../api/base/api_result.dart';
import '../../../api/base/base_response_manager.dart';
import '../../../api/model/response/get_project_expense_entity.dart';
import '../../../api/network_constants.dart';

class GetExpenseCubit extends Cubit<APIResult<GetProjectExpenseEntity>?> {
  GetExpenseCubit() : super(null);

  Future<void> getExpenseList(String user,String type) async {
    emit(APIResult.loading());
    var networkResult =
    await APIHelper.instance.callGetApi("${NetworkConstant.GET_EXPENSE_BY_PERSON}/$user/$type", null);
    var apiResultFromNetwork =
    getAPIResultFromNetworkWithoutBase<GetProjectExpenseEntity>(
        networkResult);
    emit(apiResultFromNetwork);
  }
}