import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';
import 'package:oraxcrm/domain/model/contracts_model.dart';
import 'package:oraxcrm/presentation/contract_details/viewmodel/contract_details_viewmodel.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                                          .withOpacity(0.1),
                                      spreadRadius: 0,
                                      offset: const Offset(0, 4),
                                      blurRadius: 25)
                                ]),
                            child: IconButton(
                                onPressed: () {
                                  context.pop();
                                },
                                icon: const Icon(Icons.arrow_back))),
                        Text(AppStrings.contractDetails.getString(context),
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                        Container(
                            decoration: BoxDecoration(
                                color: ColorsManager.iconsColor3,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorsManager.defaultShadowColor
                                          .withOpacity(0.1),
                                      spreadRadius: 0,
                                      offset: const Offset(0, 4),
                                      blurRadius: 25)
                                ]),
                            child: IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: SvgPicture.asset(
                                    'assets/images/menu-1 3.svg'))),
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
                      IconButton(
                          onPressed: () async {
                            // launchUrl(Uri.parse(
                            //     "${ApiLinks.baseUrl}${ApiLinks.getContracts}/${widget.contract!.id}/${widget.contract!.hash!}"));
                            await _viewModel.downloadContract(
                                widget.contract!.id!,
                                widget.contract!.hash!,
                                context);
                          },
                          tooltip:
                              AppStrings.downloadContract.getString(context),
                          icon: Icon(
                            Icons.file_download_rounded,
                            size: displayWidth(context) * 0.08,
                          )),
                      SizedBox(
                        width: displayWidth(context) * 0.05,
                      ),
                      IconButton(
                          onPressed: () {},
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
                                    .withOpacity(0.1),
                                spreadRadius: 0,
                                offset: const Offset(0, 4),
                                blurRadius: 25)
                          ]),
                      child: Column())
                ],
              ),
            ),
          ),
        ));
  }
}
