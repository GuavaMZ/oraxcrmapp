import 'package:flutter/material.dart';
import 'package:oraxcrm/presentation/personalinfo/viewmodel/personal_info_viewmodel.dart';
import 'package:provider/provider.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final PersonalInfoViewModel _viewModel = PersonalInfoViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
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
                              icon: const Icon(Icons.arrow_back))),
                      Text(AppStrings.personalInfo.getString(context),
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
                    hintText: AppStrings.firstName.getString(context),
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
                    hintText: AppStrings.lastName.getString(context),
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
                    hintText: AppStrings.emailaddress.getString(context),
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
                    hintText: AppStrings.phoneNumber.getString(context),
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
                    hintText: AppStrings.position.getString(context),
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
                    hintText: AppStrings.direction.getString(context),
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
