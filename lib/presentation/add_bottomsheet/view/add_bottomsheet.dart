import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/app/app.dart';
import 'package:oraxcrm/presentation/resources/colors.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/sizehelper.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class AddBottomsheetView extends StatefulWidget {
  const AddBottomsheetView({super.key});

  @override
  State<AddBottomsheetView> createState() => _AddBottomsheetViewState();
}

class _AddBottomsheetViewState extends State<AddBottomsheetView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.bottomSheetColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(displayHeight(context) * 0.055),
            topRight: Radius.circular(displayHeight(context) * 0.055)),
      ),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.push(Routes.openTicketRoute);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.bgColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(displayHeight(context) * 0.055),
                          topRight:
                              Radius.circular(displayHeight(context) * 0.055))),
                  padding: EdgeInsets.all(displayHeight(context) * 0.038)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/open_ticket.svg'), 
                  SizedBox(width: displayWidth(context)* 0.06), 
                  SizedBox(
                    child: Text(
                      AppStrings.openTicket.getString(context),
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorsManager.fontColor1,
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            height: 1,
            color: ColorsManager.separatorColor,
          ),
          ElevatedButton(
              onPressed: () {
                context.push(Routes.contractSigningRoute);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.bgColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(),
                  padding: EdgeInsets.all(displayHeight(context) * 0.038)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/sign_contract.svg'),
                  SizedBox(width: displayWidth(context)* 0.06), 
                  SizedBox(
                    child: Text(
                      AppStrings.signContract.getString(context),
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorsManager.fontColor1,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
