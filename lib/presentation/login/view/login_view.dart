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
              height: displayHeight(context) * 0.07,
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
              height: displayHeight(context) * 0.07,
            ),
            SizedBox(
              width: 320,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF5F4F4),
                  labelText: AppStrings.phoneNumber.getString(context),
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
              height: displayHeight(context) * 0.07,
            ),
            SizedBox(
              width: 320,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF5F4F4),
                  labelText: AppStrings.password.getString(context),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.normal),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
