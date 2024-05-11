import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technikapp/api/model/response/logout_response_entity.dart';
import '../../../api/api_helper.dart';
import '../../../api/base/api_result.dart';
import '../../../api/base/base_response_manager.dart';
import '../../../api/network_constants.dart';

class LogoutCubit extends Cubit<APIResult<LogoutResponseEntity>?>{
  LogoutCubit() : super(null);

  Future<void> logout() async {
    emit(APIResult.loading());
    var networkResult = await APIHelper.instance
        .callPostApi(NetworkConstant.LOGOUT, "");
    var apiResultFromNetwork =
    getAPIResultFromNetworkWithoutBase<LogoutResponseEntity>(networkResult);
    emit(apiResultFromNetwork);
  }
}