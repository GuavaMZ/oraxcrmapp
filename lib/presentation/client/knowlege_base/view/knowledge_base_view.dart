import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/client/knowlege_base/viewmodel/knowledge_base_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class KnowledgeBaseView extends StatefulWidget {
  const KnowledgeBaseView({super.key});

  @override
  State<KnowledgeBaseView> createState() => _KnowledgeBaseViewState();
}

class _KnowledgeBaseViewState extends State<KnowledgeBaseView> {
  final KnowledgeBaseViewModel _viewModel = KnowledgeBaseViewModel();
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
                    child: Column(children: [
              SizedBox(
                height: displayHeight(context) * 0.06,
              ),
              SizedBox(
                width: displayWidth(context) * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //     decoration: BoxDecoration(
                    //         color: ColorsManager.iconsColor3,
                    //         shape: BoxShape.circle,
                    //         boxShadow: [
                    //           BoxShadow(
                    //               color: ColorsManager.defaultShadowColor
                    //                   .withOpacity(0.1),
                    //               spreadRadius: 0,
                    //               offset: const Offset(0, 4),
                    //               blurRadius: 25)
                    //         ]),
                    //     child: IconButton(
                    //         onPressed: () {},
                    //         icon: const Icon(Icons.arrow_back))),
                    Text(AppStrings.knowledgeBase.getString(context),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
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
              FutureBuilder(
                future: _viewModel.getArticlesGroups(context),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      margin:
                          EdgeInsets.only(top: displayHeight(context) * 0.25),
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
                    if (_viewModel.articlesGroups!.isEmpty) {
                      return Center(
                        child: Text(
                          AppStrings.noArticles.getString(context),
                          style: const TextStyle(
                              fontSize: 18,
                              color: ColorsManager.fontColor1,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: _viewModel.articlesGroups!.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: displayHeight(context) * 0.02),
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(
                                bottom: displayHeight(context) * 0.01),
                            child: ElevatedButton(
                                onPressed: () {
                                  context.push(Routes.articlesRoute,
                                      extra: _viewModel.articlesGroups![index]);
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
                                                  .withOpacity(0.1),
                                              spreadRadius: 0,
                                              offset: const Offset(0, 4),
                                              blurRadius: 25)
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _viewModel.articlesGroups![index].name
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            fontWeight: FontWeight.bold,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              displayHeight(context) * 0.008,
                                        ),
                                        Text(
                                          _viewModel.articlesGroups![index]
                                              .description
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            overflow: TextOverflow.clip,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                      ],
                                    ))),
                          );
                        },
                      );
                    }
                  }
                },
              )
            ])))));
  }
}
