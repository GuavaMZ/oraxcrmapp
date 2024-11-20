import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/domain/model/projects_model.dart';
import 'package:oraxcrm/presentation/client/activities/view/activities.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/client/project_discussions/view/project_discussions.dart';
import 'package:oraxcrm/presentation/client/project_files/view/project_files_view.dart';
import 'package:oraxcrm/presentation/client/project_summary/view/project_summary.dart';
import 'package:oraxcrm/presentation/client/projectdetails/viewmodel/project_details_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/client/tasks/view/tasks.dart';
import 'package:oraxcrm/presentation/client/tickets/view/tickets.dart';
import 'package:provider/provider.dart';

class ProjectDetailsView extends StatefulWidget {
  const ProjectDetailsView({super.key, this.projectData});
  final Dataprojects? projectData;
  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView>
    with SingleTickerProviderStateMixin {
  final ProjectDetailsViewModel _viewModel = ProjectDetailsViewModel();

  @override
  void initState() {
    _viewModel.tabController = TabController(
      length: _viewModel.projectDetailsPages.length,
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _viewModel.tabController.dispose();
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
          body: DefaultTabController(
              length: 4,
              initialIndex: 0,
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
                        Text(AppStrings.projectDetails.getString(context),
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
                    height: displayHeight(context) * 0.04,
                  ),
                  Consumer<ProjectDetailsViewModel>(
                    builder: (BuildContext context, viewModel, Widget? child) =>
                        Container(
                      height: displayHeight(context) * 0.05,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: ColorsManager.defaultShadowColor
                                .withOpacity(0.1),
                            spreadRadius: 0,
                            offset: const Offset(0, 4),
                            blurRadius: 25)
                      ]),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: viewModel.projectDetailsTitles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: displayWidth(context) * 0.02,
                              ),
                              ChoiceChip(
                                  label: Text(
                                    viewModel.projectDetailsTitles[index]
                                        .toString()
                                        .getString(context),
                                    style: TextStyle(
                                        color: viewModel
                                                    .initProjectDetailsPage ==
                                                viewModel
                                                    .projectDetailsTitles[index]
                                            ? ColorsManager.fontColor3
                                            : ColorsManager.fontColor1),
                                  ),
                                  labelPadding: EdgeInsets.symmetric(
                                      horizontal: displayWidth(context) * 0.02),
                                  selected: viewModel.initProjectDetailsPage ==
                                      viewModel.projectDetailsTitles[index],
                                  onSelected: (b) {
                                    viewModel.initProjectDetailsPage =
                                        viewModel.projectDetailsTitles[index];
                                    viewModel.tabController.animateTo(index,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                    viewModel.toggleNotifyListeners();
                                  },
                                  showCheckmark: false,
                                  side: const BorderSide(
                                      width: 0,
                                      color:
                                          ColorsManager.choiceChipBorderColor),
                                  selectedColor:
                                      ColorsManager.selectedChoiceChipColor,
                                  backgroundColor:
                                      ColorsManager.unSelectedChoiceChipColor,
                                  // elevation: 1,
                                  shadowColor: ColorsManager.defaultShadowColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            displayHeight(context) * 0.03)),
                                  )),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: Future.wait([
                      _viewModel.getProjectTasks(
                          context, widget.projectData!.id!),
                      _viewModel.getProjectTickets(
                          context, widget.projectData!.id!),
                      _viewModel.getProjectDiscussions(
                          context, widget.projectData!.id!),
                      _viewModel.getProjectFiles(
                          context, widget.projectData!.id!)
                      // _viewModel.getProjectActivities(
                      //     context, widget.projectData!.id!),
                    ]),
                    builder: (context, snapshot) => Expanded(
                      child: TabBarView(
                          controller: _viewModel.tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            ProjectSummaryView(
                              projectData: widget.projectData,
                              projectTasksDetails: _viewModel.projectsTasks,
                            ),
                            TasksView(
                              projectTasksDetails: _viewModel.projectsTasks,
                            ),
                            TicketsView(
                              projectTicketsModel: _viewModel.projectsTickets,
                            ),
                            ProjectDiscussionsView(
                              discussionsProjectModel:
                                  _viewModel.projectDiscussions,
                            ),
                            ProjectFiles(
                              projectFiles: _viewModel.projectFiles,
                            )
                            // ActivitiesView(
                            //   projectActivities: _viewModel.projectActivities,
                            // )
                          ]),
                    ),
                  )
                ],
              )),
        ));
  }
}
