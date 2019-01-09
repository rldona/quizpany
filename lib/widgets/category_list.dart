import 'package:flutter/material.dart';

import 'package:quizpany/widgets/Category.dart';


class CategoryList extends StatefulWidget {
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  List <Map<String, dynamic>> categories = [
    { 'id': 0, 'name': 'Front-end', 'selected': false },
    { 'id': 1, 'name': 'Back-end', 'selected': false },
    { 'id': 2, 'name': 'Dev-ops', 'selected': false },
    { 'id': 3, 'name': 'Scrum Master', 'selected': false },
    { 'id': 4, 'name': 'Architect', 'selected': false },
    { 'id': 5, 'name': 'Facilitator', 'selected': false },
    { 'id': 6, 'name': 'QA', 'selected': false },
    { 'id': 7, 'name': 'People', 'selected': false },
  ];

  List categoriesSelected = [];

  _renderCategories() => categories.map((category) => Category(category['id'], category['name'], _categorySelected)).toList();


  _categorySelected(id, isSelected) {
    categories[id]['selected'] = isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: _renderCategories()
      )
    );
  }
}