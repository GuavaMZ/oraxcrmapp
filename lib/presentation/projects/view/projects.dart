import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/projects/viewmodel/projects_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final ProjectsViewModel _viewModel = ProjectsViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _viewModel,
        child: Scaffold(
          backgroundColor: ColorsManager.bgColor,
          resizeToAvoidBottomInset: false,
          drawer: const DrawerView(),
          body: SingleChildScrollView(
            child: Center(
              child: Consumer<ProjectsViewModel>(
                builder: (BuildContext context, value, Widget? child) =>
                    FutureBuilder(
                  future: _viewModel.getProjects(context),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        margin:
                            EdgeInsets.only(top: displayHeight(context) * 0.5),
                        // height: displayHeight(context) * 0.17,
                        alignment: Alignment.center,
                        width: displayWidth(context) * 0.2,
                        child: LoadingAnimationWidget.discreteCircle(
                            color: ColorsManager.discreteCircleFirstColor,
                            secondRingColor:
                                ColorsManager.discreteCircleSecondColor,
                            thirdRingColor:
                                ColorsManager.discreteCircleThirdColor,
                            size: displayWidth(context) * 0.1),
                      );
                    } else {
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
                                Text(AppStrings.projects.getString(context),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                    decoration: BoxDecoration(
                                        color: ColorsManager.iconsColor3,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorsManager
                                                  .defaultShadowColor
                                                  .withOpacity(0.1),
                                              spreadRadius: 0,
                                              offset: const Offset(0, 4),
                                              blurRadius: 25)
                                        ]),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                            'assets/images/menu-1 3.svg')))
                              ],
                            ),
                          ),
                          SizedBox(height: displayHeight(context) * 0.04),
                          Container(
                            // width: displayWidth(context) * 0.95,
                            height: displayHeight(context) * 0.17,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.1),
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                  blurRadius: 25)
                            ]),
                            child: ListView.builder(
                              itemCount: _viewModel.projectsStatuses.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: displayWidth(context) * 0.01),
                                  height: displayHeight(context) * 0.17,
                                  width: displayWidth(context) * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          displayHeight(context) * 0.05),
                                    ),
                                    color:
                                        ColorsManager.statisticsContainerColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                            _viewModel
                                                .projectsStatusesCount[index]
                                                .toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.037,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                          _viewModel.projectsStatuses[index]
                                              .toString()
                                              .getString(context),
                                          style: TextStyle(
                                              fontSize: displayHeight(context) *
                                                  0.014,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: displayHeight(context) * 0.04),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: _viewModel.projectsList?.length,
                            padding: EdgeInsets.symmetric(
                                horizontal: displayHeight(context) * 0.02),
                            primary: false,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                              margin: EdgeInsets.only(
                                  bottom: displayHeight(context) * 0.02),
                              child: ElevatedButton(
                                onPressed: () {
                                  context.push(Routes.projectDetailsRoute,
                                      extra: _viewModel.projectsList![index]);
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
                                      left: displayWidth(context) * 0.07,
                                      right: displayWidth(context) * 0.04),
                                  decoration: BoxDecoration(
                                      color:
                                          ColorsManager.projectsContainerColor,
                                      borderRadius: BorderRadius.circular(
                                          displayHeight(context) * 0.05),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorsManager
                                                .defaultShadowColor
                                                .withOpacity(0.1),
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
                                            _viewModel.projectsList![index].name
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: displayHeight(context) *
                                                  0.017,
                                              color: ColorsManager.fontColor1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _viewModel.projectsList![index]
                                                .billingType
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: displayHeight(context) *
                                                  0.017,
                                              color: ColorsManager.fontColor1,
                                            ),
                                          ),
                                          Text(
                                            '${_viewModel.projectsList![index].startDate} : ${_viewModel.projectsList![index].deadline}',
                                            style: TextStyle(
                                              fontSize: displayHeight(context) *
                                                  0.017,
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
                                          _viewModel
                                              .projectsList![index].stateName
                                              .toString()
                                              .getString(context),
                                          style: TextStyle(
                                              color: ColorsManager.fontColor3,
                                              fontSize: displayHeight(context) *
                                                  0.015),
                                        ),
                                      )
                                    ],
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
        ));
  }
}
