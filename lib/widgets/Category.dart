import 'package:flutter/material.dart';


class Category extends StatefulWidget {
  final String name;

  Category(this.name);

  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.deepOrange,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
          ],
        )

      ),
      onTap: () => setState(() => selected = !selected),
    );
  }
}
