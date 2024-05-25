import 'package:custom_syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:technikapp/api/model/response/login_response_entity.dart';
import 'package:technikapp/common/user_state_manager.dart';

import '../../api/model/response/get_project_expense_entity.dart';
import '../../api/model/response/get_range_expense_entity.dart';
import '../../common/label_keys.dart';
import '../../common/local_colors.dart';
import '../../custom/api_resource_widget.dart';
import 'cubit/get_expense_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  String _selectedOption = 'Current';
  DateTimeRange? _selectedDateRange;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  GetExpenseCubit getExpenseCubit = GetExpenseCubit();
  GetRangeExpenseCubit getRangeExpenseCubit = GetRangeExpenseCubit();
  GetProjectExpenseEntity getProjectExpenseEntity = GetProjectExpenseEntity();
  GetRangeExpenseEntity getRangeExpenseEntityEntity = GetRangeExpenseEntity();
  LoginResponseEntity? loginResponseEntity;
  String totalEarning = "0";
  List<ChartData> listData = [];
  String foodData = "";
  String fuelData = "";
  String travelData = "";
  String materialData = "";
  String miscData = "";

  @override
  void initState() {
    getUserDetail();
    super.initState();
  }

  void getUserDetail() async {
    loginResponseEntity = await getUserPreferenceData();
    getExpenseCubit.getExpenseList(
        loginResponseEntity?.name ?? "", _selectedOption.toLowerCase());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getExpenseCubit),
        BlocProvider.value(value: getRangeExpenseCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: LocalColors.PRIMARY_COLOR,
          toolbarHeight: 80,
          centerTitle: true,
          title: const Text(
            Labels.DASHBOARD,
            style: TextStyle(
              color: LocalColors.WHITE, fontSize: 24,fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          color: LocalColors.PRIMARY_COLOR,
          child: Column(
            children: [
              SizedBox(
                height: 0,
                child:
                    APIResourceWidget<GetExpenseCubit, GetProjectExpenseEntity>(
                  successListener: (context, state) {
                    var data = state.data;
                    if (data != null) {
                      getProjectExpenseEntity = data;
                      listData.clear();

                      totalEarning = double.parse(
                              getProjectExpenseEntity.overallTotalValue ?? "0")
                          .toStringAsFixed(2);
                      print(totalEarning);
                      foodData =
                          getProjectExpenseEntity.totalValueByCategory?.food ??
                              "";
                      fuelData =
                          getProjectExpenseEntity.totalValueByCategory?.fuel ??
                              "";
                      travelData = getProjectExpenseEntity
                              .totalValueByCategory?.travel ??
                          "";
                      materialData = getProjectExpenseEntity
                              .totalValueByCategory?.material ??
                          "";
                      miscData =
                          getProjectExpenseEntity.totalValueByCategory?.mISC ??
                              "";

                      if (foodData.isNotEmpty) {
                        listData.add(ChartData('Food', double.parse(foodData),
                            LocalColors.FOOD_BACKGROUND));
                      }
                      if (fuelData.isNotEmpty) {
                        listData.add(ChartData('Fuel', double.parse(fuelData),
                            LocalColors.FUEL_BACKGROUND));
                      }
                      if (materialData.isNotEmpty) {
                        listData.add(ChartData(
                            'Material',
                            double.parse(materialData),
                            LocalColors.MATERIAL_BACKGROUND));
                      }
                      if (miscData.isNotEmpty) {
                        listData.add(ChartData('Misc', double.parse(miscData),
                            LocalColors.MISC_BACKGROUND));
                      }
                      if (travelData.isNotEmpty) {
                        listData.add(ChartData(
                            'Travel',
                            double.parse(travelData),
                            LocalColors.TRAVEL_BACKGROUND));
                      }
                      listData.forEach((element) {
                        print(element.color);
                        print(element.x);
                      });
                      setState(() {});
                    }
                  },
                  successWidget: (c1, t1) => Container(),
                  loadingWidgetBuilder: (c1, t1) => Container(),
                ),
              ),
              SizedBox(
                height: 0,
                child: APIResourceWidget<GetRangeExpenseCubit,
                    GetRangeExpenseEntity>(
                  successListener: (context, state) {
                    var data = state.data;
                    if (data != null) {
                      listData.clear();
                      getRangeExpenseEntityEntity = data;
                      totalEarning = double.parse(
                              getRangeExpenseEntityEntity.overallTotalValue ??
                                  "0")
                          .toStringAsFixed(2);
                      foodData = getRangeExpenseEntityEntity
                              .totalValueByCategory?.food ??
                          "";
                      fuelData = getRangeExpenseEntityEntity
                              .totalValueByCategory?.fuel ??
                          "";
                      travelData = getRangeExpenseEntityEntity
                              .totalValueByCategory?.travel ??
                          "";
                      materialData = getRangeExpenseEntityEntity
                              .totalValueByCategory?.material ??
                          "";
                      miscData = getRangeExpenseEntityEntity
                              .totalValueByCategory?.mISC ??
                          "";
                      if (foodData.isNotEmpty) {
                        listData.add(ChartData('Food', double.parse(foodData),
                            LocalColors.FOOD_BACKGROUND));
                      }
                      if (fuelData.isNotEmpty) {
                        listData.add(ChartData('Fuel', double.parse(fuelData),
                            LocalColors.FUEL_BACKGROUND));
                      }
                      if (materialData.isNotEmpty) {
                        listData.add(ChartData(
                            'Material',
                            double.parse(materialData),
                            LocalColors.MATERIAL_BACKGROUND));
                      }
                      if (miscData.isNotEmpty) {
                        listData.add(ChartData('Misc', double.parse(miscData),
                            LocalColors.MISC_BACKGROUND));
                      }
                      if (travelData.isNotEmpty) {
                        listData.add(ChartData(
                            'Travel',
                            double.parse(travelData),
                            LocalColors.TRAVEL_BACKGROUND));
                      }

                      setState(() {});
                    }
                  },
                  successWidget: (c1, t1) => Container(),
                  loadingWidgetBuilder: (c1, t1) => Container(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                decoration: BoxDecoration(
                  color: LocalColors.GREY_DARK,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Month Of Expense",
                            style: TextStyle(
                                color: LocalColors.GREY, fontSize: 15),
                          ),
                          Text(
                            "₹ $totalEarning",
                            style: const TextStyle(
                                color: LocalColors.WHITE,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: LocalColors.WHITE,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: DropdownButton<String>(
                              value: _selectedOption,
                              isExpanded: true,
                              items: <String>['Current', 'Previous', 'Custom']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedOption = newValue!;
                                  if (_selectedOption != 'Custom') {
                                    _selectedDateRange = null;
                                    getExpenseCubit.getExpenseList(
                                        loginResponseEntity?.name ?? "",
                                        _selectedOption.toLowerCase());
                                  }
                                });
                                if (_selectedOption == 'Custom') {
                                  _selectDateRange(context);
                                }
                              },
                            )),
                        if (_selectedOption == 'Custom' &&
                            _selectedDateRange != null)
                          InkWell(
                            onTap: () {
                              _selectDateRange(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: LocalColors.CARD_BACKGROUND,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      _dateFormat.format(
                                          _selectedDateRange?.start ??
                                              DateTime.now()),
                                      style: const TextStyle(
                                          color: LocalColors.PRIMARY_COLOR,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  const Icon(Icons.arrow_forward_sharp,
                                      size: 20),
                                  Text(
                                      _dateFormat.format(
                                          _selectedDateRange?.end ??
                                              DateTime.now()),
                                      style: const TextStyle(
                                          color: LocalColors.PRIMARY_COLOR,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          )
                      ],
                    )),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SfCircularChart(
                        margin: const EdgeInsets.all(10),
                        series: <CircularSeries>[
                          DoughnutSeries<ChartData, String>(
                            dataSource: listData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            pointColorMapper: (ChartData data, _) => data.color,
                            cornerStyle: CornerStyle.bothCurve,
                            innerRadius: '75%',
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                              color: LocalColors.ACCENT_COLOR,
                              opacity: 0.3,
                            ),
                            dataLabelMapper: (ChartData data, _) => data.x,
                            enableTooltip: true,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Month Of Expense",
                            style: TextStyle(
                                color: LocalColors.GREY, fontSize: 15),
                          ),
                          Text(
                            "₹ $totalEarning",
                            style: const TextStyle(
                                color: LocalColors.WHITE,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 25,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _buildLegendItem(
                            listData[index].x, listData[index].color);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: listData.length),
                ),
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

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: _selectedDateRange,
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
        String startDate = _selectedDateRange?.start
                .toString()
                .replaceAll(" 00:00:00.000", "") ??
            "";
        String endDate = _selectedDateRange?.end
                .toString()
                .replaceAll(" 00:00:00.000", "") ??
            "";
        getRangeExpenseCubit.getRangeExpenseList(
            loginResponseEntity?.name ?? "", startDate, endDate);
        print(_selectedDateRange);
      });
    }
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
