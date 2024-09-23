import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text(
                          DataHolders.userDataModel!.data!.firstname!,
                          style: const TextStyle(
                              fontSize: 12, color: ColorsManager.fontColor2),
                        )
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
                  ],
                ),
                SizedBox(
                  height: displayHeight(context) * 0.04,
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
                              SvgPicture.asset('assets/images/user.svg'),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                              ), //TODO:ICON HERE
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
                              ), //TODO:ICON HERE
                              SizedBox(
                                child: Text(
                                  AppStrings.changePassword.getString(context),
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
                              SvgPicture.asset('assets/images/document.svg'),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                              ), //TODO:ICON HERE
                              SizedBox(
                                child: Text(
                                  AppStrings.ticketsSummary.getString(context),
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
                              SvgPicture.asset('assets/images/task.svg'),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                              ), //TODO:ICON HERE
                              SizedBox(
                                child: Text(
                                  AppStrings.contracts.getString(context),
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
                              SvgPicture.asset('assets/images/coin.svg'),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                              ), //TODO:ICON HERE
                              SizedBox(
                                child: Text(
                                  AppStrings.projects.getString(context),
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
                              SvgPicture.asset('assets/images/folder.svg'),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                              ), //TODO:ICON HERE
                              SizedBox(
                                child: Text(
                                  AppStrings.files.getString(context),
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
                              SvgPicture.asset('assets/images/help.svg'),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                              ), //TODO:ICON HERE
                              SizedBox(
                                child: Text(
                                  AppStrings.support.getString(context),
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
                              SvgPicture.asset('assets/images/logout.svg'),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                              ), //TODO:ICON HERE
                              SizedBox(
                                child: Text(
                                  AppStrings.signOut.getString(context),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: ColorsManager.fontColor1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
