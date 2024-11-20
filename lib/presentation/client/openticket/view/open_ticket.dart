import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/domain/model/department_model.dart';
import 'package:oraxcrm/domain/model/priorties_model.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/client/openticket/viewmodel/open_ticket_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/resources/widgets_constants.dart';
import 'package:provider/provider.dart';

class OpenTicketView extends StatefulWidget {
  const OpenTicketView({super.key});

  @override
  State<OpenTicketView> createState() => _OpenTicketViewState();
}

class _OpenTicketViewState extends State<OpenTicketView> {
  final OpenTicketViewmodel _viewModel = OpenTicketViewmodel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _viewModel,
        child: Scaffold(
            backgroundColor: ColorsManager.bgColor,
            resizeToAvoidBottomInset: false,
            drawer: const DrawerView(),
            body: FutureBuilder(
              future: Future.wait([
                _viewModel.getDepartments(context),
                _viewModel.getPriorty(context),
              ]),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      // margin: EdgeInsets.only(top: displayHeight(context) * 0.5),
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
                    ),
                  );
                } else {
                  return SingleChildScrollView(
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
                            Text(AppStrings.openTicket.getString(context),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
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
                      SizedBox(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.07,
                        child: TextField(
                          obscureText: false,
                          controller: _viewModel.subjectController,
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: displayWidth(context) * 0.04,
                                vertical: displayHeight(context) * 0.02),
                            fillColor: const Color(0xffF5F4F4),
                            hintText: AppStrings.subject.getString(context),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffffffff)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffffffff)),
                            ),
                            // border: const OutlineInputBorder(
                            //   borderRadius: BorderRadius.all(Radius.circular(30)),
                            //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                            // ),
                          ),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                      // SizedBox(
                      //   height: displayHeight(context) * 0.035,
                      // ),
                      // SizedBox(
                      //   width: displayWidth(context) * 0.9,
                      //   height: displayHeight(context) * 0.08,
                      //   child: TextField(
                      //     obscureText: false,
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       contentPadding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04,vertical: displayHeight(context) * 0.02),
                      //       fillColor: const Color(0xffF5F4F4),
                      //       hintText: AppStrings.ticketSummary.getString(context),
                      //       enabledBorder: const OutlineInputBorder(
                      //         borderRadius: BorderRadius.all(Radius.circular(30)),
                      //         borderSide:
                      //             BorderSide(width: 0, color: Color(0xffffffff)),
                      //       ),
                      //       focusedBorder: const OutlineInputBorder(
                      //         borderRadius: BorderRadius.all(Radius.circular(30)),
                      //         borderSide:
                      //             BorderSide(width: 0, color: Color(0xffffffff)),
                      //       ),
                      //       // border: const OutlineInputBorder(
                      //       //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      //       //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                      //       // ),
                      //     ),
                      //     style: const TextStyle(
                      //         fontSize: 15, fontWeight: FontWeight.normal),
                      //   ),
                      // ),
                      SizedBox(
                        height: displayHeight(context) * 0.035,
                      ),

                      SizedBox(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.07,
                        child: TextField(
                          obscureText: false,
                          controller: _viewModel.ticketDescriptionController,
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: displayWidth(context) * 0.04,
                                vertical: displayHeight(context) * 0.02),
                            fillColor: const Color(0xffF5F4F4),
                            hintText: AppStrings.ticketText.getString(context),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffffffff)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffffffff)),
                            ),
                            // border: const OutlineInputBorder(
                            //   borderRadius: BorderRadius.all(Radius.circular(30)),
                            //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                            // ),
                          ),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.035,
                      ),
                      Consumer<OpenTicketViewmodel>(
                        builder: (context, viewModel, child) => Container(
                          width: displayWidth(context) * 0.9,
                          height: displayHeight(context) * 0.068,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xffF5F4F4),
                          ),
                          // style: const TextStyle(
                          //     fontSize: 15, fontWeight: FontWeight.normal),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  items: viewModel.derpartmentsList
                                      .map<DropdownMenuItem<String>>((Data e) {
                                    return DropdownMenuItem(
                                      value: e.name,
                                      child: Text(
                                        e.name.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: ColorsManager.fontColor1),
                                      ),
                                    );
                                  }).toList(),
                                  alignment: AlignmentDirectional.topStart,
                                  menuMaxHeight: displayHeight(context) * 0.3,
                                  padding: EdgeInsets.only(
                                      left: displayWidth(context) * 0.01),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  icon: Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            displayWidth(context) * 0.02),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: ColorsManager.buttonColor1,
                                    ),
                                  ),
                                  value: viewModel.department,
                                  onChanged: (String? newValue) {
                                    Provider.of<OpenTicketViewmodel>(context,
                                            listen: false)
                                        .department = newValue!;
                                    viewModel.departmentID = viewModel
                                        .derpartmentsList[viewModel
                                            .derpartmentsList
                                            .indexWhere(
                                                (e) => e.name == newValue)]
                                        .departmentid;
                                    viewModel.toggleNotifyListener();
                                  },
                                )),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: displayHeight(context) * 0.035,
                      ),
                      Consumer<OpenTicketViewmodel>(
                        builder: (context, viewModel, child) => Container(
                          width: displayWidth(context) * 0.9,
                          height: displayHeight(context) * 0.068,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xffF5F4F4),
                          ),
                          // style: const TextStyle(
                          //     fontSize: 15, fontWeight: FontWeight.normal),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  items: viewModel.priortiesList
                                      .map<DropdownMenuItem<String>>(
                                          (DataPriorty e) {
                                    return DropdownMenuItem(
                                      value: e.name,
                                      child: Text(
                                        e.name.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: ColorsManager.fontColor1),
                                      ),
                                    );
                                  }).toList(),
                                  alignment: AlignmentDirectional.topStart,
                                  menuMaxHeight: displayHeight(context) * 0.3,
                                  padding: EdgeInsets.only(
                                      left: displayWidth(context) * 0.01),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  icon: Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            displayWidth(context) * 0.02),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: ColorsManager.buttonColor1,
                                    ),
                                  ),
                                  value: viewModel.priority,
                                  onChanged: (newValue) {
                                    // viewModel.priority = newValue;
                                    Provider.of<OpenTicketViewmodel>(context,
                                            listen: false)
                                        .priority = newValue!;
                                    viewModel.priorityID = viewModel
                                        .priortiesList[viewModel.priortiesList
                                            .indexWhere(
                                                (e) => e.name == newValue)]
                                        .priorityid;
                                    viewModel.toggleNotifyListener();
                                  },
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.035,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.85,
                        child: Text(
                          AppStrings.attachment.getString(context),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.fontColor1),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.022,
                      ),
                      Consumer<OpenTicketViewmodel>(
                        builder:
                            (BuildContext context, viewModel, Widget? child) =>
                                Container(
                          width: displayWidth(context) * 0.85,
                          height: displayHeight(context) * 0.18,
                          margin: EdgeInsets.symmetric(
                              vertical: displayHeight(context) * 0.005,
                              horizontal: displayWidth(context) * 0.01),
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(
                                  displayHeight(context) * 0.02),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.2),
                                  blurRadius: 4,
                                )
                              ]),
                          child: viewModel.imageFileList!.isNotEmpty
                              ? ListView.builder(
                                  itemCount: viewModel.imageFileList!.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  primary: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        ExtendedImage.file(
                                          File(viewModel
                                              .imageFileList![index].path),
                                          width: displayWidth(context) * 0.23,
                                          height: displayHeight(context) * 0.22,
                                          layoutInsets: EdgeInsets.symmetric(
                                              horizontal: 2,
                                              vertical: displayHeight(context) *
                                                  0.008),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xffffffff)
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      displayHeight(context) *
                                                          0.1)),
                                          child: IconButton(
                                              onPressed: () {
                                                viewModel.deletePhoto(index);
                                              },
                                              icon: const Icon(
                                                Icons.delete_forever_rounded,
                                                color: Colors.red,
                                              )),
                                        )
                                      ],
                                    );
                                  },
                                )
                              : Center(
                                  child: IconButton(
                                    onPressed: () async {
                                      await viewModel.adsImagesPicker();
                                    },
                                    splashColor: ColorsManager.buttonColor1,
                                    icon: Icon(
                                      Icons.add_rounded,
                                      size: displayWidth(context) * 0.08,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.035,
                      ),
                      SizedBox(
                          width: displayWidth(context) * 0.9,
                          height: displayHeight(context) * 0.07,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_viewModel.subjectController.text.isEmpty ||
                                  _viewModel.ticketDescriptionController.text
                                      .isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(AppStrings.fillFields
                                            .getString(context))));
                              } else {
                                WidgetsConstants.showProgressIndicator(
                                    context, true, '');
                                try {
                                  // await _viewModel.login(context);
                                  var data = FormData.fromMap({
                                    "subject": _viewModel.subjectController.text
                                        .trim(),
                                    "department":
                                        _viewModel.departmentID ?? '0',
                                    "priority": _viewModel.priorityID ?? '0',
                                    "project": _viewModel.projectID ?? '0',
                                    "TicketBody": _viewModel
                                        .ticketDescriptionController.text
                                        .trim(),
                                    'files': _viewModel.imageFileList!.isEmpty
                                        ? null
                                        : [
                                            await dio.MultipartFile.fromFile(
                                                _viewModel
                                                    .imageFileList![0].path,
                                                filename: _viewModel
                                                    .imageFileList![0].name
                                                    .toString()),
                                          ],
                                  });
                                  final res = await _viewModel.sendTicket(data);
                                  print(res);
                                  if (res.data['status'] == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(AppStrings
                                                .ticketSubmitted
                                                .getString(context))));
                                  }
                                  context.pushReplacement(
                                      Routes.ticketsSummaryRoute);
                                  if (context.mounted) {
                                    context.pop();
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              foregroundColor: const Color(0xffffffff),
                            ),
                            child: Text(
                                AppStrings.openTicket.getString(context),
                                style: const TextStyle(
                                    color: ColorsManager.fontColor3)),
                          )),
                    ]),
                  ));
                }
              },
            )));
  }
}
