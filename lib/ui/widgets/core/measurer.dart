import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Measurer extends SingleChildRenderObjectWidget {
  final OnMeasure? onMeasure;
  final OnPaintBoundsChanged? onPaintBoundsChanged;

  const Measurer({
    Key? key,
    this.onMeasure,
    this.onPaintBoundsChanged,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MeasureSizeRenderObject(
      onMeasure: onMeasure,
      onPaintBoundsChanged: onPaintBoundsChanged,
    );
  }
}

typedef OnMeasure = void Function(
  Size size,
  BoxConstraints constraints,
);

typedef OnPaintBoundsChanged = void Function(
  Rect paintBounds,
);

class _MeasureSizeRenderObject extends RenderProxyBox {
  final OnMeasure? onMeasure;
  final OnPaintBoundsChanged? onPaintBoundsChanged;

  late Size _size;
  late BoxConstraints _constraints;
  late Rect _paintBounds;

  _MeasureSizeRenderObject({
    this.onMeasure,
    this.onPaintBoundsChanged,
  });

  @override
  void performLayout() {
    super.performLayout();

    var measureChanged = false;
    var paintBoundsChanged = false;

    if (child == null) return;

    final newSize = child!.size;
    if (_size != newSize) {
      _size = newSize;
      measureChanged = true;
    }

    final newConstraints = child!.constraints;
    if (_constraints != newConstraints) {
      _constraints = newConstraints;
      measureChanged = true;
    }

    final newPaintBounds = child!.paintBounds;
    if (_paintBounds != newPaintBounds) {
      _paintBounds = newPaintBounds;
      paintBoundsChanged = true;
    }

    measureChanged = onMeasure != null && measureChanged;
    paintBoundsChanged = onPaintBoundsChanged != null && paintBoundsChanged;

    if (measureChanged || paintBoundsChanged) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (measureChanged) {
          onMeasure?.call(
            _size,
            _constraints,
          );
        }
        if (paintBoundsChanged) {
          onPaintBoundsChanged?.call(
            _paintBounds,
          );
        }
      });
    }
  }
}
