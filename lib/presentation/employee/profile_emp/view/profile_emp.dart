import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/presentation/employee/profile_emp/viewmodel/profile_emp_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class ProfileEmp extends StatefulWidget {
  const ProfileEmp({super.key});

  @override
  State<ProfileEmp> createState() => _ProfileEmpState();
}

class _ProfileEmpState extends State<ProfileEmp> {
  final ProfileEmpViewmodel _viewModel = ProfileEmpViewmodel();

  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: displayWidth(context) * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.profile.getString(context),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: ColorsManager.profilePicBorderColor),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.2),
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                  blurRadius: 4)
                            ]),
                        child: const CircleAvatar(),
                      ),
                      SizedBox(
                    height: displayHeight(context) * 0.04,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.push(Routes.personalInfoRoute);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.bgColor,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(),
                          padding:
                              EdgeInsets.all(displayHeight(context) * 0.025)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/user.svg'),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                SizedBox(
                                  child: Text(
                                    AppStrings.personalInfo.getString(context),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: ColorsManager.fontColor1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: displayHeight(context) * 0.02,
                              color: ColorsManager.iconsColor1,
                            )
                          ])),
                  Container(
                    height: 1,
                    color: ColorsManager.separatorColor,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.bgColor,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(),
                          padding:
                              EdgeInsets.all(displayHeight(context) * 0.025)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/edit.svg'),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                SizedBox(
                                  child: Text(
                                    AppStrings.changePassword
                                        .getString(context),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: ColorsManager.fontColor1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: displayHeight(context) * 0.02,
                              color: ColorsManager.iconsColor1,
                            )
                          ])),
                  Container(
                    height: 1,
                    color: ColorsManager.separatorColor,
                  ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
      );
  }
}