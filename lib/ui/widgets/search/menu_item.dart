import 'dart:math' as math;

import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutex/flutex.dart';

class MenuItemWidget extends StatefulWidget {
  final ItemCategoryModel category;
  final void Function(ItemCategoryModel) onSelected;

  const MenuItemWidget({
    Key? key,
    required this.category,
    required this.onSelected,
  }) : super(key: key);

  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(60),
                      child: FaIcon(
                        categoryIcon(name: widget.category.name).iconData,
                        size: ScreenUtil().setWidth(17),
                        color: greenLightColor,
                      ).center(),
                    ),
                    Text(
                      widget.category.name,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                onPressed: () => widget.onSelected(widget.category),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  minimumSize: Size(0, 50),
                ),
              ).expanded(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: ChevronWidget(
                  expanded: _expanded,
                  duration: const Duration(milliseconds: 750),
                ),
              ),
            ],
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(end: _expanded ? 1 : 0),
            curve: Curves.easeInOutBack,
            duration: const Duration(milliseconds: 750),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.category.subCategories.map((subCategory) {
                return SelectionWidget(
                  onTap: () => widget.onSelected(subCategory),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(64),
                      right: ScreenUtil().setWidth(10),
                      top: ScreenUtil().setHeight(8),
                      bottom: ScreenUtil().setHeight(8),
                    ),
                    child: Text(
                      subCategory.name,
                      style: TextStyle(color: mainColor),
                    ).sizedBox(width: double.infinity),
                  ),
                );
              }).toList(),
            ),
            builder: (context, value, child) {
              return ClipRect(
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 1),
                  heightFactor: math.max(value, 0.0),
                  child: child,
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(48),
            ),
            child: Divider(
              color: greyDivider,
            ),
          ),
        ],
      ),
    );
  }
}
