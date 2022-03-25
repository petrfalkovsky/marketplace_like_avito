import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarItem {
  final IconData iconData;
  final String text;
  final Function() onPressed;

  const BottomBarItem({
    required this.iconData,
    required this.text,
    required this.onPressed,
  });
}

class BottomBar extends StatefulWidget {
  final TabController controller;
  final List<BottomBarItem> items;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;

  BottomBar({
    required this.controller,
    Key? key,
    required this.items,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {
        _selectedIndex = widget.controller.index;
      });
    });
  }

  _updateIndex(int index) {
    _selectedIndex = index;
    widget.controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
        additionalOnPressed: widget.items[index].onPressed,
      );
    });
    items.insert(
      items.length >> 1,
      _buildMiddleTabItem(),
    );

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: SizedBox(height: widget.iconSize),
      ),
    );
  }

  Widget _tabItemIcon({
    required IconData iconData,
    required Color color,
    required double size,
    required bool selected,
  }) {
    if (selected) {
      return Container(
        width: size * 1.2,
        height: size * 1.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF4ad3b4),
            Color(0xFF62e683),
          ]),
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenUtil().setWidth(9),
            ),
          ),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: color,
            size: size / 1.6,
          ),
        ),
      );
    } else {
      return Container(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          iconData,
          color: color,
          size: size,
        ),
      );
    }
  }

  Widget _buildTabItem({
    required BottomBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
    required Function() additionalOnPressed,
  }) {
    final selected = _selectedIndex == index;
    final color = selected ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              onPressed(index);
              additionalOnPressed();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _tabItemIcon(
                  iconData: item.iconData,
                  color: color,
                  size: widget.iconSize,
                  selected: selected,
                ),
                Text(
                  item.text,
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
