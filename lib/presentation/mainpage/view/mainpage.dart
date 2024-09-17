import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:oraxcrm/presentation/mainpage/viewmodel/mainpage_viewmodel.dart';
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
        MotionTabBarController(length: 4, initialIndex: 0, vsync: this);
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
          bottomNavigationBar: MotionTabBar(
            initialSelectedTab: '',
            labels: [],
          ),
        ));
  }
}
