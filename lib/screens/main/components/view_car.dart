import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../models/category.dart';
import 'recommended_list.dart';
import 'category_card.dart';
class ViewCar extends StatelessWidget{
  List<Category> categories = [
    Category(
      const Color(0xffFCE183),
      const Color(0xffF68D7F),
      'New Driver',
      'assets/jeans_5.png',
    ),
    Category(
      const Color(0xffF749A2),
      const Color(0xffFF7375),
      'Other',
      'assets/jeans_5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height / 9,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (_, index) => CategoryCard(
                    category: categories[index],
                  ))
          ),
          const SizedBox(
            height: 16.0,
          ),
          Flexible(child: RecommendedList()),
        ],
      ),
    );
  }
}