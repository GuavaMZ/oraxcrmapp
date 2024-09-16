import 'package:flutter/material.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.bgColor,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Container()),
                Text('Change Password'),
                IconButton(onPressed: () {}, icon: Container())
              ],
            ),
            Text('Old Password'),
            TextField(),
            Text('New Password'),
            TextField(),
            Text('Confirm Password'),
            TextField(),
            ElevatedButton(onPressed: () {}, child: Text('Change Password'))
          ],
        ));
  }
}
