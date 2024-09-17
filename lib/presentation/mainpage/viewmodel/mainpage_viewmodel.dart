import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:oraxcrm/presentation/homescreen/view/home_screen.dart';
import 'package:oraxcrm/presentation/profile/view/profile.dart';

class MainPageViewModel extends ChangeNotifier{
  late MotionTabBarController motionTabBarController;

  List<Widget> pages = [
    HomeScreenView(),
    ProfileView()
  ];
}