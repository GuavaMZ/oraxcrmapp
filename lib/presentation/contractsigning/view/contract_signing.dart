import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/presentation/contractsigning/viewmodel/contract_signing_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/resources/widgets_constants.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

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
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back))),
                      Text(AppStrings.contractSigning.getString(context),
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
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/images/menu-1 3.svg'))),
                    ],
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                Text(AppStrings.weWillSendYou.getString(context),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.9,
                  height: displayHeight(context) * 0.08,
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF5F4F4),
                      hintText: AppStrings.verificationCode.getString(context),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide:
                            BorderSide(width: 0, color: Color(0xffffffff)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide:
                            BorderSide(width: 0, color: Color(0xffffffff)),
                      ),
                    ),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                Container(
                  height: 200,
                  width: displayWidth(context) * 0.85,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F4F4),
                    
                    border: Border.all(
                      color :const Color(0xffF5F4F4),
                    
                    ),
                    borderRadius:BorderRadius.circular(50)
                    
                  ),
                  child: const SfSignaturePad(
                    minimumStrokeWidth: 1,
                    maximumStrokeWidth: 3,
                    strokeColor: Color.fromARGB(255, 255, 0, 0),
                    backgroundColor: Colors.transparent,
                  ),
                  
                ),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                SizedBox(
                    width: displayWidth(context) * 0.9,
                    height: displayHeight(context) * 0.08,
                    child: ElevatedButton(
                      onPressed: () async {
                        WidgetsConstants.showProgressIndicator(
                            context, true, '');
                        //TODO:ADD BACK END
                        if (context.mounted) {
                          context.pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Text(AppStrings.signature.getString(context),
                          style:
                              const TextStyle(color: ColorsManager.fontColor3)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
