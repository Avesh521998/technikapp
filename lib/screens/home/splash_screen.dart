// import 'dart:async';
// import 'package:contactmanager/screens/dash_board_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../common/asset_manager.dart';
// import '../common/navigation_manager.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<StatefulWidget> createState() => SplashScreenState();
// }
//
// class SplashScreenState extends State<SplashScreen> {
//   late Timer splashTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     splashTimer = Timer(const Duration(milliseconds: 3000), () {
//       _goToDashBoardScreen();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _getSplashScreen();
//   }
//
//   Widget _getSplashScreen() {
//     return Scaffold(
//         body: Center(
//       child: SizedBox(
//         height: 125,
//         width: 125,
//         child: CircleAvatar(
//           radius: 50,
//           child: ClipOval(child: Image.asset(ImageAsset.IC_SPLASH_LOGO)),
//         ),
//       ),
//     ));
//   }
//
//   Future<void> _goToDashBoardScreen() async {
//     navigateToPageAndRemoveAllPageWithFadeTransition(
//         context, const DashBoardScreen(),
//         currentWidget: widget);
//   }
// }
