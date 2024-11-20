import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/client/notifications/viewmodel/notifications_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final NotificationsViewModel _viewModel = NotificationsViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        resizeToAvoidBottomInset: false,
        drawer: const DrawerView(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: displayHeight(context) * 0.06,
              ),
              SizedBox(
                width: displayWidth(context) * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //     decoration: BoxDecoration(
                    //         color: ColorsManager.iconsColor3,
                    //         shape: BoxShape.circle,
                    //         boxShadow: [
                    //           BoxShadow(
                    //               color: ColorsManager.defaultShadowColor
                    //                   .withOpacity(0.1),
                    //               spreadRadius: 0,
                    //               offset: const Offset(0, 4),
                    //               blurRadius: 25)
                    //         ]),
                    //     child: IconButton(
                    //         onPressed: () {},
                    //         icon: const Icon(Icons.arrow_back))),
                    Text(AppStrings.notifications.getString(context),
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
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: SvgPicture.asset(
                                'assets/images/menu-1 3.svg'))),
                  ],
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Container(
                  width: displayWidth(context) * 0.95,
                  padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.03,
                      bottom: displayHeight(context) * 0.03,
                      left: displayWidth(context) * 0.07,
                      right: displayWidth(context) * 0.07),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius:
                          BorderRadius.circular(displayHeight(context) * 0.05),
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.1),
                            spreadRadius: 0,
                            offset: const Offset(0, 4),
                            blurRadius: 25)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New ticket has been created.',
                            style: TextStyle(
                              fontSize: displayHeight(context) * 0.020,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.01,
                          ),
                          SizedBox(
                            width: displayWidth(context) * 0.81,
                            child: Text(
                              'A new ticket has been created and will be reviewed for you and responded to as soon as possible.',
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: displayHeight(context) * 0.015,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              Container(
                  width: displayWidth(context) * 0.95,
                  padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.03,
                      bottom: displayHeight(context) * 0.03,
                      left: displayWidth(context) * 0.07,
                      right: displayWidth(context) * 0.07),
                  decoration: BoxDecoration(
                      color: ColorsManager.projectsContainerColor,
                      borderRadius:
                          BorderRadius.circular(displayHeight(context) * 0.05),
                      boxShadow: [
                        BoxShadow(
                            color: ColorsManager.defaultShadowColor
                                .withOpacity(0.1),
                            spreadRadius: 0,
                            offset: const Offset(0, 4),
                            blurRadius: 25)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New ticket has been created.',
                            style: TextStyle(
                              fontSize: displayHeight(context) * 0.020,
                              color: ColorsManager.fontColor1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.01,
                          ),
                          SizedBox(
                            width: displayWidth(context) * 0.81,
                            child: Text(
                              'A new ticket has been created and will be reviewed for you and responded to as soon as possible.',
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: displayHeight(context) * 0.015,
                                color: ColorsManager.fontColor1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
