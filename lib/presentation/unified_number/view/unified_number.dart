import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/unified_number/viewmodel/unified_number_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UnifiedNumberView extends StatefulWidget {
  const UnifiedNumberView({super.key});

  @override
  State<UnifiedNumberView> createState() => _UnifiedNumberViewState();
}

class _UnifiedNumberViewState extends State<UnifiedNumberView> {
  final UnifiedNumberViewmodel _viewModel = UnifiedNumberViewmodel();

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
                      Text(AppStrings.unifiedNumber.getString(context),
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
                                    AppStrings.call.getString(context),
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
                      onPressed: () async {
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
                                SvgPicture.asset('assets/images/messages.svg'),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                SizedBox(
                                  child: Text(
                                    AppStrings.textMessage.getString(context),
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
                      onPressed: () async {
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
                                SvgPicture.asset('assets/images/whatsapp 1.svg'),
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                SizedBox(
                                  child: Text(
                                    AppStrings.whatsapp.getString(context),
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
              ],
            ),
          ),
        ),
      ));
  }
}