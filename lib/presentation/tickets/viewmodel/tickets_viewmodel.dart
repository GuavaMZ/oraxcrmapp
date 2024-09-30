import 'package:flutter/material.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class TicketsViewModel extends ChangeNotifier {
    Map<String, String> projectTicketsStats = {
    '1': AppStrings.notStarted,
    '2': AppStrings.inProgress,
    '3': AppStrings.onHold,
    '4': AppStrings.cancelled,
    '5': AppStrings.finished,
  };
}