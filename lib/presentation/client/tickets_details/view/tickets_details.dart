import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oraxcrm/domain/model/support_tickets_model.dart';
import 'package:oraxcrm/presentation/client/drawer/view/drawer.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/client/tickets_details/viewmodel/tickets_details_viewmodel.dart';
import 'package:oraxcrm/presentation/resources/widgets_constants.dart';
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
  void dispose() {
    _viewModel.messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Consumer<TicketsDetailsViewModel>(
        builder: (BuildContext context, value, Widget? child) => Container(
          color: const Color(0xffffffff),
          child: FutureBuilder(
              future: _viewModel.getTicketDetails(
                  context, widget.ticketDetails!.ticketid!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    // margin: EdgeInsets.only(top: displayHeight(context) * 0.1),
                    // height: displayHeight(context) * 0.17,
                    alignment: Alignment.center,
                    width: displayWidth(context) * 0.2,
                    child: LoadingAnimationWidget.discreteCircle(
                        color: ColorsManager.discreteCircleFirstColor,
                        secondRingColor:
                            ColorsManager.discreteCircleSecondColor,
                        thirdRingColor: ColorsManager.discreteCircleThirdColor,
                        size: displayWidth(context) * 0.1),
                  );
                } else {
                  return Scaffold(
                    backgroundColor: ColorsManager.bgColor,
                    // resizeToAvoidBottomInset: false,
                    drawer: const DrawerView(),
                    bottomSheet: Container(
                      alignment: const Alignment(0, 0.96),
                      height: displayHeight(context) * 0.44,
                      width: displayWidth(context) * 0.95,
                      decoration: BoxDecoration(
                          color: ColorsManager.bgColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  displayHeight(context) * 0.03),
                              topRight: Radius.circular(
                                  displayHeight(context) * 0.03)),
                          boxShadow: [
                            BoxShadow(
                                color: ColorsManager.defaultShadowColor
                                    .withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 15,
                                offset: const Offset(0, 4))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: displayHeight(context) * 0.33,
                            child: SingleChildScrollView(
                              child: ListView.separated(
                                itemCount: _viewModel.ticketsDetails?.data
                                        ?.ticketReplies.length ??
                                    0,
                                shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.symmetric(
                                    horizontal: displayWidth(context) * 0.06),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 3);
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${_viewModel.ticketsDetails!.data!.ticketReplies[index].submitter!} :',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: displayWidth(context) * 0.9,
                                        child: HtmlWidget(_viewModel
                                            .ticketsDetails!
                                            .data!
                                            .ticketReplies[index]
                                            .message!),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: displayWidth(context) * 0.15,
                            height: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(
                                vertical: displayHeight(context) * 0.008),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: displayWidth(context) * 0.6,
                                // height: displayHeight(context) * 0.073,
                                child: TextField(
                                  controller: _viewModel.messageTextController,

                                  decoration: InputDecoration(
                                    hintText:
                                        AppStrings.addReply.getString(context),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            displayWidth(context) * 0.04,
                                        vertical:
                                            displayHeight(context) * 0.017),
                                  ),
                                  maxLines: 1,

                                  // fillColor: const Color(0xffffffff),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.attach_file)),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      elevation: 0,
                                      // backgroundColor: ColorManager.lightGreenColor,
                                      minimumSize: Size(
                                          displayWidth(context) * 0.1,
                                          displayHeight(context) * 0.06)),
                                  onPressed: () async {
                                    if (_viewModel.messageTextController.text
                                        .trim()
                                        .isNotEmpty) {
                                      WidgetsConstants.showProgressIndicator(
                                          context, true, '');
                                      await _viewModel.addReply(
                                          widget.ticketDetails!.ticketid!,
                                          FormData.fromMap({
                                            'files': [],
                                            'add_reply':
                                                widget.ticketDetails!.ticketid,
                                            'message': _viewModel
                                                .messageTextController.text
                                                .trim(),
                                          }),
                                          context);
                                      if (context.mounted) {
                                        context.pop();
                                      }
                                      _viewModel.messageTextController.clear();
                                    }
                                  },
                                  child: null)
                            ],
                          ),
                        ],
                      ),
                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: ColorsManager.iconsColor3,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: ColorsManager
                                                    .defaultShadowColor
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
                                      })),
                                  Text(
                                      AppStrings.ticketDetails
                                          .getString(context),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: ColorsManager.iconsColor3,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: ColorsManager
                                                    .defaultShadowColor
                                                    .withOpacity(0.1),
                                                spreadRadius: 0,
                                                offset: const Offset(0, 4),
                                                blurRadius: 25)
                                          ]),
                                      child: IconButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          icon: SvgPicture.asset(
                                              'assets/images/arrow-left 2.svg'))),
                                ],
                              ),
                            ),
                            SizedBox(height: displayHeight(context) * 0.05),
                            Container(
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
                                          color: ColorsManager
                                              .defaultShadowColor
                                              .withOpacity(0.1),
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                          blurRadius: 25)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.ticketDetails!.subject
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.ticketDetails!.priorityName
                                              .toString()
                                              .getString(context),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor2,
                                          ),
                                        ),
                                        Text(
                                          widget.ticketDetails?.departmentName
                                                  .toString() ??
                                              '',
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor1,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data.data.date.toString(),
                                          style: TextStyle(
                                            fontSize:
                                                displayHeight(context) * 0.017,
                                            color: ColorsManager.fontColor1,
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
                                          horizontal:
                                              displayWidth(context) * 0.04,
                                          vertical:
                                              displayHeight(context) * 0.005),
                                      child: Text(
                                        _viewModel.projectTicketsStats[
                                                widget.ticketDetails!.status]
                                            .toString()
                                            .getString(context),
                                        style: TextStyle(
                                            color: ColorsManager.fontColor3,
                                            fontSize:
                                                displayHeight(context) * 0.015),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
