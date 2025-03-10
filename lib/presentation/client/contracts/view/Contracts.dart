import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';
import 'package:oraxcrm/data/api-request/contracts_requests.dart';
import 'package:oraxcrm/presentation/client/contracts/viewmodel/contracts_viewmodel.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContractsView extends StatefulWidget {
  const ContractsView({super.key});

  @override
  State<ContractsView> createState() => _ContractsViewState();
}

class _ContractsViewState extends State<ContractsView> {
  final ContractsViewModel _viewModel = ContractsViewModel();
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
            child: Consumer<ContractsViewModel>(
              builder: (BuildContext context, viewModel, Widget? child) =>
                  FutureBuilder(
                future: _viewModel.getContracts(context),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      margin:
                          EdgeInsets.only(top: displayHeight(context) * 0.5),
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
                    // print(snapshot.data);
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
                                  child: Builder(builder: (context) {
                                    return IconButton(
                                        onPressed: () {
                                          Scaffold.of(context).openDrawer();
                                        },
                                        icon: SvgPicture.asset(
                                            'assets/images/menu-1 3.svg'));
                                  })),
                              Text(AppStrings.contracts.getString(context),
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
                                                .withValues(alpha: 0.1),
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
                        SizedBox(height: displayHeight(context) * 0.04),
                        Container(
                          // width: displayWidth(context) * 0.95,
                          height: displayHeight(context) * 0.17,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: ColorsManager.defaultShadowColor
                                    .withValues(alpha: 0.1),
                                spreadRadius: 0,
                                offset: const Offset(0, 4),
                                blurRadius: 25)
                          ]),
                          child: ListView.builder(
                            itemCount:
                                _viewModel.contractsTypeAndCounts.keys.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: displayWidth(context) * 0.01),
                                decoration: BoxDecoration(
                                  color: ColorsManager.statisticsContainerColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        displayHeight(context) * 0.05),
                                  ),
                                ),
                                height: displayHeight(context) * 0.17,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                          _viewModel
                                              .contractsTypeAndCounts.values
                                              .elementAt(index)
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: displayHeight(context) *
                                                  0.037,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text(
                                        _viewModel.contractsTypeAndCounts.keys
                                            .elementAt(index)
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.014,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: displayHeight(context) * 0.02),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _viewModel.contractsList?.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: displayHeight(context) * 0.02),
                          primary: false,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            margin: EdgeInsets.only(
                                bottom: displayHeight(context) * 0.01),
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // context.push(Routes.contractDetailsRoute,
                                    //     extra: _viewModel.contractsList![index]);
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
                                        color:
                                            ColorsManager.ticketsContainerColor,
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
                                                    displayHeight(context) *
                                                        0.015,
                                                fontWeight: FontWeight.bold,
                                                color: ColorsManager.fontColor1,
                                              ),
                                            ),
                                            Text(
                                              _viewModel.contractsList![index]
                                                  .typeName
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.015,
                                                overflow: TextOverflow.clip,
                                                color: ColorsManager.fontColor1,
                                              ),
                                            ),
                                            Text(
                                              '${_viewModel.contractsList![index].datestart.toString().split(' ').first} : ${_viewModel.contractsList![index].dateend.toString().split(' ').first}',
                                              style: TextStyle(
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.014,
                                                overflow: TextOverflow.clip,
                                                color: ColorsManager.fontColor2,
                                              ),
                                            ),
                                            Text(
                                                '${AppStrings.mainPoints.getString(context)} : ${_viewModel.contractsList![index].mainpointCount!}',
                                                style: TextStyle(
                                                    fontSize:
                                                        displayHeight(context) *
                                                            0.015,
                                                    color: ColorsManager
                                                        .fontColor1,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Text(
                                                '${AppStrings.subPoints.getString(context)} : ${_viewModel.contractsList![index].subpointsCount!}',
                                                style: TextStyle(
                                                    fontSize:
                                                        displayHeight(context) *
                                                            0.015,
                                                    color: ColorsManager
                                                        .fontColor1,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Text(
                                                '${AppStrings.price.getString(context)} : ${_viewModel.contractsList![index].contractValue!} SAR',
                                                style: TextStyle(
                                                    fontSize:
                                                        displayHeight(context) *
                                                            0.015,
                                                    color: ColorsManager
                                                        .fontColor1,
                                                    fontWeight:
                                                        FontWeight.w700)),
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
                                              vertical: displayHeight(context) *
                                                  0.005),
                                          child: Text(
                                            _viewModel.signedStats[_viewModel
                                                    .contractsList![index]
                                                    .signed]
                                                .toString()
                                                .getString(context),
                                            style: TextStyle(
                                                color: ColorsManager.fontColor3,
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.015),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-0.88, 0),
                                  child: PopupMenuButton(
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        PopupMenuItem(
                                          child: TextButton(
                                              onPressed: () {
                                                context.push(
                                                    Routes.contractTermsRoute,
                                                    extra: _viewModel
                                                        .contractsList![index]);
                                              },
                                              child: Text(
                                                AppStrings.contractTerms
                                                    .getString(context),
                                                style: TextStyle(
                                                    fontSize:
                                                        displayHeight(context) *
                                                            0.015,
                                                    color: ColorsManager
                                                        .fontColor1,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )),
                                        ),
                                        PopupMenuItem(
                                          child: TextButton(
                                              onPressed: () async {
                                                if (_viewModel
                                                        .contractsList![index]
                                                        .signed! ==
                                                    '1') {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(AppStrings
                                                              .contractAlreadySigned
                                                              .getString(
                                                                  context))));
                                                } else {
                                                  context.push(
                                                      Routes.signContractRoute,
                                                      extra: _viewModel
                                                              .contractsList![
                                                          index]);
                                                }
                                              },
                                              child: Text(
                                                AppStrings.signContract
                                                    .getString(context),
                                                style: TextStyle(
                                                    fontSize:
                                                        displayHeight(context) *
                                                            0.015,
                                                    color: ColorsManager
                                                        .fontColor1,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )),
                                        ),
                                        PopupMenuItem(
                                          child: TextButton(
                                              onPressed: () async {
                                                String url =
                                                    '${ApiLinks.baseUrl}/contract/${_viewModel.contractsList![index].id}/${_viewModel.contractsList![index].hash}';
                                                launchUrl(Uri.parse(url));
                                                // await _viewModel
                                                //     .downloadContract(
                                                //         context,
                                                //         _viewModel
                                                //             .contractsList![
                                                //                 index]
                                                //             .id!,
                                                //         _viewModel
                                                //             .contractsList![
                                                //                 index]
                                                //             .hash!);
                                              },
                                              child: Text(
                                                AppStrings.downloadContract
                                                    .getString(context),
                                                style: TextStyle(
                                                    fontSize:
                                                        displayHeight(context) *
                                                            0.015,
                                                    color: ColorsManager
                                                        .fontColor1,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )),
                                        ),
                                      ];
                                    },
                                    // icon: Icon(Icons.menu),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: displayHeight(context) * 0.023,
                                          left: displayWidth(context) * 0.018),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.grey.withValues(alpha: 0.3),
                                        borderRadius: BorderRadius.circular(
                                            displayHeight(context) * 0.08),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              displayWidth(context) * 0.04,
                                          vertical:
                                              displayHeight(context) * 0.005),
                                      child: Text(
                                        AppStrings.more.getString(context),
                                        style: TextStyle(
                                            color: ColorsManager.fontColor1,
                                            fontSize:
                                                displayHeight(context) * 0.015),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
