import 'package:flutter/material.dart';

Future<dynamic> navigateToPageAndRemoveAllPage(
    BuildContext context, Widget routePage,
    {Widget? currentWidget}) {
  return Navigator.of(context).pushAndRemoveUntil(
      EnterExitRoute(exitPage: currentWidget, enterPage: routePage),
      (Route<dynamic> route) => false);
}

Future<dynamic> navigateToPage(BuildContext context, Widget routePage,
    {Widget? currentWidget}) {
  try {
    FocusManager.instance.primaryFocus?.unfocus();
  } catch (e, s) {
    //FirebaseCrashlytics.instance.recordError(e, s);
  }
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => routePage),
  );
}

Future<dynamic> navigateToPageAndRemoveAllPageWithFadeTransition(
    BuildContext context, Widget routePage,
    {Widget? currentWidget}) {
  return Navigator.of(context).pushAndRemoveUntil(
      FadeRoute(page: routePage), (Route<dynamic> route) => false);
}

Future<dynamic> navigateToPageAndRemoveCurrentPage(
    BuildContext context, Widget routePage,
    {Widget? currentWidget}) {
  return Navigator.of(context).pushReplacement(
    EnterExitRoute(exitPage: currentWidget, enterPage: routePage),
  );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget? exitPage;

  EnterExitRoute({this.exitPage, required this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute(this.page)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
