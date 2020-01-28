import 'package:blog_app_flutter/models/category.dart';
import 'package:flutter/material.dart';



class CategoriesList extends StatefulWidget {
  final List<CategoryModel> categories;
  const CategoriesList({
    Key key, @required this.categories,
  }) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 5.0),
      alignment: Alignment.center,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _active = i;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 5,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: i == _active ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: i == 0
                  ? EdgeInsets.only(right: 5.0)
                  : EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                "${widget.categories[i].title}",
                style: Theme.of(context).textTheme.button.copyWith(
                      color: i == _active ? Colors.white : Colors.grey,
                      fontWeight: i == _active ? FontWeight.bold : FontWeight.normal,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
