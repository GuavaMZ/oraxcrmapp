import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/ticketssummary/viewmodel/tickets_summary_viewmodel.dart';
import 'package:provider/provider.dart';

class TicketsSummaryView extends StatefulWidget {
  const TicketsSummaryView({super.key});

  @override
  State<TicketsSummaryView> createState() => _TicketsSummaryViewState();
}

class _TicketsSummaryViewState extends State<TicketsSummaryView> {
  final TicketsSummaryViewModel _viewmodel = TicketsSummaryViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewmodel,
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        resizeToAvoidBottomInset: false,
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
                      Text(AppStrings.ticketsSummary.getString(context),
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
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/images/menu-1 3.svg')))
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.04),
                SizedBox(
                  width: displayWidth(context) * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: displayHeight(context) * 0.17,
                        width: displayWidth(context) * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(displayHeight(context) * 0.05),
                            ),
                            color: ColorsManager.statisticsContainerColor,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.1),
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                  blurRadius: 25)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('25',
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.043,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(AppStrings.inProgress.getString(context),
                                style: TextStyle(
                                    fontSize: displayHeight(context) * 0.016,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Container(
                        height: displayHeight(context) * 0.17,
                        width: displayWidth(context) * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(displayHeight(context) * 0.05),
                            ),
                            color: ColorsManager.statisticsContainerColor,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.1),
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                  blurRadius: 25)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('25',
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.043,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(AppStrings.onHold.getString(context),
                                style: TextStyle(
                                    fontSize: displayHeight(context) * 0.016,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Container(
                        height: displayHeight(context) * 0.17,
                        width: displayWidth(context) * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(displayHeight(context) * 0.05),
                            ),
                            color: ColorsManager.statisticsContainerColor,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorsManager.defaultShadowColor
                                      .withOpacity(0.1),
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                  blurRadius: 25)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('25',
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.043,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(AppStrings.finished.getString(context),
                                style: TextStyle(
                                    fontSize: displayHeight(context) * 0.016,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.04),
                Container(
                  width: displayWidth(context) * 0.95,
                  padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.03,
                      bottom: displayHeight(context) * 0.03,
                      left: displayWidth(context) * 0.07,
                      right: displayWidth(context) * 0.07),
                  decoration: BoxDecoration(
                      color: ColorsManager.ticketsContainerColor,
                      borderRadius:
                          BorderRadius.circular(displayHeight(context) * 0.05),
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
                            'Random Ticket',
                            style: TextStyle(
                              fontSize: displayHeight(context) * 0.017,
                              color: ColorsManager.fontColor1,
                            ),
                          ),
                          Text(
                            'OraxLite',
                            style: TextStyle(
                              fontSize: displayHeight(context) * 0.017,
                              color: ColorsManager.fontColor1,
                            ),
                          ),
                          Text(
                            'Low',
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
                          borderRadius: BorderRadius.circular(displayHeight(context)*0.08),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06,vertical: displayHeight(context) * 0.005),
                        child: Text('Closed',style: TextStyle(
                          color: ColorsManager.fontColor3,
                          fontSize: displayHeight(context) * 0.018
                        ),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
