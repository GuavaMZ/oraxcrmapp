import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraxcrm/app/app.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/homescreen/viewmodel/home_screen_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:provider/provider.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final HomeScreenViewmodel _viewModel = HomeScreenViewmodel();

  String? selectedFilter;
  int currentIndex = 0;

  @override
  void initState() {
    _viewModel.currentCategoryFilterFuture = _viewModel.getCategories();
    Future.wait([_viewModel.getUserInfo(context)]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _viewModel,
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
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/images/notification 2.svg'))),
                        Text(AppStrings.home.getString(context),
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
                            child: Builder(builder: (context) {
                              return IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/images/menu-1 3.svg'));
                            }))
                      ],
                    ),
                  ),
                  SizedBox(height: displayHeight(context) * 0.02),
                  FutureBuilder(
                      future: _viewModel.getAds(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CarouselSlider(
                              items: [
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(
                                        displayHeight(context) * 0.05),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(
                                        displayHeight(context) * 0.05),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(
                                        displayHeight(context) * 0.05),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                autoPlay: false,
                                enlargeCenterPage: true,
                              ));
                        } else {
                          return CarouselSlider.builder(
                            itemCount: snapshot.data.data.length,
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                            ),
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    bottom: displayHeight(context) * 0.025),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(int.parse(snapshot
                                              .data.data[index].shadowColor))
                                          .withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      displayHeight(context) * 0.05),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      displayHeight(context) * 0.05),
                                  child: Image.network(
                                    snapshot.data.data[index].adsImage,
                                    fit: BoxFit.cover,
                                    width: displayWidth(context),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
                  // SizedBox(height: displayHeight(context) * 0.035),
                  SizedBox(
                    height: 45,
                    width: displayWidth(context) * 0.95,
                    child: FutureBuilder(
                      future: _viewModel.getCategories(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox();
                        } else {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ChoiceChip(
                                  label: Text(
                                      localization.currentLocale.toString() ==
                                              'ar'
                                          ? snapshot
                                              .data.data[index].categoryNameAr
                                          : snapshot
                                              .data.data[index].categoryNameEn,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: selectedFilter ==
                                                snapshot.data.data[index]
                                                    .categoryNameEn
                                            ? const Color(0xffffffff)
                                            : const Color(0xff000000),
                                      )),
                                  showCheckmark: false,
                                  labelPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          displayWidth(context) * 0.045),
                                  onSelected: (b) {},
                                  side: const BorderSide(
                                      width: 0, color: Color(0xffffffff)),
                                  selectedColor: const Color(0xff000000),
                                  backgroundColor: const Color(0xfff1f1f1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            displayHeight(context) * 0.02)),
                                  ),
                                  selected: selectedFilter ==
                                      snapshot.data.data[index].categoryNameEn);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: displayWidth(context) * 0.035,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  FutureBuilder(
                    future: _viewModel.currentCategoryFilterFuture,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox();
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                displayHeight(context) * 0.025),
                          ),
                          color: const Color(0xffffffff),
                          
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
