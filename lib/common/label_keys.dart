class Labels {
  Labels._();

  static const MOBILE_NO = "Mobile No :";
  static const GENDER = "Gender : ";
  static const AGE = "Age : ";
  static const CONTACTS = "Contacts";
  static const FAVOURITE = "Favourite";
  static const RETRY = "Retry";
  static const LOADING = "Loading";
  static const SESSION_EXPIRED = "Session Expire";
  static const NO_INTERNET_CONNECTION = "No Internet Connection";
  static const ERROR_OCCURRED_TRY_LATER = "Error Occurred try again later";
  static const IF_RETRY_ENABLED_NEED_CALLBACK =
      "If you re try to enable need callback";


  //Dashboard Screen
  static const DASHBOARD = "Dashboard";
  static const YES = "YES";
  static const NO = "No";

  //Login
  static const LOG_IN = "Log In";
  static const LOG_IN_CONTENT = "Just One Step Away\nTo Manage Your Expense";
  static const LOG_OUT_CONTENT = "Are you sure you want to logout?";
  static const EMAIL = "Email";
  static const USERNAME = "Username";
  static const PASSWORD = "Password";

  //Expense Screen
  static const NAME = "Name";
  static const DATE = "Date";
  static const AMOUNT = "Amount";
  static const REMARK = "Remark";
  static const SELECT_TYPE = "Select Types";
  static const ADD_EXPENCE = "Add Expense";
  static const SAVE = "Save";
  static const EDIT_EXPENCE = "Edit Expense";


  static const FUEL = "Fuel";
  static const TRAVEL = "Travel";
  static const MATERIAL = "Material";
  static const FOOD = "Food";
  static const MISC = "MISC";



}

class ValidationLabels {
  ValidationLabels._();

  static const EMAIL_PHONE_CANNOT_BLANK_VALIDATION =
      "Enter valid email or phone number";
  static const EMAIL_VALIDATION = "Enter valid email address";
  static const SELECT_TYPE = "Please select type";
  static const PROJECT_TYPE = "Please select Project Type";
  static const PASSOWRD_VALIDATION = "Enter valid password";
  static const COUNTRY_CODE_VALIDATION = "Select valid country code";
  static const PHONE_NUMBER_VALIDATION = "Enter valid phone number";
  static const DELIVERY_VALIDATION = "Select valid DeliveryTime";
  static const PLEASE_SELECT_VALID_END_DATE = "Select valid End Date";

  static const PHONE_NUMBER_LENGTH_VALIDATION =
      "Phone number should be 10 digits";
  static const NAME_VALIDATION = "Enter valid full name";
  static const FULL_NAME_VALIDATION = "Please enter First & Last name";
  static const SELECT_TERMS_AND_CONDITION =
      "Please agree to the Terms & Conditions and Privacy Policy";
  static const ABOUT_VALIDATION = "Enter about details";
  static const SELECT_START_DATE_VALIDATION = "Select valid Start Date";
  static const SELECT_END_DATE_VALIDATION = "Select valid Date";
  static const PLAESE_ENTER_VALIDATION_AMOUNT = "Enter Valid Amount";
  static const SELECT_VALID_CATEGORY = "Select Valid Category";
  static const SELECT_VALID_QUANTITY = "Select Valid Quantity";
  static const ENTER_VALID_MESSAGE = "Enter Valid Message";
  static const SELECT_VALID_STATUS = "Please select status";
  static const ENTER_REMARK = "Please enter remark";
  static const ENTER_DELIVERY_EXECUTIVE_PRICE = "Please enter delivery executive amount";
  static const ENTER_DELIVERY_EXECUTIVE_NAME = "Please enter delivery executive name";

  static const ENTER_ORDER_ID = "Please enter Order id";
  static const SELECT_VENDOR = "Please select vendor";
  static const ENTER_TRAIN_NO = "Please enter train no";
  static const ENTER_COACH_NO = "Please enter coach and seat no";
  static const ENTER_CUSTOMER_NAME = "Please enter customer name";
  static const ENTER_PNR = "Please enter PNR number";
  static const ENTER_10_DIGIT_PNR = "Please enter 10 digit PNR number";
  static const ENTER_MOBILE = "Please enter mobile number";
  static const ENTER_10_DIGIT_MOBILE = "Please enter 10 digit mobile number";
  static const SELECT_DATE = "Please select date";
  static const SELECT_TIME = "Please select time";
  static const ADD_ITEM = "Please add item";
  static const PLEASE_ENTER_DELIVERY_CHARGE = "Please add delivery charge";
  static const PLEASE_ENTER_GST = "Please add GST";

}


class Constants {
  static String jwtKey = 'token';
  static String host = 'https://randomuser.me/api/';
  static String jwtRefreshKey = 'refreshToken';
}
