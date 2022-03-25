import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';

class PropertyElementRadioListWidget extends StatefulWidget {
  final CategoryPropertyModel element;
  final CreateAdBloc createAdBloc;
  const PropertyElementRadioListWidget({
    Key? key,
    required this.element,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<PropertyElementRadioListWidget> createState() =>
      _PropertyElementRadioListWidgetState();
}

class _PropertyElementRadioListWidgetState
    extends State<PropertyElementRadioListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.element.listOptions.length,
      itemBuilder: (BuildContext context, int index) {
        return RadioListTile<String>(
          title: Text(widget.element.listOptions[index].title),
          value: widget.element.listOptions[index].id,
          groupValue:
              widget.createAdBloc.state.properties?[widget.element.id] ??
                  widget.element.listOptions[0].id,
          onChanged: (value) {
            widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
              id: widget.element.id,
              type: widget.element.type,
              value: value,
            ));
            setState(() {});
          },
        );
      },
    );
  }
}
