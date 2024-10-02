import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';

class WidgetsConstants {
  static showProgressIndicator(
      BuildContext context, bool isLoading, String? text) {
    if (isLoading) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.17,
                    width: displayWidth(context) * 0.15,
                    child: LoadingAnimationWidget.discreteCircle(
                        color: ColorsManager.discreteCircleFirstColor,
                        secondRingColor: ColorsManager.discreteCircleSecondColor,
                        thirdRingColor: ColorsManager.discreteCircleThirdColor,
                        size: displayWidth(context) * 0.1),
                  ),
                  Text(
                    text!,
                    style: const TextStyle(
                      fontSize: 20,
                      color: ColorsManager.fontColor3,
                      fontWeight: FontWeight.w800,
                    ),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              contentPadding: const EdgeInsets.all(8),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            );
          });
    } else {
      return const SizedBox();
    }
  }
}
