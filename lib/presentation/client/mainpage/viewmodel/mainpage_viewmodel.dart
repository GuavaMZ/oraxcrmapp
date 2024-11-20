import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:oraxcrm/presentation/client/homescreen/view/home_screen.dart';
import 'package:oraxcrm/presentation/client/knowlege_base/view/knowledge_base_view.dart';
import 'package:oraxcrm/presentation/client/notifications/view/notifications.dart';
import 'package:oraxcrm/presentation/client/profile/view/profile.dart';

class MainPageViewModel extends ChangeNotifier {
  late MotionTabBarController motionTabBarController;

  List<Widget> pages = const [
    HomeScreenView(),
    NotificationsView(),
    HomeScreenView(),
    KnowledgeBaseView(),
    ProfileView(),
  ];

  List<IconData> navBarIcons = [
    Icons.home_rounded,
    Icons.notifications_rounded,
    Icons.add,
    Icons.developer_board_rounded,
    Icons.person_rounded,
  ];

  changePage(int index) {
    motionTabBarController.animateTo(index);
    notifyListeners();
  }
}
