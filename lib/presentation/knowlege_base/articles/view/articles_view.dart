import 'package:flutter/material.dart';
import 'package:oraxcrm/domain/model/knowledge_base_model.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key, this.articlesModel});
  final ArticlesModel? articlesModel;
  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
