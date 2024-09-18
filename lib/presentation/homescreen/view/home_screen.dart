import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:oraxcrm/app/app.dart';
import 'package:oraxcrm/presentation/homescreen/viewmodel/home_screen_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final HomeScreenViewmodel _viewModel = HomeScreenViewmodel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _viewModel,
        child: Scaffold(
          backgroundColor: ColorsManager.bgColor,
          resizeToAvoidBottomInset: false,
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
                                icon:
                                    const Icon(Icons.abc))), //TODO:CHANGE ICON
                        Text(AppStrings.home.getString(context),
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
                                icon: const Icon(Icons.abc))) //TODO:CHANGE ICON
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
