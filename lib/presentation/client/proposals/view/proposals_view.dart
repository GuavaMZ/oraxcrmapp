import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/client/proposals/viewmodel/proposals_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class ProposalsView extends StatefulWidget {
  const ProposalsView({super.key});

  @override
  State<ProposalsView> createState() => _ProposalsViewState();
}

class _ProposalsViewState extends State<ProposalsView> {
  final ProposalsViewModel _viewModel = ProposalsViewModel();
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
              child: Consumer<ProposalsViewModel>(
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
                                        AppStrings.proposals.getString(context),
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
                              SizedBox(height: displayHeight(context) * 0.02),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _viewModel.proposalsList?.length,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          displayHeight(context) * 0.02),
                                  primary: false,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        margin: EdgeInsets.only(
                                            bottom:
                                                displayHeight(context) * 0.02),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              // context.push(
                                              //     Routes.projectDetailsRoute,
                                              //     extra: _viewModel
                                              //         .projectsList![index]);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          displayHeight(
                                                                  context) *
                                                              0.05),
                                                ),
                                                elevation: 0,
                                                padding:
                                                    const EdgeInsets.all(0)),
                                            child: Container(
                                                width: displayWidth(context) *
                                                    0.95,
                                                padding: EdgeInsets.only(
                                                    top: displayHeight(context) *
                                                        0.03,
                                                    bottom:
                                                        displayHeight(context) *
                                                            0.03,
                                                    left: displayWidth(context) *
                                                        0.07,
                                                    right:
                                                        displayWidth(context) *
                                                            0.04),
                                                decoration: BoxDecoration(
                                                    color: ColorsManager
                                                        .projectsContainerColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            displayHeight(context) *
                                                                0.05),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: ColorsManager
                                                              .defaultShadowColor
                                                              .withOpacity(0.1),
                                                          spreadRadius: 0,
                                                          offset: const Offset(
                                                              0, 4),
                                                          blurRadius: 25)
                                                    ]),
                                                child: null)));
                                  })
                            ]);
                          }
                        }),
              ),
            ),
          ),
        ));
  }
}
