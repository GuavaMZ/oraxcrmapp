import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:oraxcrm/app/app.dart';
import 'package:oraxcrm/presentation/add_bottomsheet/view/add_bottomsheet.dart';
import 'package:oraxcrm/presentation/mainpage/viewmodel/mainpage_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView>
    with SingleTickerProviderStateMixin {
  final MainPageViewModel _viewModel = MainPageViewModel();

  @override
  void initState() {
    _viewModel.motionTabBarController =
        MotionTabBarController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.motionTabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _viewModel,
        child: Scaffold(
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                MotionTabBar(
                  controller: _viewModel.motionTabBarController,
                  initialSelectedTab: AppStrings.home.getString(context),
                  labels: [
                    AppStrings.home.getString(context),
                    AppStrings.notifications.getString(context),
                    "Add",
                    AppStrings.profile.getString(context)
                  ],
                  icons: _viewModel.navBarIcons,
                  onTabItemSelected: (int index) {
                    if (index == 2) {
                      showModalBottomSheet(
                        context: context,
                        constraints: BoxConstraints(
                            maxHeight: displayHeight(context) * 0.23),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    displayHeight(context) * 0.055),
                                topRight: Radius.circular(
                                    displayHeight(context) * 0.055))),
                        builder: (BuildContext context) {
                          return const AddBottomsheetView();
                        },
                      );
                    } else {
                      _viewModel.changePage(index);
                    }
                  },
                ),
                // FloatingActionButton(
                //     backgroundColor: ColorsManager.buttonColor1,
                //     shape: const CircleBorder(),
                //     child: const Icon(Icons.add,color: Color(0xffffffff),),
                //     onPressed: () {
                //       showModalBottomSheet(
                //         context: context,
                //         constraints: BoxConstraints(
                //             maxHeight: displayHeight(context) * 0.23),
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(
                //                     displayHeight(context) * 0.055),
                //                 topRight: Radius.circular(
                //                     displayHeight(context) * 0.055))),
                //         builder: (BuildContext context) {
                //           return const AddBottomsheetView();
                //         },
                //       );
                //     })
              ],
            ),
          ),
          body: TabBarView(
            controller: _viewModel.motionTabBarController,
            physics: const NeverScrollableScrollPhysics(),
            children: _viewModel.pages,
          ),
        ));
  }
}
