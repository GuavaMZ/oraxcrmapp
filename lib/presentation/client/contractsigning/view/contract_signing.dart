import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/presentation/client/contractsigning/viewmodel/contract_signing_viewmodel.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class ContractSigningView extends StatefulWidget {
  const ContractSigningView({super.key});

  @override
  State<ContractSigningView> createState() => _ContractSigningViewState();
}

class _ContractSigningViewState extends State<ContractSigningView> {
  final ContractSigningViewmodel _viewModel = ContractSigningViewmodel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        // resizeToAvoidBottomInset: false,
        drawer: const DrawerView(),
        body: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
              future: _viewModel.getContracts(context),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.5),
                    // height: displayHeight(context) * 0.17,
                    alignment: Alignment.center,
                    width: displayWidth(context) * 0.2,
                    child: LoadingAnimationWidget.discreteCircle(
                        color: ColorsManager.discreteCircleFirstColor,
                        secondRingColor:
                            ColorsManager.discreteCircleSecondColor,
                        thirdRingColor: ColorsManager.discreteCircleThirdColor,
                        size: displayWidth(context) * 0.1),
                  );
                } else {
                  return Column(
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
                                          color: ColorsManager
                                              .defaultShadowColor
                                              .withValues(alpha: 0.1),
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                          blurRadius: 25)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    icon: const Icon(Icons.arrow_back))),
                            Text(AppStrings.contracts.getString(context),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Container(
                                decoration: BoxDecoration(
                                    color: ColorsManager.iconsColor3,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: ColorsManager
                                              .defaultShadowColor
                                              .withValues(alpha: 0.1),
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                          blurRadius: 25)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/images/menu-1 3.svg')))
                          ],
                        ),
                      ),
                      SizedBox(height: displayHeight(context) * 0.04),
                      if (_viewModel.contractsList!.isEmpty)
                        Center(
                          child: Text(
                            AppStrings.noContractsToSign.getString(context),
                            style: const TextStyle(
                                fontSize: 18,
                                color: ColorsManager.fontColor1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      if (_viewModel.contractsList!.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _viewModel.contractsList?.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: displayHeight(context) * 0.01),
                          primary: false,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            margin: EdgeInsets.only(
                                bottom: displayHeight(context) * 0.02),
                            child: ElevatedButton(
                              onPressed: () {
                                context.push(Routes.signContractRoute,
                                    extra: _viewModel.contractsList?[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        displayHeight(context) * 0.05),
                                  ),
                                  elevation: 0,
                                  padding: const EdgeInsets.all(0)),
                              child: Container(
                                width: displayWidth(context) * 0.95,
                                // margin: EdgeInsets.only(bottom: displayHeight(context) * 0.01),
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.03,
                                    bottom: displayHeight(context) * 0.03,
                                    left: displayWidth(context) * 0.06,
                                    right: displayWidth(context) * 0.06),
                                decoration: BoxDecoration(
                                    color: ColorsManager.ticketsContainerColor,
                                    borderRadius: BorderRadius.circular(
                                        displayHeight(context) * 0.05),
                                    boxShadow: [
                                      BoxShadow(
                                          color: ColorsManager
                                              .defaultShadowColor
                                              .withValues(alpha: 0.1),
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                          blurRadius: 25)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _viewModel
                                              .contractsList![index].subject
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            fontWeight: FontWeight.bold,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                        Text(
                                          _viewModel
                                              .contractsList![index].typeName
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            overflow: TextOverflow.clip,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                        // Text(
                                        //   _viewModel.contractsList![index].priorityName.toString().getString(context),
                                        //   style: TextStyle(
                                        //     fontSize:
                                        //         displayHeight(context) * 0.017,
                                        //     color: ColorsManager.fontColor2,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorsManager.iconsColor1,
                                        borderRadius: BorderRadius.circular(
                                            displayHeight(context) * 0.08),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              displayWidth(context) * 0.04,
                                          vertical:
                                              displayHeight(context) * 0.005),
                                      child: Text(
                                        _viewModel.signedStats[_viewModel
                                                .contractsList![index].signed]
                                            .toString()
                                            .getString(context),
                                        style: TextStyle(
                                            color: ColorsManager.fontColor3,
                                            fontSize:
                                                displayHeight(context) * 0.018),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
