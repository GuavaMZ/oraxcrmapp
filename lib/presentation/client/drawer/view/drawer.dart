import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:oraxcrm/presentation/client/drawer/viewmodel/drawer_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  // final DrawerViewmodel _viewModel = DrawerViewmodel();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: displayWidth(context) * 0.8,
      backgroundColor: ColorsManager.bgColor,
      child: Column(
        children: [
          DrawerHeader(
            child: SizedBox(
                width: displayWidth(context),
                child: Image.asset('assets/images/Logo2.jpg')),
          ),
          ElevatedButton(
              onPressed: () {
                context.pushReplacement(Routes.mainScreenRoute);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.bgColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(),
                  padding: EdgeInsets.all(displayHeight(context) * 0.025)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/home_unselected.svg',
                          color: ColorsManager.iconsColor1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                        ),
                        SizedBox(
                          child: Text(
                            AppStrings.home.getString(context),
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
              onPressed: () {
                context.push(Routes.aboutUsRoute);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.bgColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(),
                  padding: EdgeInsets.all(displayHeight(context) * 0.025)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/messages-3 1.svg',
                          color: ColorsManager.iconsColor1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                        ),
                        SizedBox(
                          child: Text(
                            AppStrings.aboutUs.getString(context),
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
              onPressed: () {
                context.push(Routes.contactUsRoute);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.bgColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(),
                  padding: EdgeInsets.all(displayHeight(context) * 0.025)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/phone 1.svg',
                          color: ColorsManager.iconsColor1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                        ),
                        SizedBox(
                          child: Text(
                            AppStrings.contactUs.getString(context),
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
          // ElevatedButton(
          //     onPressed: () {
          //       // context.push(Routes.personalInfoRoute);
          //     },
          //     style: ElevatedButton.styleFrom(
          //         backgroundColor: ColorsManager.bgColor,
          //         elevation: 0,
          //         shape: const RoundedRectangleBorder(),
          //         padding: EdgeInsets.all(displayHeight(context) * 0.025)),
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Row(
          //             children: [
          //               SvgPicture.asset(
          //                 'assets/images/repeat 1.svg',
          //                 color: ColorsManager.iconsColor1,
          //               ),
          //               const Padding(
          //                 padding: EdgeInsets.only(right: 15),
          //               ),
          //               SizedBox(
          //                 child: Text(
          //                   AppStrings.arabic.getString(context),
          //                   style: const TextStyle(
          //                     fontSize: 16,
          //                     color: ColorsManager.fontColor1,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Icon(
          //             Icons.arrow_forward_ios_rounded,
          //             size: displayHeight(context) * 0.02,
          //             color: ColorsManager.iconsColor1,
          //           )
          //         ])),
          // Container(
          //   height: 1,
          //   color: ColorsManager.separatorColor,
          // ),
        ],
      ),
    );
  }
}
