import 'package:flutter/material.dart';
import 'package:oraxcrm/presentation/drawer/viewmodel/drawer_viewmodel.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  final DrawerViewmodel _viewModel = DrawerViewmodel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,);
      
  }
}