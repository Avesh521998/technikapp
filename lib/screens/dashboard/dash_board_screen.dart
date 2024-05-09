import 'package:flutter/material.dart';
import 'package:technikapp/screens/home/homeScreen.dart';

import '../../common/local_colors.dart';
import '../estiamte/screens/estimate_list_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      const HomeScreen(),
      const EstimateListingScreen(),
    ];

    return Scaffold(
      body: list.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: LocalColors.CARD_BACKGROUND,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 1,
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  selectedIndex = 0;
                  setState(() {});
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                  child: Container(
                    height: 50,
                    decoration: selectedIndex == 0
                        ? BoxDecoration(
                            color: LocalColors.BLUE_DARK,
                            borderRadius: BorderRadius.circular(4),
                          )
                        : const BoxDecoration(),
                    child: Icon(
                      Icons.dashboard,
                      size: 30,
                      color: selectedIndex == 0 ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  selectedIndex = 1;
                  setState(() {});
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                  child: Container(
                    height: 50,
                    decoration: selectedIndex == 1
                        ? BoxDecoration(
                            color: LocalColors.BLUE_DARK,
                            borderRadius: BorderRadius.circular(4),
                          )
                        : const BoxDecoration(),
                    child: Icon(
                      Icons.analytics_rounded,
                      size: 30,
                      color: selectedIndex == 1 ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
