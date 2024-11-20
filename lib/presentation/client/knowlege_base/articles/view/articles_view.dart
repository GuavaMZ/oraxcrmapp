import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';
import 'package:oraxcrm/domain/model/knowledge_base_model.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key, this.articlesModel});
  final ArticlesModel? articlesModel;
  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back))),
                    Text(AppStrings.articles.getString(context),
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
              ListView.builder(
                  itemCount: widget.articlesModel!.articles!.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: displayHeight(context) * 0.02),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.articlesModel!.articles![index].subject
                                  .toString(),
                              style: TextStyle(
                                fontSize: displayHeight(context) * 0.019,
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.fontColor1,
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.015,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: ExtendedImage.network(
                                ApiLinks.baseUrl +
                                    widget.articlesModel!.articles![index]
                                        .fileName!,
                                borderRadius: BorderRadius.circular(
                                    displayHeight(context) * 0.05),
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.015,
                            ),
                            HtmlWidget(
                              widget
                                  .articlesModel!.articles![index].description!,
                              textStyle: TextStyle(
                                  fontSize: displayHeight(context) * 0.015,
                                  overflow: TextOverflow.clip,
                                  color: ColorsManager.fontColor1,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
