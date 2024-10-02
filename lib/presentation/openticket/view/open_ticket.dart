import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/openticket/viewmodel/open_ticket_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class OpenTicketView extends StatefulWidget {
  const OpenTicketView({super.key});

  @override
  State<OpenTicketView> createState() => _OpenTicketViewState();
}

class _OpenTicketViewState extends State<OpenTicketView> {
  final OpenTicketViewmodel _viewModel = OpenTicketViewmodel();
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
                      Text(AppStrings.openTicket.getString(context),
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
                height: displayHeight(context) * 0.05,
              ),
                SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF5F4F4),
                    hintText: AppStrings.subject.getString(context),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    // border: const OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                    // ),
                  ),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF5F4F4),
                    hintText: AppStrings.client.getString(context),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    // border: const OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                    // ),
                  ),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF5F4F4),
                    hintText: AppStrings.department.getString(context),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    // border: const OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                    // ),
                  ),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF5F4F4),
                    hintText: AppStrings.follower.getString(context),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    // border: const OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                    // ),
                  ),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF5F4F4),
                    hintText: AppStrings.priority.getString(context),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    // border: const OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                    // ),
                  ),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF5F4F4),
                    hintText: AppStrings.project.getString(context),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    // border: const OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                    // ),
                  ),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF5F4F4),
                    hintText: AppStrings.ticketText.getString(context),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffffffff)),
                    ),
                    // border: const OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                    // ),
                  ),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              ]
            ),
        )
      )
    ));
  }
}