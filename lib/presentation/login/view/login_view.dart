import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: displayHeight(context) * 0.07,
            ),
            SvgPicture.asset('assets/images/tablet.svg'),
            SizedBox(
              height: displayHeight(context) * 0.04,
            ),
            Text(
              AppStrings.welcomeBack.getString(context),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              AppStrings.loginToYourAccount.getString(context),
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Color(0xffA1A1A1)),
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
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(9.5),
                    margin: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      'assets/images/phone.svg',
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF5F4F4),
                  hintText: AppStrings.phoneNumber.getString(context),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
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
              height: displayHeight(context) * 0.050,
            ),
            SizedBox(
             width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(9.5),
                    margin: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      'assets/images/Lock.svg',
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF5F4F4),
                  hintText: AppStrings.password.getString(context),

                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
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
              height: displayHeight(context) * 0.050,
            ),
            SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.08,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(AppStrings.signIn.getString(context),
                      style: TextStyle(color: ColorsManager.fontColor3)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
