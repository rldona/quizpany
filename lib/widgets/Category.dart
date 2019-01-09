import 'package:flutter/material.dart';


class Category extends StatefulWidget {
  final int id;
  final String name;
  final _categorySelected;

  Category(this.id, this.name, this._categorySelected);

  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isSelected = false;

  _categorySelected() {
    setState(() => isSelected = !isSelected);
    widget._categorySelected(widget.id, isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.deepOrange,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
          ],
        )

      ),
      onTap: _categorySelected,
    );
  }
}
