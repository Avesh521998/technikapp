import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_helper.dart';
import '../../../api/base/api_result.dart';
import '../../../api/base/base_response_manager.dart';
import '../../../api/model/response/get_estimate_list_response_entity.dart';
import '../../../api/model/response/get_project_response_list_entity.dart';
import '../../../api/network_constants.dart';

class GetEstimateListCubit extends Cubit<APIResult<List<GetEstimateListResponseEntity>>?> {
  GetEstimateListCubit() : super(null);

  Future<void> getEstimateList() async {
    emit(APIResult.loading());
    var networkResult =
    await APIHelper.instance.callGetApi(NetworkConstant.GET_EXPENCE, null);
    var apiResultFromNetwork =
    getAPIResultFromNetworkWithoutBase<List<GetEstimateListResponseEntity>>(
        networkResult);
    emit(apiResultFromNetwork);
  }
}

class GetProjectListCubit extends Cubit<APIResult<List<GetProjectResponseListEntity>>?> {
  GetProjectListCubit() : super(null);

  Future<void> getProjectList() async {
    emit(APIResult.loading());
    var networkResult =
    await APIHelper.instance.callGetApi(NetworkConstant.GET_PROJECT, null);
    var apiResultFromNetwork =
    getAPIResultFromNetworkWithoutBase<List<GetProjectResponseListEntity>>(
        networkResult);
    emit(apiResultFromNetwork);
  }
}