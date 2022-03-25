import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';

class PropertyElementCheckboxListWidget extends StatefulWidget {
  final CreateAdBloc createAdBloc;
  final CategoryPropertyModel element;
  const PropertyElementCheckboxListWidget({
    Key? key,
    required this.element,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<PropertyElementCheckboxListWidget> createState() =>
      _PropertyElementCheckboxListWidgetState();
}

class _PropertyElementCheckboxListWidgetState
    extends State<PropertyElementCheckboxListWidget> {
  @override
  Widget build(BuildContext context) {
    final List selectedOptions =
        widget.createAdBloc.state.properties?[widget.element.id] ?? [];

    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.element.listOptions.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          title: Text(widget.element.listOptions[index].title),
          controlAffinity: ListTileControlAffinity.leading,
          value: widget.createAdBloc.state.properties
                      ?.containsKey(widget.element.id) ??
                  false
              ? selectedOptions.contains(widget.element.listOptions[index].id)
                  ? true
                  : false
              : false,
          onChanged: (value) {
            widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
              id: widget.element.id,
              type: widget.element.type,
              value: widget.element.listOptions[index].id,
            ));
            setState(() {});
          },
        );
      },
    );
  }
}
