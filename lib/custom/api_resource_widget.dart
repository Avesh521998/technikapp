import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technikapp/common/extensions_manager.dart';
import '../api/base/api_result.dart';
import '../api/network_constants.dart';
import '../common/label_keys.dart';
import '../common/log_out_manager.dart';
import '../screens/login/screens/login_screen.dart';
import 'error_widget.dart';
import 'loading_widget.dart';
import 'no_internet_widget.dart';

class APIResourceWidget<E extends Cubit<APIResult<T>?>, T>
    extends StatelessWidget {
  final WidgetBuilder? initialWidgetBuilder;
  final APIWidgetBuilder<T>? loadingWidgetBuilder;
  final APIWidgetBuilder<T>? errorWidgetBuilder;
  final APIWidgetBuilder<T> successWidget;

  final APIListener<T>? loadingListener;
  final APIListener<T>? errorListener;
  final APIListener<T>? noInternetListener;
  final APIListener<T>? successListener;

  //For Error Widget
  final bool needToShowRetryForError;
  final VoidCallback? callbackForErrorRetry;

  //For No Internet
  final bool needToShowRetryForNoInternet;
  final bool needPaddingForNoInternet;
  final VoidCallback? callbackForNoInternetRetry;

  //For visibility
  final bool needToShowNoInternetWidget;
  final bool needToShowSessionExpiredWidget;

  APIResourceWidget(
      {this.initialWidgetBuilder,
      this.loadingWidgetBuilder,
      this.errorWidgetBuilder,
      required this.successWidget,
      this.loadingListener,
      this.errorListener,
      this.noInternetListener,
      this.successListener,
      this.needToShowNoInternetWidget = true,
      this.needToShowSessionExpiredWidget = true,
      this.needToShowRetryForError = false,
      this.callbackForErrorRetry,
      this.needToShowRetryForNoInternet = false,
      this.needPaddingForNoInternet = false,
      this.callbackForNoInternetRetry})
      : assert(T != dynamic);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<E, APIResult<T>?>(
      listener: (BuildContext context, APIResult<T>? value) {
        if (value != null) {
          if (value.apiResultType == APIResultType.LOADING) {
            if (loadingListener != null) loadingListener!(context, value);
          } else if (value.apiResultType == APIResultType.NO_INTERNET) {
            if (noInternetListener != null) noInternetListener!(context, value);
          } else if (value.apiResultType == APIResultType.FAILURE) {
            //if (errorListener != null) errorListener!(context, value);
            LogoutManager.logOutUser(context);
          } else if (value.apiResultType == APIResultType.SESSION_EXPIRED) {
            LogoutManager.logOutUser(context, currentWidget: SignInScreen());
          } else if (value.apiResultType == APIResultType.SUCCESS) {
            if (successListener != null) successListener!(context, value);
          }
        }
      },
      builder: (BuildContext context, APIResult<T>? value) {
        if (value == null) {
          return _getInitialWidget(context);
        } else {
          return _getWidgetAccordingToAPIResult(context, value);
        }
      },
    );
  }

  Widget _getInitialWidget(BuildContext context) {
    if (initialWidgetBuilder != null) {
      return initialWidgetBuilder!(context);
    } else if (loadingWidgetBuilder != null) {
      return loadingWidgetBuilder!(context, APIResult.loading(data: null));
    } else {
      return const Center(child: LoadingWidget());
    }
  }

  Widget _getWidgetAccordingToAPIResult(
      BuildContext context, APIResult<T> value) {
    if (value.apiResultType == APIResultType.LOADING) {
      return _getLoadingWidget(context, value);
    } else if (value.apiResultType == APIResultType.FAILURE) {
      return _getErrorWidget(context, value);
    } else if (value.apiResultType == APIResultType.NO_INTERNET) {
      return _getNoInternetWidget(context, value);
    } else if (value.apiResultType == APIResultType.SESSION_EXPIRED) {
      return _getSessionExpiredWidget(context, value);
    } else {
      return successWidget(context, value);
    }
  }

  Widget _getLoadingWidget(BuildContext context, APIResult<T> value) {
    if (loadingWidgetBuilder != null) {
      return loadingWidgetBuilder!(context, value);
    } else {
      return const Center(child: LoadingWidget());
    }
  }

  Widget _getErrorWidget(BuildContext context, APIResult<T> value) {
    if (errorWidgetBuilder != null) {
      return InkWell(
        onTap: () {
          LogoutManager.logOutUser(context, currentWidget: this);
        },
      );
    } else {
      var errorText = value.message?.orEmpty();
      return InkWell(
        onTap: () {
          LogoutManager.logOutUser(context, currentWidget: this);
        },
      )
        /*Center(
        child: CustomErrorWidget(
          errorText,
          callback: callbackForErrorRetry,
          needToShowRetry: needToShowRetryForError,
        ),
      )*/;
    }
  }

  Widget _getSessionExpiredWidget(BuildContext context, APIResult<T> value) {
    if (needToShowSessionExpiredWidget) {
      return CustomErrorWidget(
        Labels.SESSION_EXPIRED,
        callback: () {
          LogoutManager.logOutUser(context, currentWidget: this);
        },
        needToShowRetry: true,
      );
    } else {
      return Container();
    }
  }

  Widget _getNoInternetWidget(BuildContext context, APIResult<T> value) {
    if (needToShowNoInternetWidget) {
      return NoInternetWidget(
        callback: callbackForNoInternetRetry,
        needToShowRetry: needToShowRetryForNoInternet,
        needPadding: needPaddingForNoInternet,
      );
    } else {
      return Container();
    }
  }
}

typedef APIWidgetBuilder<T> = Widget Function(
    BuildContext context, APIResult<T>);

typedef APIListener<T> = void Function(BuildContext context, APIResult<T>);
