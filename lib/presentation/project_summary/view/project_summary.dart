import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/domain/model/projects_model.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/project_summary/viewmodel/project_summary_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/project_tasks_model.dart';

class ProjectSummaryView extends StatefulWidget {
  const ProjectSummaryView(
      {super.key, this.projectData, this.projectTasksDetails});
  final Dataprojects? projectData;
  final ProjectTasksModel? projectTasksDetails;
  @override
  State<ProjectSummaryView> createState() => _ProjectSummaryViewState();
}

class _ProjectSummaryViewState extends State<ProjectSummaryView> {
  final ProjectSummaryViewModel _viewModel = ProjectSummaryViewModel();

  @override
  void initState() {
    _viewModel.assignProjectTasksStatusesCounts(widget.projectTasksDetails!);
    print(_viewModel.tasksStatusesCount);
    print(_viewModel.taskCounts);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        drawer: const DrawerView(),
        body: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
              future: _viewModel.getProjectDetails(
                  context, widget.projectData!.id!),
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
                  return Column(
                    children: [
                      SizedBox(
                        height: displayHeight(context) * 0.02,
                      ),
                      Container(
                        width: displayWidth(context) * 0.95,
                        padding: EdgeInsets.only(
                            top: displayHeight(context) * 0.03,
                            bottom: displayHeight(context) * 0.03,
                            left: displayWidth(context) * 0.07,
                            right: displayWidth(context) * 0.04),
                        decoration: BoxDecoration(
                            color: ColorsManager.projectsContainerColor,
                            borderRadius: BorderRadius.circular(
                                displayHeight(context) * 0.05),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.1),
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                  blurRadius: 25)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.projectData?.name.toString()}',
                                  style: TextStyle(
                                    fontSize: displayHeight(context) * 0.017,
                                    color: ColorsManager.fontColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Text(
                                //   '${widget.projectData?.billingType.toString()}',
                                //   style: TextStyle(
                                //     fontSize: displayHeight(context) * 0.017,
                                //     color: ColorsManager.fontColor1,
                                //   ),
                                // ),
                                Text(
                                  '${widget.projectData?.deadline} : ${widget.projectData?.startDate}',
                                  style: TextStyle(
                                    fontSize: displayHeight(context) * 0.017,
                                    color: ColorsManager.fontColor1,
                                  ),
                                ),
                                Text(
                                  '${Duration(hours: int.parse(widget.projectData!.estimatedHours!.split('.').first)).inDays} ${AppStrings.days}',
                                  style: TextStyle(
                                    fontSize: displayHeight(context) * 0.017,
                                    color: ColorsManager.fontColor1,
                                  ),
                                ),
                                Text(
                                  '${widget.projectData?.projectCost} SAR',
                                  style: TextStyle(
                                    fontSize: displayHeight(context) * 0.017,
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
                                  horizontal: displayWidth(context) * 0.04,
                                  vertical: displayHeight(context) * 0.005),
                              child: Text(
                                '${widget.projectData?.stateName.toString().getString(context)}',
                                style: TextStyle(
                                    color: ColorsManager.fontColor3,
                                    fontSize: displayHeight(context) * 0.015),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.035,
                      ),
                      Container(
                          width: displayWidth(context) * 0.95,
                          padding: EdgeInsets.only(
                              top: displayHeight(context) * 0.03,
                              bottom: displayHeight(context) * 0.03,
                              left: displayWidth(context) * 0.07,
                              right: displayWidth(context) * 0.07),
                          decoration: BoxDecoration(
                              color: ColorsManager.projectsContainerColor,
                              borderRadius: BorderRadius.circular(
                                  displayHeight(context) * 0.05),
                              boxShadow: [
                                BoxShadow(
                                    color: ColorsManager.defaultShadowColor
                                        .withOpacity(0.1),
                                    spreadRadius: 0,
                                    offset: const Offset(0, 4),
                                    blurRadius: 25)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.tasksSummary.getString(context),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManager.fontColor1,
                                      fontSize: displayHeight(context) * 0.022),
                                ),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.035,
                              ),
                              Consumer<ProjectSummaryViewModel>(
                                builder: (BuildContext context,
                                        ProjectSummaryViewModel value,
                                        Widget? child) =>
                                    Center(
                                  child: SizedBox(
                                    width: displayWidth(context) * 0.5,
                                    height: displayHeight(context) * 0.25,
                                    child: PieChart(
                                        swapAnimationDuration: const Duration(
                                            milliseconds: 150), // Optional
                                        swapAnimationCurve: Curves.linear,
                                        PieChartData(sections: [
                                          PieChartSectionData(
                                              color: const Color(0xff000000),
                                              value: ((_viewModel.tasksStatusesCount[
                                                                  3] /
                                                              _viewModel
                                                                  .taskCounts) *
                                                          100)
                                                      .round() /
                                                  100,
                                              titleStyle: const TextStyle(
                                                  color: Color(0xffffffff)),
                                              title:
                                                  '${((_viewModel.tasksStatusesCount[3] / _viewModel.taskCounts) * 100).round()}%'
                                              //Cancelled
                                              ),
                                          PieChartSectionData(
                                              color: const Color(
                                                  0xffc8c8c8), //Finished
                                              value: ((_viewModel.tasksStatusesCount[
                                                                  4] /
                                                              _viewModel
                                                                  .taskCounts) *
                                                          100)
                                                      .round() /
                                                  100,
                                              title:
                                                  '${((_viewModel.tasksStatusesCount[4] / _viewModel.taskCounts) * 100).round()}%'),
                                          PieChartSectionData(
                                              color: const Color(
                                                  0xff989898), //In Progress
                                              value: ((_viewModel.tasksStatusesCount[
                                                                  1] /
                                                              _viewModel
                                                                  .taskCounts) *
                                                          100)
                                                      .round() /
                                                  100,
                                              title:
                                                  '${((_viewModel.tasksStatusesCount[1] / _viewModel.taskCounts) * 100).round()}%'),
                                          PieChartSectionData(
                                              color: const Color(0xff747474),
                                              value: ((_viewModel.tasksStatusesCount[
                                                                  2] /
                                                              _viewModel
                                                                  .taskCounts) *
                                                          100)
                                                      .round() /
                                                  100,
                                              title:
                                                  '${((_viewModel.tasksStatusesCount[2] / _viewModel.taskCounts) * 100).round()}%' //On Hold
                                              ),
                                        ])),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: displayWidth(context) * 0.02,
                                        backgroundColor:
                                            const Color(0xff989898),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        AppStrings.inProgress
                                            .getString(context),
                                        style: TextStyle(
                                            color: ColorsManager.fontColor1,
                                            fontSize:
                                                displayHeight(context) * 0.012),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: displayWidth(context) * 0.02,
                                        backgroundColor:
                                            const Color(0xffc8c8c8),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        AppStrings.finished.getString(context),
                                        style: TextStyle(
                                            color: ColorsManager.fontColor1,
                                            fontSize:
                                                displayHeight(context) * 0.012),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: displayWidth(context) * 0.02,
                                        backgroundColor:
                                            const Color(0xff747474),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        AppStrings.onHold.getString(context),
                                        style: TextStyle(
                                            color: ColorsManager.fontColor1,
                                            fontSize:
                                                displayHeight(context) * 0.012),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: displayWidth(context) * 0.02,
                                        backgroundColor:
                                            const Color(0xff000000),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        AppStrings.closed.getString(context),
                                        style: TextStyle(
                                            color: ColorsManager.fontColor1,
                                            fontSize:
                                                displayHeight(context) * 0.012),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.05,
                              ),
                              Text(
                                AppStrings.openTasks.getString(context),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: ColorsManager.fontColor1,
                                    fontSize: displayHeight(context) * 0.022),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.025,
                              ),
                              LinearPercentIndicator(
                                barRadius: Radius.circular(
                                    displayHeight(context) * 0.02),
                                percent: (_viewModel.tasksStatusesCount[0] +
                                        _viewModel.tasksStatusesCount[1] +
                                        _viewModel.tasksStatusesCount[2] +
                                        _viewModel.tasksStatusesCount[3]) /
                                    (_viewModel.taskCounts +
                                        _viewModel.tasksStatusesCount[0]),
                                padding: const EdgeInsets.all(0),
                                lineHeight: 20,
                                center: Text(
                                  '${(_viewModel.taskCounts + _viewModel.tasksStatusesCount[0])} / ${(_viewModel.tasksStatusesCount[0] + _viewModel.tasksStatusesCount[1] + _viewModel.tasksStatusesCount[2] + _viewModel.tasksStatusesCount[3])} ',
                                  style:
                                      const TextStyle(color: Color(0xffffffff)),
                                ),
                                backgroundColor: const Color(0xffc8c8c8),
                                progressColor: const Color(0xff000000),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.025,
                              ),
                              Text(
                                AppStrings.daysLeft.getString(context),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: ColorsManager.fontColor1,
                                    fontSize: displayHeight(context) * 0.022),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.025,
                              ),
                              LinearPercentIndicator(
                                barRadius: Radius.circular(
                                    displayHeight(context) * 0.02),
                                percent:
                                    _viewModel.projectProgressPercentage! < 0.0
                                        ? 0.0
                                        : _viewModel.projectProgressPercentage!,
                                padding: const EdgeInsets.all(0),
                                lineHeight: 20,
                                backgroundColor: const Color(0xffc8c8c8),
                                progressColor: const Color(0xff000000),
                                center: Text(
                                  _viewModel.daysLeft! < 0
                                      ? '0 ${AppStrings.daysLeft.getString(context)}'
                                      : '${_viewModel.daysLeft} ${AppStrings.daysLeft.getString(context)}',
                                  style: const TextStyle(
                                      color: ColorsManager.fontColor3),
                                ),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.01,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: displayHeight(context) * 0.035,
                      ),
                      Container(
                          width: displayWidth(context) * 0.95,
                          padding: EdgeInsets.only(
                              top: displayHeight(context) * 0.03,
                              bottom: displayHeight(context) * 0.03,
                              left: displayWidth(context) * 0.07,
                              right: displayWidth(context) * 0.07),
                          decoration: BoxDecoration(
                              color: ColorsManager.projectsContainerColor,
                              borderRadius: BorderRadius.circular(
                                  displayHeight(context) * 0.05),
                              boxShadow: [
                                BoxShadow(
                                    color: ColorsManager.defaultShadowColor
                                        .withOpacity(0.1),
                                    spreadRadius: 0,
                                    offset: const Offset(0, 4),
                                    blurRadius: 25)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.description.getString(context),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: ColorsManager.fontColor1,
                                    fontSize: displayHeight(context) * 0.022),
                              ),
                              // SizedBox(height: displayHeight(context) * 0.01),
                              SizedBox(width: displayWidth(context) * 0.008),
                              HtmlWidget(
                                widget.projectData!.description! ?? '',
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: ColorsManager.fontColor1,
                                    fontSize: displayHeight(context) * 0.02),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: displayHeight(context) * 0.035,
                      ),
                      Container(
                          width: displayWidth(context) * 0.95,
                          padding: EdgeInsets.only(
                              top: displayHeight(context) * 0.03,
                              bottom: displayHeight(context) * 0.03,
                              left: displayWidth(context) * 0.07,
                              right: displayWidth(context) * 0.07),
                          decoration: BoxDecoration(
                              color: ColorsManager.projectsContainerColor,
                              borderRadius: BorderRadius.circular(
                                  displayHeight(context) * 0.05),
                              boxShadow: [
                                BoxShadow(
                                    color: ColorsManager.defaultShadowColor
                                        .withOpacity(0.1),
                                    spreadRadius: 0,
                                    offset: const Offset(0, 4),
                                    blurRadius: 25)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.projectSupervisor.getString(context),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: ColorsManager.fontColor1,
                                    fontSize: displayHeight(context) * 0.022),
                              ),
                              // SizedBox(height: displayHeight(context) * 0.01),
                              ListView.builder(
                                itemCount: snapshot
                                    .data['data']['project_members'].length,
                                shrinkWrap: true,
                                itemBuilder:
                                    (BuildContext context, int index) => Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: const Color(0xffa1a1a1),
                                              width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                                color: ColorsManager
                                                    .defaultShadowColor
                                                    .withOpacity(0.1),
                                                spreadRadius: 0,
                                                offset: const Offset(0, 4),
                                                blurRadius: 25)
                                          ]),
                                      child: const CircleAvatar(),
                                    ),
                                    SizedBox(
                                        width: displayWidth(context) * 0.008),
                                    Text(
                                      snapshot.data['data']['project_members']
                                          [index]['staff_name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: ColorsManager.fontColor1,
                                          fontSize:
                                              displayHeight(context) * 0.02),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: displayHeight(context) * 0.015,
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
