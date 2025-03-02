import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';
import 'package:oraxcrm/domain/model/project_files_model.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class ProjectFiles extends StatefulWidget {
  const ProjectFiles({super.key, this.projectFiles});
  final FilesProjectModel? projectFiles;
  @override
  State<ProjectFiles> createState() => _ProjectFilesState();
}

class _ProjectFilesState extends State<ProjectFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
        SizedBox(height: displayHeight(context) * 0.04),
        ListView.builder(
            itemCount: widget.projectFiles?.data.length,
            padding:
                EdgeInsets.symmetric(horizontal: displayHeight(context) * 0.02),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              if (widget.projectFiles!.data.isNotEmpty) {
                return Container(
                  margin:
                      EdgeInsets.only(bottom: displayHeight(context) * 0.02),
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
                                color: ColorsManager.defaultShadowColor
                                    .withValues(alpha: 0.1),
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
                                widget
                                    .projectFiles!.data[index].originalFileName
                                    .toString(),
                                style: TextStyle(
                                  fontSize: displayHeight(context) * 0.017,
                                  color: ColorsManager.fontColor1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.projectFiles!.data[index].filetype}',
                                style: TextStyle(
                                  fontSize: displayHeight(context) * 0.017,
                                  color: ColorsManager.fontColor2,
                                ),
                              ),
                              Text(
                                widget.projectFiles!.data[index].lastActivity ??
                                    '${AppStrings.lastActivity.getString(context)} : ${AppStrings.notExist.getString(context)}',
                                style: TextStyle(
                                    color: ColorsManager.fontColor1,
                                    fontSize: displayHeight(context) * 0.015),
                              ),
                            ],
                          ),
                          if (widget.projectFiles!.data[index].filetype
                                  .toString()
                                  .split('/')
                                  .first ==
                              'image')
                            ExtendedImage.network(
                              '${ApiLinks.baseUrl}uploads/projects/${widget.projectFiles!.data[index].projectId}/${widget.projectFiles!.data[index].fileName}',
                              fit: BoxFit.scaleDown,
                              width: displayWidth(context) * 0.12,
                            )
                        ],
                      ),
                    ),
                  ),
                );
              }
            })
      ]))),
    );
  }
}
