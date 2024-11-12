import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
            Container(
                width: displayWidth(context) * 0.95,
                padding: EdgeInsets.only(
                    top: displayHeight(context) * 0.03,
                    bottom: displayHeight(context) * 0.03,
                    left: displayWidth(context) * 0.07,
                    right: displayWidth(context) * 0.07),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Random Ticket',
                          style: TextStyle(
                            fontSize: displayHeight(context) * 0.017,
                            color: ColorsManager.fontColor1,
                          ),
                        ),
                        Text(
                          'Fixed Rate',
                          style: TextStyle(
                            fontSize: displayHeight(context) * 0.017,
                            color: ColorsManager.fontColor1,
                          ),
                        ),
                        Text(
                          '8 Sep 2024 : 8 Sep 2025',
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
                          horizontal: displayWidth(context) * 0.06,
                          vertical: displayHeight(context) * 0.005),
                      child: Text(
                        'Closed',
                        style: TextStyle(
                            color: ColorsManager.fontColor3,
                            fontSize: displayHeight(context) * 0.018),
                      ),
                    )
                  ],
                )),
          ])),
        ),
      ),
    );
  }
}
