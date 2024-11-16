import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/files/viewmodel/files_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class FilesView extends StatefulWidget {
  const FilesView({super.key});

  @override
  State<FilesView> createState() => _FilesViewState();
}

class _FilesViewState extends State<FilesView> {
  final FilesViewmodel _viewModel = FilesViewmodel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        resizeToAvoidBottomInset: false,
        drawer: const DrawerView(),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
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
                  Text(AppStrings.files.getString(context),
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
                          icon:
                              SvgPicture.asset('assets/images/menu-1 3.svg'))),
                ],
              ),
            ),
            SizedBox(
              height: displayHeight(context) * 0.05,
            ),
            FutureBuilder(
              future: _viewModel.getFiles(context),
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
                  if (_viewModel.filesList!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: _viewModel.filesList!.length,
                      padding: EdgeInsets.symmetric(
                          horizontal: displayHeight(context) * 0.02),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: EdgeInsets.only(
                                bottom: displayHeight(context) * 0.02),
                            child: ElevatedButton(
                              onPressed: () {
                                // context.push(Routes.tasksDetailsRoute,
                                //     extra: widget.projectFiles!
                                //         .data[index]);
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
                                    left: displayWidth(context) * 0.08,
                                    right: displayWidth(context) * 0.08),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _viewModel.filesList![index].fileName
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          _viewModel.filesList![index].filetype
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor2,
                                          ),
                                        ),
                                        // Text(
                                        //   widget.projectFiles!.data[index]
                                        //           .lastActivity ??
                                        //       '${AppStrings.lastActivity.getString(context)} : ${AppStrings.notExist.getString(context)}',
                                        //   style: TextStyle(
                                        //       color: ColorsManager.fontColor1,
                                        //       fontSize: displayHeight(context) *
                                        //           0.015),
                                        // ),
                                      ],
                                    ),
                                    // if (widget.projectFiles!.data[index].filetype
                                    //         .toString()
                                    //         .split('/')
                                    //         .first ==
                                    //     'image')
                                    //   ExtendedImage.network(
                                    //     '${ApiLinks.baseUrl}uploads/projects/${widget.projectFiles!.data[index].projectId}/${widget.projectFiles!.data[index].fileName}',
                                    //     fit: BoxFit.scaleDown,
                                    //     width: displayWidth(context) * 0.12,
                                    //   )
                                  ],
                                ),
                              ),
                            ));
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        AppStrings.noFilesToShow.getString(context),
                        style: const TextStyle(
                            fontSize: 18,
                            color: ColorsManager.fontColor1,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                }
              },
            ),
          ])),
        ),
      ),
    );
  }
}
