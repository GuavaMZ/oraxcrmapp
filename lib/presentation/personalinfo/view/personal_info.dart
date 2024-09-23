import 'package:flutter/material.dart';
import 'package:oraxcrm/presentation/personalinfo/viewmodel/personal_info_viewmodel.dart';
import 'package:provider/provider.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final PersonalInfoViewModel _viewModel = PersonalInfoViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => _viewModel, child: Scaffold());
  }
}
