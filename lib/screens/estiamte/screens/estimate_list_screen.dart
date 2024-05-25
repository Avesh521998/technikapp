import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:technikapp/api/model/request/edit_expense_request_entity.dart';
import 'package:technikapp/api/model/response/add_estimate_response_entity.dart';
import 'package:technikapp/api/model/response/login_response_entity.dart';
import 'package:technikapp/common/extensions_manager.dart';
import 'package:technikapp/common/label_keys.dart';
import 'package:technikapp/custom/date_text_field_widget.dart';
import 'package:technikapp/custom/search_text_field_common.dart';
import 'package:technikapp/custom/text_field_common.dart';

import '../../../api/base/api_result.dart';
import '../../../api/model/request/add_expense_request_entity.dart';
import '../../../api/model/response/get_estimate_list_response_entity.dart';
import '../../../api/model/response/get_project_response_list_entity.dart';
import '../../../common/asset_manager.dart';
import '../../../common/local_colors.dart';
import '../../../common/user_state_manager.dart';
import '../../../custom/api_resource_widget.dart';
import '../../../custom/button_common.dart';
import '../../../custom/snackbar_common.dart';
import '../cubit/add_expence_cubit.dart';
import '../cubit/get_estimate_list_cubit.dart';

class EstimateListingScreen extends StatefulWidget {
  const EstimateListingScreen({super.key});

  @override
  State<EstimateListingScreen> createState() => _EstimateListingScreenState();
}

class _EstimateListingScreenState extends State<EstimateListingScreen> {
  List<GetEstimateListResponseEntity> originalList = [];
  List<GetEstimateListResponseEntity> getProjectList = [];
  List<GetProjectResponseListEntity> getNewProjectList = [];
  List<SelectedTypes> btnList = [];
  GetEstimateListCubit getEstimateListCubit = GetEstimateListCubit();
  AddEstimateCubit addEstimateCubit = AddEstimateCubit();
  EditEstimateCubit editEstimateCubit = EditEstimateCubit();
  SearchEstimateListCubit searchEstimateCubit = SearchEstimateListCubit();
  GetProjectListCubit getProjectListCubit = GetProjectListCubit();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController selectTypeController = TextEditingController();
  TextEditingController projectIdController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  FocusNode searchFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode dateFocusNode = FocusNode();
  FocusNode amountFocusNode = FocusNode();
  FocusNode remarkFocusNode = FocusNode();
  String selectedVendor = "Select Project";
  String selectedProjectId = "";
  LoginResponseEntity? loginResponse;
  bool isAscending = true;

  void sortItems(bool isAscending) {
    setState(() {
      if (isAscending) {
        getProjectList.sort((a, b) => a.projectName!.compareTo(b.projectName ?? ""));
      } else {
        getProjectList.sort((a, b) => b.projectName!.compareTo(a.projectName ?? ""));
      }
    });
  }
  @override
  void initState() {
    super.initState();
    addButtonList();
  }

