import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
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
  void initState() {
    Future.wait([_viewModel.getUserInfo(context)]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _viewModel,
        child: Scaffold(
          backgroundColor: ColorsManager.bgColor,
          resizeToAvoidBottomInset: false,
          drawer: const DrawerView(),
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
                                icon: SvgPicture.asset(
                                    'assets/images/notification 2.svg'))),
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
                            child: Builder(builder: (context) {
                              return IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/images/menu-1 3.svg'));
                            }))
                      ],
                    ),
                  ),
                  SizedBox(height: displayHeight(context) * 0.05),
                  CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: ColorsManager.buttonColor1,
                            borderRadius: BorderRadius.circular(
                                displayHeight(context) * 0.05),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: ColorsManager.buttonColor2,
                            borderRadius: BorderRadius.circular(
                                displayHeight(context) * 0.05),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 19, 19),
                            borderRadius: BorderRadius.circular(
                                displayHeight(context) * 0.05),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        padEnds: false,
                      )),
                  SizedBox(height: displayHeight(context) * 0.05),
                  Text(AppStrings.home.getString(context),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(AppStrings.home.getString(context),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(AppStrings.home.getString(context),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(AppStrings.home.getString(context),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ));
  }
}
