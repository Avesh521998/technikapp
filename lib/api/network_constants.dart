enum APIResultType {
  LOADING,
  SUCCESS,
  FAILURE,
  SESSION_EXPIRED,
  NO_INTERNET,
}

enum NetworkResultType {
  SUCCESS,
  ERROR,
  SESSION_EXPIRED,
  NO_INTERNET,
}

class APIResultConstant {
  APIResultConstant._();

  static const int ERROR = 0;
  static const int SUCCESS = 1;
  static const int SESSION_EXPIRED = 2;
}

class NetworkConstant {
  NetworkConstant._();

  static const String _BASE_URL = "https://crm.migarch.in";
  static const String BASE_URL = _BASE_URL;
  static const String BASE_URL_API = "$_BASE_URL/api";


  static const String AUTHORIZATION = "Authorization";
  static const String BEARER = "Bearer ";
  static const String SIGN_IN = "login";
  static const String GET_EXPENCE = "get_expenses";
  static const String ADD_EXPENCE = "add_expense";
  static const String UPDATE_EXPENCE = "update_expense";
  static const String GET_PROJECT = "get_projects";
}
