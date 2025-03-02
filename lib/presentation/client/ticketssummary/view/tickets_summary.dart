import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/client/ticketssummary/viewmodel/tickets_summary_viewmodel.dart';
import 'package:provider/provider.dart';

class TicketsSummaryView extends StatefulWidget {
  const TicketsSummaryView({super.key});

  @override
  State<TicketsSummaryView> createState() => _TicketsSummaryViewState();
}

class _TicketsSummaryViewState extends State<TicketsSummaryView> {
  final TicketsSummaryViewModel _viewModel = TicketsSummaryViewModel();
  @override
  void initState() {
    _viewModel.scrollController.addListener(() async {
      if (_viewModel.scrollController.position.pixels ==
              _viewModel.scrollController.position.maxScrollExtent &&
          _viewModel.isLastPage == false) {
        await _viewModel.loadMoreData(context);
      }
    });
    _viewModel.currentList = _viewModel.supportTicketsList!;
    _viewModel.searchForSupportTickets(context);
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        resizeToAvoidBottomInset: false,
        drawer: const DrawerView(),
        body: SingleChildScrollView(
          controller: _viewModel.scrollController,
          child: Center(
            child: FutureBuilder(
              future: _viewModel.getSupportTickets(context),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.5),
                    // height: displayHeight(context) * 0.17,
                    alignment: Alignment.center,
                    width: displayWidth(context) * 0.2,
                    child: LoadingAnimationWidget.discreteCircle(
                        color: ColorsManager.discreteCircleFirstColor,
                        secondRingColor:
                            ColorsManager.discreteCircleSecondColor,
                        thirdRingColor: ColorsManager.discreteCircleThirdColor,
                        size: displayWidth(context) * 0.1),
                  );
                } else {
                  // print(snapshot.data);
                  return Column(
                    children: [
                      SizedBox(
                        height: displayHeight(context) * 0.06,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: ColorsManager.iconsColor3,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: ColorsManager
                                              .defaultShadowColor
                                              .withValues(alpha: 0.1),
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                          blurRadius: 25)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/images/menu-1 3.svg'))),
                            Text(AppStrings.ticketsSummary.getString(context),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Container(
                                decoration: BoxDecoration(
                                    color: ColorsManager.iconsColor3,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: ColorsManager
                                              .defaultShadowColor
                                              .withValues(alpha: 0.1),
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                          blurRadius: 25)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/images/arrow-left 2.svg'))),
                          ],
                        ),
                      ),
                      SizedBox(height: displayHeight(context) * 0.02),
                      Consumer<TicketsSummaryViewModel>(
                        builder: (BuildContext context, value, Widget? child) =>
                            Container(
                          // width: displayWidth(context) * 0.95,
                          height: displayHeight(context) * 0.17,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: ColorsManager.defaultShadowColor
                                    .withValues(alpha: 0.1),
                                spreadRadius: 0,
                                offset: const Offset(0, 4),
                                blurRadius: 25)
                          ]),
                          child: ListView.builder(
                            itemCount: _viewModel.ticketsStatuses.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  _viewModel.selectedStatus = _viewModel
                                      .ticketsStatuses[index]
                                      .toString();
                                  _viewModel.filteredTicketsBasedOnStatus =
                                      _viewModel.supportTicketsList!
                                          .where((element) =>
                                              element.status ==
                                              _viewModel
                                                      .ticketsStatusesDictionary[
                                                  _viewModel
                                                      .ticketsStatuses[index]
                                                      .toString()])
                                          .toList();

                                  _viewModel.currentList =
                                      _viewModel.filteredTicketsBasedOnStatus;
                                  _viewModel.toggleNotifyListeners();
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: displayWidth(context) * 0.01),
                                  decoration: BoxDecoration(
                                    color: _viewModel.selectedStatus ==
                                            _viewModel.ticketsStatuses[index]
                                                .toString()
                                        ? ColorsManager.selectedChoiceChipColor
                                        : ColorsManager
                                            .statisticsContainerColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          displayHeight(context) * 0.05),
                                    ),
                                  ),
                                  height: displayHeight(context) * 0.17,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                            _viewModel
                                                .ticketsStatusesCount[index]
                                                .toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.037,
                                                fontWeight: FontWeight.bold,
                                                color: _viewModel
                                                            .selectedStatus ==
                                                        _viewModel
                                                            .ticketsStatuses[
                                                                index]
                                                            .toString()
                                                    ? ColorsManager.fontColor3
                                                    : ColorsManager
                                                        .fontColor1)),
                                      ),
                                      Text(
                                          _viewModel.ticketsStatuses[index]
                                              .toString()
                                              .getString(context),
                                          style: TextStyle(
                                              fontSize: displayHeight(context) *
                                                  0.014,
                                              fontWeight: FontWeight.bold,
                                              color: _viewModel
                                                          .selectedStatus ==
                                                      _viewModel
                                                          .ticketsStatuses[
                                                              index]
                                                          .toString()
                                                  ? ColorsManager.fontColor3
                                                  : ColorsManager.fontColor1))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: displayHeight(context) * 0.02),
                      SizedBox(
                          width: displayWidth(context) * 0.9,
                          child: TextFormField(
                            controller: _viewModel.searchController,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _viewModel.currentList =
                                    _viewModel.supportTicketsList!;
                                _viewModel.toggleNotifyListeners();
                              } else {
                                _viewModel.currentList = _viewModel
                                    .searchResultList
                                    .where((element) => element.subject
                                        .toString()
                                        .contains(
                                            _viewModel.searchController.text))
                                    .toList();
                                _viewModel.toggleNotifyListeners();
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.06,
                                  right: displayWidth(context) * 0.06,
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.02),
                              fillColor: const Color(0xffFFFFFF),
                              hintText: AppStrings.searchTicketName
                                  .getString(context),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 2, color: Color(0x70000000)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 2, color: Color(0x70000000)),
                              ),
                              // border: const OutlineInputBorder(
                              //   borderRadius: BorderRadius.all(Radius.circular(30)),
                              //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                              // ),
                            ),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          )),
                      SizedBox(height: displayHeight(context) * 0.02),
                      Consumer<TicketsSummaryViewModel>(
                        builder: (BuildContext context, value, Widget? child) =>
                            ListView.builder(
                          shrinkWrap: true,
                          itemCount: _viewModel.currentList.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: displayHeight(context) * 0.02),
                          primary: false,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            margin: EdgeInsets.only(
                                bottom: displayHeight(context) * 0.02),
                            child: ElevatedButton(
                              onPressed: () {
                                context.push(Routes.ticketsDetailsRoute,
                                    extra: _viewModel.currentList[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        displayHeight(context) * 0.05),
                                  ),
                                  elevation: 0,
                                  padding: const EdgeInsets.all(0)),
                              child: Container(
                                width: displayWidth(context) * 0.95,
                                // margin: EdgeInsets.only(bottom: displayHeight(context) * 0.01),
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.03,
                                    bottom: displayHeight(context) * 0.03,
                                    left: displayWidth(context) * 0.04,
                                    right: displayWidth(context) * 0.04),
                                decoration: BoxDecoration(
                                    color: ColorsManager.ticketsContainerColor,
                                    borderRadius: BorderRadius.circular(
                                        displayHeight(context) * 0.05),
                                    boxShadow: [
                                      BoxShadow(
                                          color: ColorsManager
                                              .defaultShadowColor
                                              .withValues(alpha: 0.1),
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                          blurRadius: 25)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _viewModel.currentList[index].subject
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            fontWeight: FontWeight.bold,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                        Text(
                                          _viewModel
                                              .currentList[index].departmentName
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            overflow: TextOverflow.clip,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                        Text(
                                          _viewModel
                                              .currentList[index].priorityName
                                              .toString()
                                              .getString(context),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorsManager.iconsColor1,
                                        borderRadius: BorderRadius.circular(
                                            displayHeight(context) * 0.08),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              displayWidth(context) * 0.04,
                                          vertical:
                                              displayHeight(context) * 0.005),
                                      child: Text(
                                        _viewModel.currentList[index].statusName
                                            .toString()
                                            .getString(context),
                                        style: TextStyle(
                                            color: ColorsManager.fontColor3,
                                            fontSize:
                                                displayHeight(context) * 0.015),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
