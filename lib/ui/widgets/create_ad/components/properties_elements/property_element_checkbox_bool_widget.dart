import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';

class PropertyElementCheckboxBoolWidget extends StatefulWidget {
  final CategoryPropertyModel element;
  final CreateAdBloc createAdBloc;
  const PropertyElementCheckboxBoolWidget({
    Key? key,
    required this.element,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<PropertyElementCheckboxBoolWidget> createState() =>
      _PropertyElementCheckboxBoolWidgetState();
}

class _PropertyElementCheckboxBoolWidgetState
    extends State<PropertyElementCheckboxBoolWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.element.title),
      controlAffinity: ListTileControlAffinity.leading,
      value: widget.createAdBloc.state.properties
                  ?.containsKey(widget.element.id) ??
              false
          ? true
          : false,
      onChanged: (value) {
        widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
          id: widget.element.id,
          type: widget.element.type,
          value: value,
        ));
        setState(() {});
      },
    );
  }
}
