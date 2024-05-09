import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/api_helper.dart';
import '../../../api/base/api_result.dart';
import '../../../api/base/base_response_manager.dart';
import '../../../api/model/request/login_request_entity.dart';
import '../../../api/model/response/login_response_entity.dart';
import '../../../api/network_constants.dart';

class SignInCubit extends Cubit<APIResult<LoginResponseEntity>?> {
  SignInCubit() : super(null);

  Future<void> callLoginAPI(LoginRequestEntity signInRequestEntity) async {
    emit(APIResult.loading());
    var baseParameters = (signInRequestEntity.toJson());
    var networkResult = await APIHelper.instance
        .callPostApi(NetworkConstant.SIGN_IN, baseParameters,headerShow: false);
    var apiResultFromNetwork =
    getAPIResultFromNetworkWithoutBase<LoginResponseEntity>(networkResult);
    emit(apiResultFromNetwork);
  }
}