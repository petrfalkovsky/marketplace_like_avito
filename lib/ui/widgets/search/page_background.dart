import 'package:flutter/material.dart';

class PageBackground extends StatelessWidget {
  final Widget child;
  final bool colored;

  const PageBackground({
    Key? key,
    required this.child,
    this.colored = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            colored
                ? 'assets/images/back_colored.png'
                : 'assets/images/back.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
