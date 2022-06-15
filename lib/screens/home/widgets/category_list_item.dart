import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/category_model.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    this.category,
    this.onTap,
  }) : super(key: key);

  final CategoryModel category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBoxDecorationRadius),
      ),
      margin: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(kBoxDecorationRadius)),
        ),
        child: InkWell(
          onTap: onTap ?? () {},
          child: Column(
            children: <Widget>[
              Container(
                height: 90.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kBoxDecorationRadius),
                    topRight: Radius.circular(kBoxDecorationRadius),
                  ),
                  image: DecorationImage(
                    image: AssetImage(category.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: kPaddingS, left: kPaddingS, right: kPaddingS),
                child: StrutText(
                  category.title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle1.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
