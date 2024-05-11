import 'package:custom_syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technikapp/api/model/response/logout_response_entity.dart';
import 'package:technikapp/common/shared_preference_helper.dart';

import '../../common/constants.dart';
import '../../common/label_keys.dart';
import '../../common/local_colors.dart';
import '../../common/navigation_manager.dart';
import '../../custom/api_resource_widget.dart';
import '../login/cubit/logout_cubit.dart';
import '../login/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  final LogoutCubit _logoutCubit = LogoutCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _logoutCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: LocalColors.PRIMARY_COLOR,
          toolbarHeight: 80,
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                _logoutCubit.logout();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.logout, color: LocalColors.ACCENT_COLOR),
              ),
            )
          ],
          title: const Text(
            Labels.DASHBOARD,
            style: TextStyle(color: LocalColors.WHITE, fontSize: 22),
          ),
        ),
        body: Container(
          color: LocalColors.PRIMARY_COLOR,
          child: Column(
            children: [
              SizedBox(
                height: 0,
                child: APIResourceWidget<LogoutCubit, LogoutResponseEntity>(
                  successListener: (context, state) {
                    var data = state.data;
                    if (data != null) {
                      callFunction();
                      setState(() {});
                    }
                  },
                  successWidget: (c1, t1) => Container(),
                  loadingWidgetBuilder: (c1, t1) => Container(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                decoration: BoxDecoration(
                  color: LocalColors.GREY_DARK,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Month Of Expense",
                          style:
                              TextStyle(color: LocalColors.GREY, fontSize: 15),
                        ),
                        Text(
                          "₹4,567.00",
                          style: TextStyle(
                              color: LocalColors.WHITE,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: LocalColors.WHITE,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Current Month",
                            style: TextStyle(
                                color: LocalColors.PRIMARY_COLOR, fontSize: 16),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 18,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: SfCircularChart(
                    margin: const EdgeInsets.all(10),
                    // Added padding around the chart
                    series: <CircularSeries>[
                      DoughnutSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        cornerStyle: CornerStyle.bothCurve,
                        innerRadius:
                            '70%', // Reduced curve radius by setting innerRadius to a percentage
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _buildLegendItem(
                          chartData[index].x, chartData[index].color);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: chartData.length),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          margin: const EdgeInsets.only(right: 5),
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  final List<ChartData> chartData = [
    ChartData('David', 25, const Color.fromRGBO(9, 0, 136, 1)),
    ChartData('Steve', 38, const Color.fromRGBO(147, 0, 119, 1)),
    ChartData('Jack', 24, const Color.fromRGBO(228, 0, 124, 1)),
    ChartData('Others', 52, const Color.fromRGBO(255, 189, 57, 1)),
    ChartData('Others', 10, const Color.fromRGBO(255, 201, 57, 1))
  ];

  void callFunction() async {
    await deleteTheSharedPreference(Constant.PREF_LOGIN_DATA);
    await deleteTheSharedPreference(Constant.PREF_AUTH_TOKEN);
    navigateToPageAndRemoveAllPageWithFadeTransition(context, SignInScreen());
    setState(() {});
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
