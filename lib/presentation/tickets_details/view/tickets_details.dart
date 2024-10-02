import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/domain/model/support_tickets_model.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/tickets_details/viewmodel/tickets_details_viewmodel.dart';
import 'package:provider/provider.dart';

class TicketsDetailsView extends StatefulWidget {
  const TicketsDetailsView({super.key, this.ticketDetails});
  final Dataticket? ticketDetails;
  @override
  State<TicketsDetailsView> createState() => _TicketsDetailsViewState();
}

class _TicketsDetailsViewState extends State<TicketsDetailsView> {
  final TicketsDetailsViewModel _viewModel = TicketsDetailsViewModel();
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
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/images/notification 2.svg'))),
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
                SizedBox(height: displayHeight(context) * 0.05),
                FutureBuilder(
                  future: _viewModel.getTicketDetails(
                      context, widget.ticketDetails!.ticketid!),
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
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: displayHeight(context) * 0.02),
                        child: Container(
                          width: displayWidth(context) * 0.95,
                          padding: EdgeInsets.only(
                              top: displayHeight(context) * 0.03,
                              bottom: displayHeight(context) * 0.03,
                              left: displayWidth(context) * 0.07,
                              right: displayWidth(context) * 0.04),
                          decoration: BoxDecoration(
                              color: ColorsManager.projectsContainerColor,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.ticketDetails!.subject.toString(),
                                    style: TextStyle(
                                      fontSize: displayHeight(context) * 0.017,
                                      color: ColorsManager.fontColor1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${widget.ticketDetails!}',
                                    style: TextStyle(
                                      fontSize: displayHeight(context) * 0.017,
                                      color: ColorsManager.fontColor2,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsManager.iconsColor1,
                                  borderRadius: BorderRadius.circular(
                                      displayHeight(context) * 0.08),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: displayWidth(context) * 0.04,
                                    vertical: displayHeight(context) * 0.005),
                                child: Text(
                                  _viewModel.projectTicketsStats[
                                          widget.ticketDetails!.status]
                                      .toString()
                                      .getString(context),
                                  style: TextStyle(
                                      color: ColorsManager.fontColor3,
                                      fontSize: displayHeight(context) * 0.015),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
