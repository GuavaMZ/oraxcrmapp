import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:oraxcrm/presentation/homescreen/view/home_screen.dart';
import 'package:oraxcrm/presentation/notifications/view/notifications.dart';
import 'package:oraxcrm/presentation/profile/view/profile.dart';

class MainPageViewModel extends ChangeNotifier {
  late MotionTabBarController motionTabBarController;

  List<Widget> pages = const [
    HomeScreenView(),
    NotificationsView(),
    HomeScreenView(),
    ProfileView(),
  ];

  List<IconData> navBarIcons = [
    Icons.home_rounded,
    Icons.notifications_rounded,
    Icons.add,
    Icons.person_rounded,
  ];

  changePage(int index) {
    motionTabBarController.animateTo(index);
    notifyListeners();
  }
}
