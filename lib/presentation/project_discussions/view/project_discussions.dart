import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/domain/model/project_discussions_model.dart';
import 'package:oraxcrm/presentation/project_discussions/viewmodel/project_discussions_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class ProjectDiscussionsView extends StatefulWidget {
  const ProjectDiscussionsView({super.key, this.discussionsProjectModel});
  final DiscussionsProjectModel? discussionsProjectModel;
  @override
  State<ProjectDiscussionsView> createState() => _ProjectDiscussionsViewState();
}

class _ProjectDiscussionsViewState extends State<ProjectDiscussionsView> {
  final ProjectDiscussionsViewModel _viewModel = ProjectDiscussionsViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                ListView.builder(
                  itemCount:
                      widget.discussionsProjectModel?.dataDiscussions?.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: displayHeight(context) * 0.02),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    if (widget
                        .discussionsProjectModel!.dataDiscussions!.isNotEmpty) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: displayHeight(context) * 0.02),
                        child: ElevatedButton(
                            onPressed: () {
                              // context.push(Routes.discussionDetailsRoute,
                              //     extra: widget.discussionsProjectModel!
                              //         .dataDiscussions![index]);
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
                                    left: displayWidth(context) * 0.04,
                                    right: displayWidth(context) * 0.06),
                                decoration: BoxDecoration(
                                    color: ColorsManager.projectsContainerColor,
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
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.discussionsProjectModel!
                                              .dataDiscussions![index].subject
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.018,
                                            color: ColorsManager.fontColor1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${AppStrings.totalComments.getString(context)} : ${widget.discussionsProjectModel!.dataDiscussions![index].totalComments}',
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                        Text(
                                          '${AppStrings.lastActivity.getString(context)} : ${widget.discussionsProjectModel!.dataDiscussions![index].lastActivity.toString().split(' ').first}',
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                        Text(
                                          '${AppStrings.description.getString(context)} : ${widget.discussionsProjectModel!.dataDiscussions![index].description}',
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
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
