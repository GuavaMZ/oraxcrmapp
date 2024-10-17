import 'package:flutter/material.dart';

class OpenTicketViewmodel extends ChangeNotifier {
  TextEditingController subjectController = TextEditingController();
  TextEditingController ticketDescriptionController = TextEditingController();

  String? department;
  String? priority;

  List? derpartmentsList;
  List? priortiesList;

  Future getPriorty() async {}

  Future getDepartments() async {}
}
