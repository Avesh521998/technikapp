class Constant {
  static const String MAP_ASSET_PATH = "assets/map/map_v4.html";

  static const String PASSWORD_PATTERN =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  static const String NUMERIC_PATTERN = r'^[0-9]+$';

  static const CURRENCY = "INR";
  static String TOTAL_ORDERS = "0";

  static const String PREF_LOGIN_DATA = "PREF_LOGIN_DATA";
  static const String HOTEL_DATA = "HOTEL_DATA";
  static const String USER_ADDRESS = "USER_ADDRESS";
  static const String PREF_AUTH_TOKEN = "PREF_AUTH_TOKEN";
  static const String GET_TOTAL = "GET_TOTAL";
  static const String PREF_FIREBASE_TOKEN = "PREF_FIREBASE_TOKEN";
  static const String PREF_IS_INTRO_FINISHED_BOOL =
      "PREF_IS_INTRO_FINISHED_BOOL";
  static const String PREF_USER_LOGIN_FIRST_TIME_BOOL =
      "PREF_USER_LOGIN_FIRST_TIME_BOOL";
  static const String PREF_LOGIN_BOOL = "PREF_LOGIN_BOOL";

  static const int PHONE_NUMBER_MIN_LENGTH = 10;
  static const int PHONE_NUMBER_MAX_LENGTH = 10;


  static const String ENGLISH_LANGUAGE_CODE = "en";
  static const String GUJARATI_LANGUAGE_CODE = "gu";
  static const String PREF_SELECTED_LANGUAGE_CODE =
      "PREF_SELECTED_LANGUAGE_CODE";
  static const String PREF_LANGUAGE_LABELS = "PREF_LANGUAGE_LABELS";
  static const String PREF_LAST_LABEL_FETCH_TIME_STAMP =
      "PREF_LAST_LABEL_FETCH_TIME_STAMP";

  // ignore: non_constant_identifier_names
  static double COMMON_PADDING_FOR_SCREEN = 20;
  static const double COMMON_RADIUS_FOR_WIDGETS = 3;
  static const double COMMON_RADIUS_FOR_WIDGETS_SMALL = 6;
  static const double COMMON_RADIUS_FOR_WIDGETS_LARGE = 16;
  static const double COMMON_RADIUS_FOR_BUTTONS = 5;
  static const String PRODUCT_ID = "PRODUCT_ID";

}

class NotificationConstant {
  //Common keys for all types
  static const String TITLE_KEY = "title";
  static const String MESSAGE_KEY = "body";
  static const String NOTIFICATION_TYPE_KEY = "notification_type";
}

class DynamicLinkConstant {
  static const String TYPE_KEY = "type";
  static const String COMMUNITY_TYPE = "community";
  static const String ID_KEY = "id";
  static const String NAME_KEY = "name";
}

class MainDashBoardNavigationScreens {
  static const int ALL = -1;

  static const int HOME = 0;
  static const int ACTIVE = 1;

  //static const int CONFIRMED = 2;
  static const int CANCELED = 2;
  static const int DELIVERED = 3;
  static const int UNDELIVERED = 4;
  static const int PENDING = 5;
}

