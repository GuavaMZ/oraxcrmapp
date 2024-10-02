import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:oraxcrm/domain/model/project_tickets_model.dart';
import 'package:oraxcrm/presentation/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/tickets/viewmodel/tickets_viewmodel.dart';
import 'package:provider/provider.dart';

class TicketsView extends StatefulWidget {
  const TicketsView({super.key, this.projectTicketsModel});
  final ProjectTicketsModel? projectTicketsModel;
  @override
  State<TicketsView> createState() => _TicketsViewState();
}

class _TicketsViewState extends State<TicketsView> {
  final TicketsViewModel _viewModel = TicketsViewModel();

  @override
  void initState() {
    _viewModel.assignTicketsStatusesCounts(widget.projectTicketsModel!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        drawer: const DrawerView(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                Container(
                  // width: displayWidth(context) * 0.95,
                  height: displayHeight(context) * 0.17,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color:
                            ColorsManager.defaultShadowColor.withOpacity(0.1),
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                        blurRadius: 25)
                  ]),
                  child: ListView.builder(
                    itemCount: _viewModel.ticketsStatuses.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: displayWidth(context) * 0.01),
                        decoration: BoxDecoration(
                          color: ColorsManager.statisticsContainerColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(displayHeight(context) * 0.05),
                          ),
                        ),
                        height: displayHeight(context) * 0.17,
                        width: displayWidth(context) * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  _viewModel.ticketsStatusesCount[index]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: displayHeight(context) * 0.037,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                                _viewModel.ticketsStatuses[index]
                                    .toString()
                                    .getString(context),
                                style: TextStyle(
                                    fontSize: displayHeight(context) * 0.014,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.04),
                ListView.builder(
                  itemCount:
                      widget.projectTicketsModel?.dataTicketsProject?.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: displayHeight(context) * 0.02),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                          bottom: displayHeight(context) * 0.02),
                      child: ElevatedButton(
                        onPressed: () {
                          // context.push(Routes.projectDetailsRoute,
                          //     extra: widget.projectTicketsModel
                          //         .dataTicketsProject![index]);
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
                                    widget.projectTicketsModel!
                                        .dataTicketsProject![index].subject
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: displayHeight(context) * 0.017,
                                      color: ColorsManager.fontColor1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${widget.projectTicketsModel!.dataTicketsProject![index].date}',
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
                                  _viewModel.projectTicketsStats[widget
                                          .projectTicketsModel!
                                          .dataTicketsProject![index]
                                          .status]
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
                      ),
                    );
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
