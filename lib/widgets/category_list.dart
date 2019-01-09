import 'package:flutter/material.dart';

import 'package:quizpany/widgets/Category.dart';


class CategoryList extends StatelessWidget {
  final List <Map<String, dynamic>> categories;
  final _addRemoveCategory;

  CategoryList(this.categories, this._addRemoveCategory);

  _renderCategories() => categories.map((category) => Category(category['id'], category['name'], _categorySelected)).toList();

  _categorySelected(id, isSelected) {
    _addRemoveCategory(id, isSelected);
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
