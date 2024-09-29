import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraxcrm/presentation/about_us/viewmodel/about_us_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  final AboutUsViewmodel _viewModel = AboutUsViewmodel();
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
                      Text(AppStrings.aboutUs.getString(context),
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
                SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.aboutUs.getString(context),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.theOraxCrmAplication.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.features.getString(context),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.hourCustomerService.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.designCreatedByTheTeam.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.accuracy.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings. available.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.04,
                  ),
                SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.uiUx.getString(context),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.webDevelopment.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.erpSystems.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.webDevelopment.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: 
                      Text(AppStrings.mobileApp.getString(context),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
              ]),
          )
        ),
      ),
      );
      
  }
}