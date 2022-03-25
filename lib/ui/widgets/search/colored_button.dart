import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColoredButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool filled;
  final double width;
  final double height;
  final Color color;
  final double textSize;
  final double borderRadius;

  const ColoredButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.filled,
    required this.width,
    required this.height,
    required this.color,
    required this.textSize,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: textSize,
            color: filled ? Colors.white : color,
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: filled ? color : Colors.transparent,
          elevation: 0,
          side: BorderSide(
            width: ScreenUtil().setWidth(1),
            color: color,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
