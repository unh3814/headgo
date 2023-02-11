import 'package:demo/app_properties.dart';
import 'package:demo/models/product.dart';
import 'package:demo/screens/product/product_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  List<Product> products = [
    Product('assets/bag_1.png', 'Bag', 'Beautiful bag', 2.33),
    Product('assets/cap_5.png', 'Cap', 'Cap with beautiful design', 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              const Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: const Alignment(0, 0),
                            radius: 0.6,
                            focal: const Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
              ),
            ),
          ),
        ),
      ],
    );
  }
}
