import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/domain/model/contracts_model.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/contract_details/contract_terms/viewmodel/contract_terms_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class ContractTermsView extends StatefulWidget {
  const ContractTermsView({super.key, this.contract});
  final DataContract? contract;
  @override
  State<ContractTermsView> createState() => _ContractTermsViewState();
}

class _ContractTermsViewState extends State<ContractTermsView> {
  final ContractTermsViewModel _viewModel = ContractTermsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgColor,
      resizeToAvoidBottomInset: false,
      drawer: const DrawerView(),
      body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
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
              Text(AppStrings.contractTerms.getString(context),
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
                      icon: SvgPicture.asset('assets/images/menu-1 3.svg'))),
            ],
          ),
        ),
        SizedBox(
          height: displayHeight(context) * 0.05,
        ),
        FutureBuilder(
          future: _viewModel.getContractTerms(
              widget.contract!.id!, widget.contract!.hash!, context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.3),
                // height: displayHeight(context) * 0.17,
                alignment: Alignment.center,
                width: displayWidth(context) * 0.2,
                child: LoadingAnimationWidget.discreteCircle(
                    color: ColorsManager.discreteCircleFirstColor,
                    secondRingColor: ColorsManager.discreteCircleSecondColor,
                    thirdRingColor: ColorsManager.discreteCircleThirdColor,
                    size: displayWidth(context) * 0.1),
              );
            } else {
              print(snapshot.data['data']);
              return HtmlWidget(
                snapshot.data['data'][0]['content'],
                customWidgetBuilder: (element) {
                  if (element.localName == 'p' && element.text != '') {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: displayHeight(context) * 0.02,
                        horizontal: displayWidth(context) * 0.06,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.ticketsContainerColor,
                        borderRadius: BorderRadius.circular(
                            displayHeight(context) * 0.05),
                        /*boxShadow: [
                            BoxShadow(
                                color: ColorsManager.defaultShadowColor
                                    .withOpacity(0.1),
                                spreadRadius: 0,
                                offset: const Offset(0, 4),
                                blurRadius: 25)
                          ]*/
                      ),
                      child: Text(element.text),
                    );
                  }
                },
                textStyle: TextStyle(
                  fontFamily: 'Lama-Sans',
                ),
              );
            }
          },
        )
      ]))),
    );
  }
}
