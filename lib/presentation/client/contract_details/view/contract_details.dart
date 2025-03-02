import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:oraxcrm/domain/model/contracts_model.dart';
import 'package:oraxcrm/presentation/client/contract_details/viewmodel/contract_details_viewmodel.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class ContractDetailsView extends StatefulWidget {
  const ContractDetailsView({super.key, this.contract});
  final DataContract? contract;
  @override
  State<ContractDetailsView> createState() => _ContractDetailsViewState();
}

class _ContractDetailsViewState extends State<ContractDetailsView> {
  final ContractDetailsViewModel _viewModel = ContractDetailsViewModel();
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
              child: Column(
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
                                      color: ColorsManager.defaultShadowColor
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
                        Text(AppStrings.ticketDetails.getString(context),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Container(
                            decoration: BoxDecoration(
                                color: ColorsManager.iconsColor3,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorsManager.defaultShadowColor
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
                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: displayWidth(context) * 0.05,
                      ),
                      IconButton(
                          onPressed: () {
                            context.push(Routes.contractTermsRoute,
                                extra: widget.contract);
                          },
                          tooltip: AppStrings.contractTerms.getString(context),
                          icon: Icon(
                            Icons.notes_rounded,
                            size: displayWidth(context) * 0.08,
                          )),
                      SizedBox(
                        width: displayWidth(context) * 0.05,
                      ),
                      // IconButton(
                      //     onPressed: () async {
                      //       // launchUrl(Uri.parse(
                      //       //     "${ApiLinks.baseUrl}${ApiLinks.getContracts}/${widget.contract!.id}/${widget.contract!.hash!}"));
                      //       await _viewModel.downloadContract(
                      //           widget.contract!.id!,
                      //           widget.contract!.hash!,
                      //           context);
                      //     },
                      //     tooltip:
                      //         AppStrings.downloadContract.getString(context),
                      //     icon: Icon(
                      //       Icons.file_download_rounded,
                      //       size: displayWidth(context) * 0.08,
                      //     )),
                      // SizedBox(
                      //   width: displayWidth(context) * 0.05,
                      // ),
                      IconButton(
                          onPressed: () async {
                            if (widget.contract!.signed! == '1') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(AppStrings
                                          .contractAlreadySigned
                                          .getString(context))));
                            } else {
                              context.push(Routes.signContractRoute,
                                  extra: widget.contract);
                            }
                          },
                          tooltip: AppStrings.signContract.getString(context),
                          icon: Icon(
                            Icons.file_download_done_rounded,
                            size: displayWidth(context) * 0.08,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.04,
                  ),
                  Container(
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
                                color: ColorsManager.defaultShadowColor
                                    .withValues(alpha: 0.1),
                                spreadRadius: 0,
                                offset: const Offset(0, 4),
                                blurRadius: 25)
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppStrings.mainPoints.getString(context),
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                              Text(widget.contract!.mainpointCount!,
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppStrings.subPoints.getString(context),
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                              Text(widget.contract!.subpointsCount!,
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppStrings.subject.getString(context),
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                              Text(widget.contract!.subject!,
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppStrings.contractStatus.getString(context),
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                              Text(
                                  _viewModel
                                      .signedStats[widget.contract!.signed!]
                                      .toString()
                                      .getString(context),
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppStrings.price.getString(context),
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                              Text(widget.contract!.contractValue!,
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.015,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
