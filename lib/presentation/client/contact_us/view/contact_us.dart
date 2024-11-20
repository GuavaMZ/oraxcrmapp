import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/presentation/client/contact_us/viewmodel/contact_us_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final ContactUsViewmodel _viewModel = ContactUsViewmodel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        body: SingleChildScrollView(
          child: Center(
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
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back))),
                      Text(AppStrings.contactUs.getString(context),
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
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/images/menu-1 3.svg'))),
                    ],
                  ),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.04,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await launchUrl(Uri.parse('https://www.oraxsoft.com'));
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
                                SvgPicture.asset('assets/images/global 1v.svg'),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                SizedBox(
                                  child: Text(
                                    AppStrings.website.getString(context),
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
                                SvgPicture.asset('assets/images/phone 1.svg'),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                SizedBox(
                                  child: Text(
                                    AppStrings.unifiedNumber.getString(context),
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
                                SvgPicture.asset('assets/images/mail 1.svg'),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                SizedBox(
                                  child: Text(
                                    AppStrings.emailAddress.getString(context),
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
                                SvgPicture.asset('assets/images/location 1.svg'),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                SizedBox(
                                  child: Text(
                                    AppStrings.location.getString(context),
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
              ]),
            ),
          ),
        ),
    );
  }
}
