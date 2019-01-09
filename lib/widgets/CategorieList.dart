import 'package:flutter/material.dart';

import 'package:quizpany/widgets/Category.dart';


class CategorieList extends StatefulWidget {
  _CategorieListState createState() => _CategorieListState();
}

class _CategorieListState extends State<CategorieList> {

  List categories = [
    { 'id': 0, 'name': 'Front-end' },
    { 'id': 1, 'name': 'Back-end' },
    { 'id': 2, 'name': 'Dev-ops' },
    { 'id': 3, 'name': 'Scrum Master' },
    { 'id': 4, 'name': 'Architect' },
    { 'id': 5, 'name': 'Facilitator' },
    { 'id': 6, 'name': 'QA' },
    { 'id': 7, 'name': 'People' },
  ];

  _renderCategories() => categories.map((category) => Category(category['name'])).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: _renderCategories()
      )
    );
  }
}