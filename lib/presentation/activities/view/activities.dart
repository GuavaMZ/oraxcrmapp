import 'package:flutter/material.dart';
import 'package:oraxcrm/domain/model/project_activities_model.dart';
import 'package:oraxcrm/presentation/activities/viewmodel/activities_viewmodel.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:provider/provider.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({super.key, this.projectActivities});
  final ActiveProjectModel? projectActivities;
  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  final ActivitiesViewmodel _viewModel = ActivitiesViewmodel();
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
            child: Column(children: [
              SizedBox(
                height: displayHeight(context) * 0.06,
              ),
              ListView.builder(
                  itemCount:
                      widget.projectActivities?.dataActiveProject?.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: displayHeight(context) * 0.02),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    if (widget
                        .projectActivities!.dataActiveProject!.isNotEmpty) {
                      return Container(
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
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: ColorsManager
                                            .profilePicBorderColor),
                                    boxShadow: [
                                      BoxShadow(
                                          color: ColorsManager
                                              .defaultShadowColor
                                              .withOpacity(0.2),
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                          blurRadius: 4)
                                    ]),
                                child: CircleAvatar(
                                  radius: displayWidth(context) * 0.07,
                                ),
                              ),
                              SizedBox(
                                width: displayWidth(context) * 0.060,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mahytab Adel',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: displayHeight(context) * 0.020,
                                      color: ColorsManager.fontColor1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: displayHeight(context) * 0.01,
                                  ),
                                  SizedBox(
                                    // width: displayWidth(context) * 0.60,
                                    child: Text(
                                      'Project activity created ticket.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        overflow: TextOverflow.clip,
                                        fontSize:
                                            displayHeight(context) * 0.015,
                                        color: ColorsManager.fontColor1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ));
                    }
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