  void addButtonList() async {
    loginResponse = await getUserPreferenceData();
    getEstimateListCubit.getEstimateList(loginResponse?.name??"");
    getProjectListCubit.getProjectList();
    nameController.text = loginResponse?.name ?? "";
    btnList.clear();
    btnList.add(SelectedTypes(text: Labels.FUEL, isSelected: false));
    btnList.add(SelectedTypes(text: Labels.TRAVEL, isSelected: false));
    btnList.add(SelectedTypes(text: Labels.MATERIAL, isSelected: false));
    btnList.add(SelectedTypes(text: Labels.FOOD, isSelected: false));
    btnList.add(SelectedTypes(text: Labels.MISC, isSelected: false));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getEstimateListCubit),
        BlocProvider.value(value: addEstimateCubit),
        BlocProvider.value(value: editEstimateCubit),
        BlocProvider.value(value: getProjectListCubit),
        BlocProvider.value(value: searchEstimateCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          title: const Text("All Expenses",style: TextStyle(
              color: LocalColors.PRIMARY_COLOR, fontSize: 24,fontWeight: FontWeight.w600),
          ),
          actions: [
            InkWell(
              onTap: () {
                showBottomSheet();
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: LocalColors.WHITE,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: const Icon(Icons.add, size: 24),
              ),
            ),
            PopupMenuButton<String>(
              icon: Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.only(right: 10,left: 5),
                decoration: const BoxDecoration(
                  color: LocalColors.WHITE,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: const Icon(Icons.filter_alt_outlined, size: 24),
              ),
              onSelected: (String result) {
                setState(() {
                  if (result == 'A-Z') {
                    sortItems(true);
                  } else if (result == 'Z-A') {
                    sortItems(false);
                  }else if (result == "All"){
                    getEstimateListCubit.getEstimateList(loginResponse?.name??"");
                    getProjectListCubit.getProjectList();
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'All',
                  child: Text('All'),
                ),
                const PopupMenuItem<String>(
                  value: 'A-Z',
                  child: Text('Sort A-Z'),
                ),
                const PopupMenuItem<String>(
                  value: 'Z-A',
                  child: Text('Sort Z-A'),
                ),

              ],
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            addButtonList();
            getEstimateListCubit.getEstimateList(loginResponse?.name??"");
            getProjectListCubit.getProjectList();
          },
          child: Column(
            children: [
              SizedBox(
                height: 0,
                child: APIResourceWidget<GetProjectListCubit,
                    List<GetProjectResponseListEntity>>(
                  successListener: (context, state) {
                    getNewProjectList.clear();
                    var data = state.data!;
                    if (data.isNotNullOrEmpty()) {
                      getNewProjectList.addAll(data);
                      setState(() {});
                    }
                  },
                  successWidget: (c1, x1) => Container(),
                ),
              ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
               child: SearchTextFieldWidget(searchController, searchFocusNode,changeListener: (value){
                  searchEstimateCubit.getSearchEstimateList(loginResponse?.name ?? "", value);
                }),
             ),
              Expanded(
                child: APIResourceWidget<GetEstimateListCubit,
                    List<GetEstimateListResponseEntity>>(
                  successListener: (context, state) {
                    getProjectList.clear();
                    var data = state.data!;
                    if (data.isNotNullOrEmpty()) {
                      getProjectList.addAll(data);
                      originalList = getProjectList;
                      setState(() {});
                    }
                  },
                  successWidget: _getSuccessWidget,
                ),
              ),
              SizedBox(
                height: 0,
                child: APIResourceWidget<SearchEstimateListCubit,
                    List<GetEstimateListResponseEntity>>(
                  successListener: (context, state) {
                    getProjectList.clear();
                    var data = state.data!;
                    if (data.isNotNullOrEmpty()) {
                      getProjectList.addAll(data);
                      setState(() {});
                    }
                  },
                  successWidget: (c1,v1)=>Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSuccessWidget(BuildContext context,
      APIResult<List<GetEstimateListResponseEntity>> value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: getProjectList.length,
        itemBuilder: (context, index) {
          final model = getProjectList[index];
          String dateString = model.date ?? "";
          DateTime parsedDate = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'")
              .parseUtc(dateString);
          String formattedDate = DateFormat('MMMM dd, yyyy').format(parsedDate);
          return InkWell(
            onTap: () {
              showBottomSheet(model: model);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Image.asset(
                    model.expenseType?.toLowerCase() ==
                            Labels.FOOD.toLowerCase()
                        ? ImageAsset.IC_FOOD
                        : model.expenseType?.toLowerCase() ==
                                Labels.MISC.toLowerCase()
                            ? ImageAsset.IC_MISC
                            : model.expenseType?.toLowerCase() ==
                                    Labels.TRAVEL.toLowerCase()
                                ? ImageAsset.IC_TRAVEL
                                : model.expenseType?.toLowerCase() ==
                                        Labels.MATERIAL.toLowerCase()
                                    ? ImageAsset.IC_MATERIAL
                                    : ImageAsset.IC_FUEL,
                    height: 35,
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.expenseType ?? "",
                          style: const TextStyle(
                              color: LocalColors.PRIMARY_COLOR, fontSize: 15),
                        ),
                        Text(
                          "Project Name : ${model.projectName ?? ""}",
                          style: const TextStyle(
                              color: LocalColors.PRIMARY_COLOR, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "₹ ${model.value}",
                        style: const TextStyle(
                            color: LocalColors.PRIMARY_COLOR, fontSize: 15),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                            color: LocalColors.PRIMARY_COLOR, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Divider(),
        ),
      ),
    );
  }

  showBottomSheet({GetEstimateListResponseEntity? model}) {
    print(model);
    if (model != null) {
      selectedProjectId = model.id ?? "";
      selectedVendor = model.projectName ?? "";
      projectNameController.text = model.projectName ?? "";
      projectIdController.text = model.projectId ?? "";
      // nameController.text = model.personName ?? "";
      for (var element in btnList) {
        element.isSelected = false;
        if (element.text.toLowerCase() == model.expenseType?.toLowerCase()) {
          element.isSelected = true;
          selectTypeController.text = element.text;
        }
      }
      DateTime date =
          DateFormat('EEE, dd MMM yyyy HH:mm:ss').parse(model.date ?? "");
      String formattedDate = DateFormat('dd MMM yyyy').format(date);
      amountController.text = model.value ?? "";
      remarkController.text = model.description ?? "";
      dateController.text = formattedDate;
    }else{
      projectNameController.clear();
      selectTypeController.clear();
      amountController.clear();
      remarkController.clear();
      projectIdController.clear();
      nameController.clear();
      dateController.clear();
      selectedVendor = "";
      selectedVendor = "Select Project";
      addButtonList();
    }
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: addEstimateCubit),
            BlocProvider.value(value: editEstimateCubit),
          ],
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter newSetState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model != null ? "Edit Expenses" : "Expenses",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: LocalColors.PRIMARY_COLOR,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close, size: 25),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: LocalColors.GREY_DARK),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Text(selectedVendor,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontAsset.MEDIUM)),
                        underline: Container(),
                        items: getNewProjectList.map((value) {
                          return DropdownMenuItem<GetProjectResponseListEntity>(
                            value: value,
                            child: Text(value.projectName.toString()),
                          );
                        }).toList(),
                        onChanged: (GetProjectResponseListEntity? value) {
                          selectedVendor = value?.projectName ?? "";
                          projectNameController.text = value?.projectName ?? "";
                          projectIdController.text = value?.iD ?? "";
                          newSetState(() {});
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: LocalColors.BOTTON_SELECTED,
                            width: 1.0,
                          ),
                        )),
                        height: 45,
                        child: Container(
                          color: LocalColors.BUTTON_COLOR_BG,
                          child: IgnorePointer(
                            ignoring: true,
                            child: TextFieldWidget(
                              nameController,
                              Labels.NAME,
                              nameFocusNode,
                              outlineInputBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              textBackGround: LocalColors.TRANSPARENT,
                            ),
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: LocalColors.BOTTON_SELECTED,
                            width: 1.0,
                          ),
                        )),
                        height: 45,
                        child: DateTextFieldWidget(
                            dateController, Labels.DATE, dateFocusNode,)),
                    const SizedBox(height: 10),
                    Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: LocalColors.BOTTON_SELECTED,
                            width: 1.0,
                          ),
                        )),
                        height: 45,
                        child: TextFieldWidget(
                          amountController,
                          Labels.AMOUNT,
                          amountFocusNode,
                          textInputType: TextInputType.number,
                          outlineInputBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          textBackGround: LocalColors.TRANSPARENT,
                        )),
                    const SizedBox(height: 10),
                    Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: LocalColors.BOTTON_SELECTED,
                            width: 1.0,
                          ),
                        )),
                        height: 65,
                        child: TextFieldWidget(
                          remarkController,
                          Labels.REMARK,
                          remarkFocusNode,
                          maxLine: 4,
                          minLine: 3,
                          outlineInputBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          textBackGround: LocalColors.TRANSPARENT,
                        )),
                    const SizedBox(height: 10),
                    const Text(Labels.SELECT_TYPE,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    const SizedBox(height: 10),
                    GridView.builder(
                      itemCount: btnList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 7.5),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            for (var element in btnList) {
                              element.isSelected = false;
                            }
                            btnList[index].isSelected = true;
                            for (var element in btnList) {
                              if (element.isSelected) {
                                selectTypeController.text = element.text;
                              }
                            }
                            newSetState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: btnList[index].isSelected
                                  ? LocalColors.BOTTON_SELECTED
                                  : LocalColors.BUTTON_COLOR_BG,
                            ),
                            alignment: Alignment.center,
                            child: Text(btnList[index].text,
                                style: TextStyle(
                                    color: btnList[index].isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: btnList[index].isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal)),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    if (model != null)
                      BlocConsumerButtonWithProgress<EditEstimateCubit,
                              AddEstimateResponseEntity>(Labels.SAVE,
                          _editEstimateClick, _goToDashBoardScreenScreen,needToShowDefaultSuccessSnackBar: false),
                    if (model == null)
                      BlocConsumerButtonWithProgress<AddEstimateCubit,
                              AddEstimateResponseEntity>(Labels.ADD_EXPENCE,
                          _addEstimateClick, _goToDashBoardScreenScreen,needToShowDefaultSuccessSnackBar: false),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  void _addEstimateClick() async {
    if (_isDataValid()) {
      DateTime date =
          DateFormat('dd MMM yyyy').parse(dateController.text.trim());

      // Format the DateTime object into the desired format "yyyy/MM/dd"
      String formattedDate = DateFormat('yyyy/MM/dd').format(date);

      var addExpenseRequest = AddExpenseRequestEntity()
        ..projectName = projectNameController.text.trim()
        ..value = amountController.text.trim()
        ..typeOfExpense = selectTypeController.text.trim()
        ..description = remarkController.text.trim()
        ..date = formattedDate
        ..projectId = projectIdController.text.trim()
        ..personName = nameController.text.trim();
      addEstimateCubit.addExpenseAPI(addExpenseRequest);
    }
  }

  void _editEstimateClick() async {
    if (_isDataNewValid()) {
      DateTime date =
          DateFormat('dd MMM yyyy').parse(dateController.text.trim());
      String formattedDate = DateFormat('yyyy/MM/dd').format(date);

      var addExpenseRequest = EditExpenseRequestEntity()
        ..projectName = projectNameController.text.trim()
        ..value = amountController.text.trim()
        ..typeOfExpense = selectTypeController.text.trim()
        ..description = remarkController.text.trim()
        ..date = formattedDate
        ..personName = nameController.text.trim();
      editEstimateCubit.editExpenseAPI(addExpenseRequest, selectedProjectId);
    }
  }

  Future<void> _goToDashBoardScreenScreen(
      AddEstimateResponseEntity addEstimateResponseEntity,
      String message) async {
    Navigator.pop(context);
    Navigator.pop(context);
    projectNameController.clear();
    selectTypeController.clear();
    amountController.clear();
    remarkController.clear();
    projectIdController.clear();
    nameController.clear();
    dateController.clear();
    selectedVendor = "";
    selectedVendor = "Select Project";
    addButtonList();
    getEstimateListCubit.getEstimateList(loginResponse?.name??"");
  }

  bool _isDataValid() {
    String errorText = "";

    var name = nameController.text;
    var date = dateController.text;
    var amount = amountController.text;
    var remark = remarkController.text;

    if (projectNameController.text.isEmpty) {
      errorText = ValidationLabels.PROJECT_TYPE;
    } else if (name.isEmpty) {
      errorText = ValidationLabels.NAME_VALIDATION;
    } else if (date.isEmpty) {
      errorText = ValidationLabels.SELECT_END_DATE_VALIDATION;
    } else if (amount.isEmpty) {
      errorText = ValidationLabels.PLAESE_ENTER_VALIDATION_AMOUNT;
    } else if (remark.isEmpty) {
      errorText = ValidationLabels.ENTER_REMARK;
    } else if (selectTypeController.text.isEmpty) {
      errorText = ValidationLabels.SELECT_TYPE;
    }

    if (errorText.isNotEmpty) {
      showFlushBar(context, errorText);
      return false;
    } else {
      showFlushBar(context, errorText);
      return true;
    }
  }

  bool _isDataNewValid() {
    String errorText = "";

    var name = nameController.text;
    var date = dateController.text;
    var amount = amountController.text;
    var remark = remarkController.text;

    if (name.isEmpty) {
      errorText = ValidationLabels.NAME_VALIDATION;
    } else if (date.isEmpty) {
      errorText = ValidationLabels.SELECT_END_DATE_VALIDATION;
    } else if (amount.isEmpty) {
      errorText = ValidationLabels.PLAESE_ENTER_VALIDATION_AMOUNT;
    } else if (remark.isEmpty) {
      errorText = ValidationLabels.ENTER_REMARK;
    } else if (selectTypeController.text.isEmpty) {
      errorText = ValidationLabels.SELECT_TYPE;
    }

    if (errorText.isNotEmpty) {
      showFlushBar(context, errorText);
      return false;
    } else {
      showFlushBar(context, errorText);
      return true;
    }
  }
}

class DemoModel {
  final IconData icons;
  final Color color;
  final String name;
  final String name1;
  final String date;
  final String cost;

  DemoModel({
    required this.icons,
    required this.color,
    required this.name,
    required this.name1,
    required this.date,
    required this.cost,
  });
}

class SelectedTypes {
  String text;
  bool isSelected;

  SelectedTypes({
    required this.text,
    required this.isSelected,
  });
}
