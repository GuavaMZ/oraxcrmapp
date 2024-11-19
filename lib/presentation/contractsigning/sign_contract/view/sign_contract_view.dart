import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/domain/model/contracts_model.dart';
import 'package:oraxcrm/presentation/contractsigning/sign_contract/viewmodel/sign_contract_viewmodel.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/resources/widgets_constants.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignContractView extends StatefulWidget {
  const SignContractView({super.key, this.contract});
  final DataContract? contract;

  @override
  State<SignContractView> createState() => _SignContractViewState();
}

class _SignContractViewState extends State<SignContractView> {
  final SignContractViewModel _viewModel = SignContractViewModel();
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
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
                child: Consumer<SignContractViewModel>(
              builder: (BuildContext context, viewModel, Widget? child) =>
                  Column(
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
                  SizedBox(
                    width: displayWidth(context) * 0.8,
                    child: Text(AppStrings.weWillSendYou.getString(context),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.035,
                  ),
                  SizedBox(
                    width: displayWidth(context) * 0.9,
                    height: displayHeight(context) * 0.08,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF5F4F4),
                        hintText:
                            AppStrings.verificationCode.getString(context),
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
                    height: displayHeight(context) * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      WidgetsConstants.showProgressIndicator(context, true, '');
                      await _viewModel.getContractSignCode(
                          widget.contract!.id!, context);
                      if (context.mounted) {
                        context.pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 0.8,
                        padding: EdgeInsets.symmetric(
                            horizontal: displayWidth(context) * 0.035,
                            vertical: displayHeight(context) * 0.01),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              displayHeight(context) * 0.02),
                        )),
                    child: Text(
                        AppStrings.getVerificationCodeOnWhatsapp
                            .getString(context),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_viewModel.whatsappCodeController.text
                          .trim()
                          .isNotEmpty) {
                        await _viewModel.checkContractSignCode(
                            _viewModel.whatsappCodeController.text.trim(),
                            widget.contract!.id!,
                            context);
                      }
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 0.8,
                        padding: EdgeInsets.symmetric(
                            horizontal: displayWidth(context) * 0.08,
                            vertical: displayHeight(context) * 0.01),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              displayHeight(context) * 0.02),
                        )),
                    child: Text(AppStrings.verifyCode.getString(context),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),
                  Visibility(
                    visible: _viewModel.isWhatsappCodeVerified == true,
                    child: Container(
                      height: 200,
                      width: displayWidth(context) * 0.85,
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F4F4),
                          border: Border.all(
                            color: const Color(0xffF5F4F4),
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(
                        children: [
                          SfSignaturePad(
                            key: _signaturePadKey,
                            minimumStrokeWidth: 1,
                            maximumStrokeWidth: 3,
                            strokeColor: Colors.black,
                            backgroundColor: Colors.transparent,
                          ),
                          IconButton(
                              onPressed: () {
                                _signaturePadKey.currentState!.clear();
                              },
                              icon: const Icon(
                                Icons.restore_page_outlined,
                                size: 25,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),
                  Visibility(
                    visible: _viewModel.isWhatsappCodeVerified == true,
                    child: SizedBox(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.07,
                        child: ElevatedButton(
                          onPressed: () async {
                            WidgetsConstants.showProgressIndicator(
                                context, true, '');
                            ui.Image signatureImage =
                                await _signaturePadKey.currentState!.toImage();
                            ByteData? byteData = await signatureImage
                                .toByteData(format: ui.ImageByteFormat.png);
                            String base64Image =
                                base64Encode(byteData!.buffer.asUint8List());
                            print(base64Image);
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: Text(AppStrings.signature.getString(context),
                              style: const TextStyle(
                                  color: ColorsManager.fontColor3)),
                        )),
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
