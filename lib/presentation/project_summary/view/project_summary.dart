import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/domain/model/projects_model.dart';
import 'package:oraxcrm/presentation/projectdetails/viewmodel/project_details_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class ProjectSummaryView extends StatefulWidget {
  const ProjectSummaryView({super.key, this.projectData});
  final Dataprojects? projectData;
  @override
  State<ProjectSummaryView> createState() => _ProjectSummaryViewState();
}

class _ProjectSummaryViewState extends State<ProjectSummaryView> {
  final ProjectDetailsViewModel _viewModel = ProjectDetailsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
            future: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  margin: EdgeInsets.only(top: displayHeight(context) * 0.5),
                  // height: displayHeight(context) * 0.17,
                  alignment: Alignment.center,
                  width: displayWidth(context) * 0.2,
                  child: LoadingAnimationWidget.discreteCircle(
                      color: ColorsManager.discreteCircleFirstColor,
                      secondRingColor: ColorsManager.discreteCircleSecondColor,
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
                              Text(
                                '${widget.projectData?.billingType.toString()}',
                                style: TextStyle(
                                  fontSize: displayHeight(context) * 0.017,
                                  color: ColorsManager.fontColor1,
                                ),
                              ),
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
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.projectProgess.getString(context),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.fontColor1,
                                    fontSize: displayHeight(context) * 0.022),
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.035,
                            ),
                            SizedBox(
                              width: displayWidth(context) * 0.5,
                              height: displayHeight(context) * 0.25,
                              child: PieChart(
                                  swapAnimationDuration: const Duration(
                                      milliseconds: 150), // Optional
                                  swapAnimationCurve: Curves.linear,
                                  PieChartData(sections: [
                                    PieChartSectionData(
                                      color: const Color(0xff000000),
                                    ),
                                    PieChartSectionData(
                                      color: const Color(0xffc8c8c8),
                                    ),
                                    PieChartSectionData(
                                      color: const Color(0xff989898),
                                    ),
                                    PieChartSectionData(
                                      color: const Color(0xff747474),
                                    ),
                                  ])),
                            )
                          ],
                        )),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
