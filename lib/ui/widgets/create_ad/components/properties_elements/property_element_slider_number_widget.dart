import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../index.dart';

class PropertyElementSliderNumberWidget extends StatefulWidget {
  final CategoryPropertyModel element;
  final CreateAdBloc createAdBloc;

  const PropertyElementSliderNumberWidget({
    Key? key,
    required this.element,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<PropertyElementSliderNumberWidget> createState() =>
      _PropertyElementSliderNumberWidgetState();
}

class _PropertyElementSliderNumberWidgetState
    extends State<PropertyElementSliderNumberWidget> {
  @override
  Widget build(BuildContext context) {
    final _value =
        widget.createAdBloc.state.properties?.containsKey(widget.element.id) ??
                false
            ? widget.createAdBloc.state.properties![widget.element.id]
            : widget.element.rules?.min;
    return SfSlider(
      value: _value,
      min: widget.element.rules?.min,
      max: widget.element.rules?.max,
      activeColor: mainLightColorForSliders,
      inactiveColor: nonActiveColor,
      showLabels: true,
      enableTooltip: true,
      // numberFormat: NumberFormat("\ "),
      onChanged: (newValue) {
        widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
          id: widget.element.id,
          type: widget.element.type,
          value: widget.element.rules?.float ?? false
              ? newValue as double
              : (newValue as double).ceil(),
        ));
        setState(() {});
      },
      stepSize: widget.element.rules?.float ?? false ? 0.1 : 1,
    );
  }
}
