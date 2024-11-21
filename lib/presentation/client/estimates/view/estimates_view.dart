import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/client/estimates/viewmodel/estimates_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class EstimatesView extends StatefulWidget {
  const EstimatesView({super.key});

  @override
  State<EstimatesView> createState() => _EstimatesViewState();
}

class _EstimatesViewState extends State<EstimatesView> {
  final EstimatesViewModel _viewModel = EstimatesViewModel();
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
              child: Consumer<EstimatesViewModel>(
                builder: (BuildContext context, value, Widget? child) =>
                    FutureBuilder(
                        future: null,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              margin: EdgeInsets.only(
                                  top: displayHeight(context) * 0.5),
                              // height: displayHeight(context) * 0.17,
                              alignment: Alignment.center,
                              width: displayWidth(context) * 0.2,
                              child: LoadingAnimationWidget.discreteCircle(
                                  color: ColorsManager.discreteCircleFirstColor,
                                  secondRingColor:
                                      ColorsManager.discreteCircleSecondColor,
                                  thirdRingColor:
                                      ColorsManager.discreteCircleThirdColor,
                                  size: displayWidth(context) * 0.1),
                            );
                          } else {
                            return Column(children: [
                              SizedBox(
                                height: displayHeight(context) * 0.06,
                              ),
                              SizedBox(
                                width: displayWidth(context) * 0.9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ColorsManager.iconsColor3,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ColorsManager
                                                      .defaultShadowColor
                                                      .withOpacity(0.1),
                                                  spreadRadius: 0,
                                                  offset: const Offset(0, 4),
                                                  blurRadius: 25)
                                            ]),
                                        child: Builder(builder: (context) {
                                          return IconButton(
                                              onPressed: () {
                                                Scaffold.of(context)
                                                    .openDrawer();
                                              },
                                              icon: SvgPicture.asset(
                                                  'assets/images/menu-1 3.svg'));
                                        })),
                                    Text(
                                        AppStrings.ticketDetails
                                            .getString(context),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ColorsManager.iconsColor3,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ColorsManager
                                                      .defaultShadowColor
                                                      .withOpacity(0.1),
                                                  spreadRadius: 0,
                                                  offset: const Offset(0, 4),
                                                  blurRadius: 25)
                                            ]),
                                        child: IconButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            icon: SvgPicture.asset(
                                                'assets/images/arrow-left 2.svg'))),
                                  ],
                                ),
                              ),
                            ]);
                          }
                        }),
              ),
            ),
          ),
        ));
  }
}
