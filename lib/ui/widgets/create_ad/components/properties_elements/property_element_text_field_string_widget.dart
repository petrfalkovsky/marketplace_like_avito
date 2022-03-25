import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class PropertyElementTextFieldStringWidget extends StatefulWidget {
  final CategoryPropertyModel element;
  final CreateAdBloc createAdBloc;
  final String hintText;

  const PropertyElementTextFieldStringWidget({
    Key? key,
    required this.element,
    required this.createAdBloc,
    this.hintText = '',
  }) : super(key: key);

  @override
  State<PropertyElementTextFieldStringWidget> createState() =>
      _PropertyElementTextFieldStringWidgetState();
}

class _PropertyElementTextFieldStringWidgetState
    extends State<PropertyElementTextFieldStringWidget> {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    textController.text =
        widget.createAdBloc.state.properties?.containsKey(widget.element.id) ??
                false
            ? widget.createAdBloc.state.properties![widget.element.id]
            : '';

    // focusNode.addListener(() {
    //   if (!focusNode.hasFocus) {
    //     widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
    //       id: widget.element.id,
    //       type: widget.element.type,
    //       value: textController.text,
    //     ));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String newValue) {
        widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
          id: widget.element.id,
          type: widget.element.type,
          value: newValue,
        ));
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        fillColor: grey4Color,
        hintText: widget.hintText,
        hintStyle: AntaresMarketTextTheme.p1grey2Color16w400,
      ),
    );
  }
}
