import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/presentation/client/login/viewmodel/login_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/resources/widgets_constants.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _viewModel.emailController.dispose();
    _viewModel.passwordController.dispose();
    _viewModel.phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: displayHeight(context) * 0.1,
          actions: [
            SizedBox(
              width: displayWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.announcement_rounded),
                        Text(AppStrings.advertises.getString(context))
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(Routes.knowledgeBaseRoute);
                    },
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.developer_board_rounded),
                        Text(AppStrings.tutorials.getString(context))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: displayHeight(context) * 0.01,
              ),
              SvgPicture.asset('assets/images/tablet.svg'),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              Text(
                AppStrings.welcomeBack.getString(context),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                AppStrings.loginToYourAccount.getString(context),
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffA1A1A1)),
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.08,
                        child: TextField(
                          controller: _viewModel.emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(9.5),
                              margin: const EdgeInsets.only(left: 8.0),
                              child: SvgPicture.asset(
                                'assets/images/phone.svg',
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F4F4),
                            hintText:
                                AppStrings.emailAddress.getString(context),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffffffff)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffffffff)),
                            ),
                            // border: const OutlineInputBorder(
                            //   borderRadius: BorderRadius.all(Radius.circular(30)),
                            //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                            // ),
                          ),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.050,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.08,
                        child: TextField(
                          controller: _viewModel.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(9.5),
                              margin: const EdgeInsets.only(left: 8.0),
                              child: SvgPicture.asset(
                                'assets/images/Lock.svg',
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F4F4),
                            hintText: AppStrings.password.getString(context),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffffffff)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffffffff)),
                            ),
                            // border: const OutlineInputBorder(
                            //   borderRadius: BorderRadius.all(Radius.circular(30)),
                            //   borderSide: BorderSide(width: 0, color: Color(0xffffffff)),
                            // ),
                          ),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.050,
                      ),
                      SizedBox(
                          width: displayWidth(context) * 0.9,
                          height: displayHeight(context) * 0.08,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                WidgetsConstants.showProgressIndicator(
                                    context, true, '');
                                try {
                                  await _viewModel.login(context);

                                  if (context.mounted) {
                                    context.pop();
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              foregroundColor: const Color(0xffffffff),
                            ),
                            child: Text(AppStrings.signIn.getString(context),
                                style: const TextStyle(
                                    color: ColorsManager.fontColor3)),
                          ))
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
