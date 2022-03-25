import 'package:flutter/material.dart';

class FillBodyWidget extends StatelessWidget {
  final Widget child;
  final RefreshCallback? onRefresh;
  final EdgeInsets? scrollPadding;

  const FillBodyWidget({
    required this.child,
    this.onRefresh,
    this.scrollPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final content = SingleChildScrollView(
          padding: scrollPadding,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );

        if (onRefresh != null) {
          return RefreshIndicator(
            onRefresh: onRefresh!,
            child: content,
          );
        }

        return content;
      },
    );
  }
}
