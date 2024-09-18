import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:oraxcrm/app/app.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: displayHeight(context) * 0.1,),
            Row(
              children: [
                Column(
                 children: [
                  Text(AppStrings.profile.getString(context), style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ) ,),
                  Text('Mahytab Adel')
                 ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
