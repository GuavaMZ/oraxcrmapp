import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/domain/model/project_tasks_model.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/resources/widgets_constants.dart';
import 'package:oraxcrm/presentation/tasks/tasks_details/viewmodel/tasks_details_viewmodel.dart';

class TasksDetailsView extends StatefulWidget {
  const TasksDetailsView({super.key, this.projectTaskDetails});
  final DataTasksProject? projectTaskDetails;
  @override
  State<TasksDetailsView> createState() => _TasksDetailsViewState();
}

class _TasksDetailsViewState extends State<TasksDetailsView> {
  final TasksDetailsViewModel _viewModel = TasksDetailsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgColor,
      drawer: const DrawerView(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
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
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.1),
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                  blurRadius: 25)
                            ]),
                        child: IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(Icons.arrow_back))),
                    Text(AppStrings.taskDetails.getString(context),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Container(
                        decoration: BoxDecoration(
                            color: ColorsManager.iconsColor3,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.1),
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
                  ],
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Text(
                widget.projectTaskDetails!.name!,
                style: TextStyle(
                  fontSize: displayHeight(context) * 0.021,
                  color: ColorsManager.fontColor1,
                  fontWeight: FontWeight.bold,
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
                    left: displayWidth(context) * 0.04,
                    right: displayWidth(context) * 0.04),
                decoration: BoxDecoration(
                    color: ColorsManager.projectsContainerColor,
                    borderRadius:
                        BorderRadius.circular(displayHeight(context) * 0.05),
                    boxShadow: [
                      BoxShadow(
                          color:
                              ColorsManager.defaultShadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                          blurRadius: 25)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.totalSignIn.getString(context)} :',
                      style: TextStyle(
                        fontSize: displayHeight(context) * 0.019,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '00:00',
                      style: TextStyle(
                        fontSize: displayHeight(context) * 0.017,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
                    Text(
                      '${AppStrings.startDate.getString(context)} :',
                      style: TextStyle(
                        fontSize: displayHeight(context) * 0.019,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.projectTaskDetails!.startdate!,
                      style: TextStyle(
                        fontSize: displayHeight(context) * 0.017,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
                    Text(
                      '${AppStrings.dueDate.getString(context)} :',
                      style: TextStyle(
                        fontSize: displayHeight(context) * 0.019,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.projectTaskDetails!.duedate!,
                      style: TextStyle(
                        fontSize: displayHeight(context) * 0.017,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
                    left: displayWidth(context) * 0.04,
                    right: displayWidth(context) * 0.04),
                decoration: BoxDecoration(
                    color: ColorsManager.projectsContainerColor,
                    borderRadius:
                        BorderRadius.circular(displayHeight(context) * 0.05),
                    boxShadow: [
                      BoxShadow(
                          color:
                              ColorsManager.defaultShadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                          blurRadius: 25)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.taskFor.getString(context)} :',
                      style: TextStyle(
                        fontSize: displayHeight(context) * 0.019,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListView.builder(
                      itemCount: widget.projectTaskDetails!.assignees!.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 8),
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          widget.projectTaskDetails!.assignees![index]
                                  ['full_name'] ??
                              '',
                          style: TextStyle(
                            fontSize: displayHeight(context) * 0.017,
                            color: ColorsManager.fontColor1,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
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
                    left: displayWidth(context) * 0.04,
                    right: displayWidth(context) * 0.04),
                decoration: BoxDecoration(
                    color: ColorsManager.projectsContainerColor,
                    borderRadius:
                        BorderRadius.circular(displayHeight(context) * 0.05),
                    boxShadow: [
                      BoxShadow(
                          color:
                              ColorsManager.defaultShadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                          blurRadius: 25)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.description.getString(context)} :',
                      style: TextStyle(
                        fontSize: displayHeight(context) * 0.019,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    HtmlWidget(
                      widget.projectTaskDetails!.description!,
                      textStyle: TextStyle(
                        fontSize: displayHeight(context) * 0.017,
                        color: ColorsManager.fontColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.035,
              ),
              // Container(
              //   width: displayWidth(context) * 0.9,
              //   height: displayHeight(context) * 0.15,
              //   decoration: BoxDecoration(
              //       color: ColorsManager.projectsContainerColor,
              //       borderRadius:
              //           BorderRadius.circular(displayHeight(context) * 0.05),
              //       boxShadow: [
              //         BoxShadow(
              //             color:
              //                 ColorsManager.defaultShadowColor.withOpacity(0.1),
              //             spreadRadius: 0,
              //             offset: const Offset(0, 4),
              //             blurRadius: 25)
              //       ]),
              //   child: TextField(
              //     obscureText: false,
              //     maxLines: 3,
              //     controller: _viewModel.taskCommentController,
              //     decoration: InputDecoration(
              //       filled: true,
              //       contentPadding: EdgeInsets.symmetric(
              //           horizontal: displayWidth(context) * 0.04,
              //           vertical: displayHeight(context) * 0.02),
              //       fillColor: const Color(0xffffffff),
              //       hintText: '${AppStrings.comment.getString(context)} ...',
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(
              //             Radius.circular(displayHeight(context) * 0.05)),
              //         borderSide:
              //             const BorderSide(width: 0, color: Color(0xffffffff)),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(
              //             Radius.circular(displayHeight(context) * 0.05)),
              //         borderSide:
              //             const BorderSide(width: 0, color: Color(0xffffffff)),
              //       ),
              //       // border: const OutlineInputBorder(
              //       //   borderRadius: BorderRadius.all(Radius.circular(displayHeight(context) * 0.05)),
              //       //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
              //       // ),
              //     ),
              //     style: const TextStyle(
              //         fontSize: 15, fontWeight: FontWeight.normal),
              //   ),
              // ),
              // SizedBox(
              //   height: displayHeight(context) * 0.035,
              // ),
              // SizedBox(
              //     width: displayWidth(context) * 0.9,
              //     height: displayHeight(context) * 0.07,
              //     child: ElevatedButton(
              //       onPressed: () async {
              //         if (_viewModel.taskCommentController.text.isEmpty) {
              //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //               content: Text(
              //                   AppStrings.fillFields.getString(context))));
              //         } else {
              //           WidgetsConstants.showProgressIndicator(
              //               context, true, '');
              //         }
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              //         foregroundColor: const Color(0xffffffff),
              //       ),
              //       child: Text(AppStrings.addComment.getString(context),
              //           style:
              //               const TextStyle(color: ColorsManager.fontColor3)),
              //     )),
              // SizedBox(
              //   height: displayHeight(context) * 0.035,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
