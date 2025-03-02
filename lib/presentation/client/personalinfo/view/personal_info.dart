import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/client/personalinfo/viewmodel/personal_info_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final PersonalInfoViewModel _viewModel = PersonalInfoViewModel();

  @override
  void initState() {
    _viewModel.firstNameController.text =
        DataHolders.userDataModel!.data!.firstname!;
    _viewModel.lastNameController.text =
        DataHolders.userDataModel!.data!.lastname!;
    _viewModel.emailController.text = DataHolders.userDataModel!.data!.email!;
    _viewModel.phoneNumberController.text =
        DataHolders.userDataModel!.data!.phonenumber!;
    _viewModel.positionController.text =
        DataHolders.userDataModel!.data!.title!;
    // _viewModel.firstNameController.text = DataHolders.userDataModel!.data!.!;
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
            body: SingleChildScrollView(
                child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            .withValues(alpha: 0.1),
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                        blurRadius: 25)
                                  ]),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      'assets/images/menu-1 3.svg'))),
                          Text(AppStrings.personalInfo.getString(context),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Container(
                              decoration: BoxDecoration(
                                  color: ColorsManager.iconsColor3,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorsManager.defaultShadowColor
                                            .withValues(alpha: 0.1),
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                        blurRadius: 25)
                                  ]),
                              child: IconButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/images/arrow-left 2.svg'))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.05,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: displayWidth(context) * 0.06,
                          right: displayWidth(context) * 0.05),
                      child: Text(AppStrings.firstName.getString(context),
                          style: TextStyle(
                              fontSize: displayHeight(context) * 0.019,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.015,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.9,
                      height: displayHeight(context) * 0.065,
                      child: TextField(
                        controller: _viewModel.firstNameController,
                        obscureText: false,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              left: displayWidth(context) * 0.06,
                              right: displayWidth(context) * 0.06,
                              top: displayHeight(context) * 0.02,
                              bottom: displayHeight(context) * 0.02),
                          fillColor: const Color(0xffF5F4F4),
                          hintText: AppStrings.firstName.getString(context),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
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
                      height: displayHeight(context) * 0.022,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: displayWidth(context) * 0.06,
                          right: displayWidth(context) * 0.05),
                      child: Text(AppStrings.lastName.getString(context),
                          style: TextStyle(
                              fontSize: displayHeight(context) * 0.019,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.015,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.9,
                      height: displayHeight(context) * 0.065,
                      child: TextField(
                        controller: _viewModel.lastNameController,
                        obscureText: false,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              left: displayWidth(context) * 0.06,
                              right: displayWidth(context) * 0.06,
                              top: displayHeight(context) * 0.02,
                              bottom: displayHeight(context) * 0.02),
                          fillColor: const Color(0xffF5F4F4),
                          hintText: AppStrings.lastName.getString(context),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
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
                      height: displayHeight(context) * 0.022,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: displayWidth(context) * 0.06,
                          right: displayWidth(context) * 0.05),
                      child: Text(AppStrings.emailaddress.getString(context),
                          style: TextStyle(
                              fontSize: displayHeight(context) * 0.019,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.015,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.9,
                      height: displayHeight(context) * 0.065,
                      child: TextField(
                        controller: _viewModel.emailController,
                        obscureText: false,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              left: displayWidth(context) * 0.06,
                              right: displayWidth(context) * 0.06,
                              top: displayHeight(context) * 0.02,
                              bottom: displayHeight(context) * 0.02),
                          fillColor: const Color(0xffF5F4F4),
                          hintText: AppStrings.emailaddress.getString(context),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
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
                      height: displayHeight(context) * 0.022,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: displayWidth(context) * 0.06,
                          right: displayWidth(context) * 0.05),
                      child: Text(AppStrings.phoneNumber.getString(context),
                          style: TextStyle(
                              fontSize: displayHeight(context) * 0.019,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.015,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.9,
                      height: displayHeight(context) * 0.065,
                      child: TextField(
                        controller: _viewModel.phoneNumberController,
                        obscureText: false,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              left: displayWidth(context) * 0.06,
                              right: displayWidth(context) * 0.06,
                              top: displayHeight(context) * 0.02,
                              bottom: displayHeight(context) * 0.02),
                          fillColor: const Color(0xffF5F4F4),
                          hintText: AppStrings.phoneNumber.getString(context),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
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
                      height: displayHeight(context) * 0.022,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: displayWidth(context) * 0.06,
                          right: displayWidth(context) * 0.05),
                      child: Text(AppStrings.position.getString(context),
                          style: TextStyle(
                              fontSize: displayHeight(context) * 0.019,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.015,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.9,
                      height: displayHeight(context) * 0.065,
                      child: TextField(
                        controller: _viewModel.positionController,
                        obscureText: false,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              left: displayWidth(context) * 0.06,
                              right: displayWidth(context) * 0.06,
                              top: displayHeight(context) * 0.02,
                              bottom: displayHeight(context) * 0.02),
                          fillColor: const Color(0xffF5F4F4),
                          hintText: AppStrings.position.getString(context),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 0, color: Color(0xffffffff)),
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
                      height: displayHeight(context) * 0.022,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: displayWidth(context) * 0.06),
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(AppStrings.direction.getString(context),
                    //       style: TextStyle(
                    //           fontSize: displayHeight(context) * 0.019,
                    //           fontWeight: FontWeight.w400)),
                    // ),
                    // SizedBox(
                    //   height: displayHeight(context) * 0.015,
                    // ),
                    // SizedBox(
                    //   width: displayWidth(context) * 0.9,
                    //   height: displayHeight(context) * 0.065,
                    //   child: TextField(
                    //     controller: _viewModel.directionController,
                    //     obscureText: false,
                    //     readOnly: true,
                    //     decoration: InputDecoration(
                    //       filled: true,
                    //       contentPadding: EdgeInsets.only(
                    //           left: displayWidth(context) * 0.06,
                    //           top: displayHeight(context) * 0.02,
                    //           bottom: displayHeight(context) * 0.02),
                    //       fillColor: const Color(0xffF5F4F4),
                    //       hintText: AppStrings.direction.getString(context),
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
                      height: displayHeight(context) * 0.022,
                    ),
                  ]),
            ))));
  }
}
