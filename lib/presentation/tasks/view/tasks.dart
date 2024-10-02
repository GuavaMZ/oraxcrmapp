import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/domain/model/project_tasks_model.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/tasks/viewmodel/tasks_viewmodel.dart';
import 'package:provider/provider.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key, this.projectTasksDetails});
  final ProjectTasksModel? projectTasksDetails;
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final TasksViewModel _viewModel = TasksViewModel();

  @override
  void initState() {
    _viewModel.assignProjectTasksStatusesCounts(widget.projectTasksDetails!);
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
            child: Column(
              children: [
                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                Container(
                  // width: displayWidth(context) * 0.95,
                  height: displayHeight(context) * 0.17,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color:
                            ColorsManager.defaultShadowColor.withOpacity(0.1),
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                        blurRadius: 25)
                  ]),
                  child: ListView.builder(
                    itemCount: _viewModel.tasksStatuses.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: displayWidth(context) * 0.01),
                        decoration: BoxDecoration(
                          color: ColorsManager.statisticsContainerColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(displayHeight(context) * 0.05),
                          ),
                        ),
                        height: displayHeight(context) * 0.17,
                        width: displayWidth(context) * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  _viewModel.tasksStatusesCount[index]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.037,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                                _viewModel.tasksStatuses[index]
                                    .toString()
                                    .getString(context),
                                style: TextStyle(
                                    fontSize: displayHeight(context) * 0.014,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.04),
                ListView.builder(
                  itemCount:
                      widget.projectTasksDetails?.dataTasksProject?.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: displayHeight(context) * 0.02),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    if (widget
                        .projectTasksDetails!.dataTasksProject!.isNotEmpty) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: displayHeight(context) * 0.02),
                        child: ElevatedButton(
                          onPressed: () {
                            // context.push(Routes.projectDetailsRoute,
                            //     extra: widget.projectTasksDetails
                            //         .dataTasksProject![index]);
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
                            padding: EdgeInsets.only(
                                top: displayHeight(context) * 0.03,
                                bottom: displayHeight(context) * 0.03,
                                left: displayWidth(context) * 0.055,
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
                                      widget.projectTasksDetails!
                                          .dataTasksProject![index].name
                                          .toString(),
                                      style: TextStyle(
                                        fontSize:
                                            displayHeight(context) * 0.017,
                                        color: ColorsManager.fontColor1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${widget.projectTasksDetails!.dataTasksProject![index].duedate} : ${widget.projectTasksDetails!.dataTasksProject![index].startdate}',
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
                                      horizontal: displayWidth(context) * 0.04,
                                      vertical: displayHeight(context) * 0.005),
                                  child: Text(
                                    _viewModel.projectTasksStats[widget
                                            .projectTasksDetails!
                                            .dataTasksProject![index]
                                            .status]
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
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
