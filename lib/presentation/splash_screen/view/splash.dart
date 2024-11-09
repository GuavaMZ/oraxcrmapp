import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/splash_screen/viewmodel/splash_viewmodel.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final SplashViewModel _viewModel = SplashViewModel();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: _viewModel.splashDuration), () async {
      await _viewModel.checkForUpdates();
      await _viewModel.checkAndroidVersion();
      if (await _viewModel.checkForUsrToken() == true) {
        context.pushReplacement(Routes.mainScreenRoute);
      } else {
        context.pushReplacement(Routes.loginRoute);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgColor,
      resizeToAvoidBottomInset: false,
        
      body: Center(
        child: SizedBox(
            width: displayWidth(context) * 0.85,
            child: Image.asset('assets/images/Logo2.jpg')),
      ),
    );
  }
}
