import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../index.dart';

class PropertyElementDropdownSelectWidget extends StatefulWidget {
  final CategoryPropertyModel element;
  final CreateAdBloc createAdBloc;

  const PropertyElementDropdownSelectWidget({
    Key? key,
    required this.element,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<PropertyElementDropdownSelectWidget> createState() =>
      _PropertyElementDropdownSelectWidgetState();
}

class _PropertyElementDropdownSelectWidgetState
    extends State<PropertyElementDropdownSelectWidget> {
  final TextEditingController _textControllerListOption =
      TextEditingController();
  late List<PropertyOptionModel> _itemListListOption;
  final focusNodeListOption = FocusNode();
  final layerLinkListOption = LayerLink();
  OverlayEntry? entryListOption;

  final TextEditingController _textControllerSubOption =
      TextEditingController();
  List<PropertyOptionModel> _itemListSubOption = [];
  final focusNodeSubOption = FocusNode();
  final layerLinkSubOption = LayerLink();
  OverlayEntry? entrySubOption;

  @override
  void initState() {
    super.initState();

    _itemListListOption = widget.element.listOptions;
    try {
      _itemListSubOption = (widget.createAdBloc.state
              .properties?[widget.element.id] as List<PropertyOptionModel>)[0]
          .subOptions;
    } catch (e) {}

    focusNodeListOption.addListener(() {
      if (focusNodeListOption.hasFocus) {
        showOverlayListOption();
      } else {
        hideOverlay();
        setState(() {});
      }
    });
    focusNodeSubOption.addListener(() {
      // _itemListSubOption =
      //     (widget.createAdBloc.state.properties?[widget.element.title]
      //             as List<PropertyOptionModel>)[0]
      //         .subOptions;
      if (focusNodeSubOption.hasFocus) {
        showOverlaySubOption();
      } else {
        hideOverlay();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _textControllerListOption.dispose();
    _textControllerSubOption.dispose();
    entryListOption?.dispose();
    entrySubOption?.dispose();

    super.dispose();
  }

  void showOverlayListOption() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entryListOption = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        height: renderBox.size.height * 3,
        child: CompositedTransformFollower(
          link: layerLinkListOption,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: buildOverlayListOption(),
        ),
      ),
    );

    overlay.insert(entryListOption!);
  }

  void showOverlaySubOption() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entrySubOption = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        height: renderBox.size.height * 3,
        child: CompositedTransformFollower(
          link: layerLinkSubOption,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: buildOverlaySubOption(),
        ),
      ),
    );

    overlay.insert(entrySubOption!);
  }

  void hideOverlay() {
    entryListOption?.remove();
    entryListOption = null;
    entrySubOption?.remove();
    entrySubOption = null;
  }

  Widget buildOverlayListOption() => Material(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
        ),
        color: Colors.red,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _itemListListOption.length,
            itemBuilder: (context, index) {
              final String title = _itemListListOption[index].title;
              return InkWell(
                onTap: () {
                  _textControllerListOption.text = title;
                  widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
                    id: widget.element.id,
                    type: widget.element.type,
                    value: _itemListListOption[index],
                  ));
                  hideOverlay();
                  focusNodeListOption.unfocus();
                },
                child: Text(title),
              );
            },
          ),
        ),
      );

  Widget buildOverlaySubOption() => Material(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
        ),
        color: Colors.red,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _itemListSubOption.length,
            itemBuilder: (context, index) {
              final String title = _itemListSubOption[index].title;
              return InkWell(
                onTap: () {
                  _textControllerSubOption.text = title;
                  widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
                    id: widget.element.id,
                    type: widget.element.type,
                    value: null,
                    subOptions: _itemListSubOption[index],
                  ));
                  hideOverlay();
                  focusNodeSubOption.unfocus();
                },
                child: Text(title),
              );
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InputDropDownWidget<PropertyOptionModel>(
          itemsList: widget.element.listOptions,
          title: (widget.createAdBloc.state.properties?[widget.element.id]
                      as List<PropertyOptionModel>)
                  .asMap()
                  .containsKey(0)
              ? (widget.createAdBloc.state.properties?[widget.element.id]
                      as List<PropertyOptionModel>)[0]
                  .title
              : '',
          onTap: ({itemList}) {
            widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
              id: widget.element.id,
              type: widget.element.type,
              value: itemList,
            ));
            setState(() {});
          },
        ),
        /*    CompositedTransformTarget(
          link: layerLinkListOption,
          child: TextField(
            focusNode: focusNodeListOption,
            controller: _textControllerListOption,
            onChanged: (value) {
              final List<PropertyOptionModel> allItemListOptions =
                  widget.element.listOptions;
              List<PropertyOptionModel> newItemListOptions = [];
              Future(() {
                allItemListOptions.forEach(
                  (element) {
                    if (element.title
                        .toLowerCase()
                        .contains(value.toLowerCase())) {
                      newItemListOptions.add(element);
                    }
                  },
                );
                _itemListListOption = newItemListOptions;
                entryListOption?.markNeedsBuild();
              });
            },
            onEditingComplete: () {
              _textControllerListOption.text =
                  (widget.createAdBloc.state.properties?[widget.element.title]
                          as List<PropertyOptionModel>)[0]
                      .title;
              focusNodeListOption.unfocus();
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Выберите из списка'.tr(),
              hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
            ),
          ),
        ),
*/
        if ((widget.createAdBloc.state.properties?[widget.element.id]
                    as List<PropertyOptionModel>)
                .isNotEmpty &&
            (widget.createAdBloc.state.properties?[widget.element.id]
                    as List<PropertyOptionModel>)[0]
                .subOptions
                .isNotEmpty) ...[
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          /*   CompositedTransformTarget(
            link: layerLinkSubOption,
            child: TextField(
              focusNode: focusNodeSubOption,
              controller: _textControllerSubOption,
              onChanged: (value) {
                final List<PropertyOptionModel> allItemListOptions =
                    (widget.createAdBloc.state.properties?[widget.element.title]
                            as List<PropertyOptionModel>)[0]
                        .subOptions;
                List<PropertyOptionModel> newItemListOptions = [];
                Future(() {
                  allItemListOptions.forEach(
                    (element) {
                      if (element.title
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        newItemListOptions.add(element);
                      }
                    },
                  );
                  _itemListSubOption = newItemListOptions;
                  entrySubOption?.markNeedsBuild();
                });
              },
              onEditingComplete: () {
                _textControllerSubOption.text =
                    (widget.createAdBloc.state.properties?[widget.element.title]
                            as List<PropertyOptionModel>)[1]
                        .title;
                focusNodeSubOption.unfocus();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Выберите из списка'.tr(),
                hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
              ),
            ),
          ),
         */
          InputDropDownWidget<PropertyOptionModel>(
            itemsList: (widget.createAdBloc.state.properties?[widget.element.id]
                    as List<PropertyOptionModel>)[0]
                .subOptions,
            title: (widget.createAdBloc.state.properties?[widget.element.id]
                        as List<PropertyOptionModel>)
                    .asMap()
                    .containsKey(1)
                ? (widget.createAdBloc.state.properties?[widget.element.id]
                        as List<PropertyOptionModel>)[1]
                    .title
                : '',
            onTap: ({itemList}) {
              widget.createAdBloc.add(CreateAdInsertedNewPropertyEvent(
                id: widget.element.id,
                type: widget.element.type,
                value: null,
                subOptions: itemList,
              ));
            },
          ),
        ],
      ],
    );
  }
}

class InputDropDownWidget<T> extends StatefulWidget {
  final List<T> itemsList;
  final void Function({T? itemList}) onTap;
  final String title;
  final String? errorText;
  const InputDropDownWidget({
    Key? key,
    required this.itemsList,
    required this.onTap,
    this.title = '',
    this.errorText,
  }) : super(key: key);

  @override
  _InputDropDownWidgetState<T> createState() => _InputDropDownWidgetState<T>();
}

class _InputDropDownWidgetState<T> extends State<InputDropDownWidget<T>> {
  final layerLink = LayerLink();
  final focusNode = FocusNode();
  final textController = TextEditingController();
  final scrollController = ScrollController();

  OverlayEntry? overlayEntry;
  late List<T> _itemList;

  @override
  void initState() {
    super.initState();
    textController.text = widget.title;
    _itemList = widget.itemsList;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        updateList(textController.text);
        showOverlay();
      } else {
        hideOverlay();

        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: buildOverlay(maxHeight: size.height * 3),
        ),
      );
    });

    overlay.insert(overlayEntry!);
  }

  void onTap({item}) {
    print(item);
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  Widget buildOverlay({required double maxHeight}) {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: ScreenUtil().setHeight(maxHeight),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
          child: Scrollbar(
            radius: Radius.circular(ScreenUtil().setWidth(5)),
            showTrackOnHover: false,
            thickness: ScreenUtil().setWidth(5),
            interactive: true,
            controller: scrollController,
            child: ListView.builder(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: _itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    textController.text =
                        (_itemList[index] as PropertyOptionModel).title;
                    widget.onTap(
                      itemList: _itemList[index],
                    );
                    focusNode.unfocus();
                    hideOverlay();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(12),
                      vertical: ScreenUtil().setHeight(10),
                    ),
                    child: Text(
                      (_itemList[index] as PropertyOptionModel).title,
                      style: AntaresMarketTextTheme.h6grey2Color16w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void updateList(value) {
    final allItemsList = widget.itemsList;
    List<T> newItemsList = [];
    Future(() {
      allItemsList.forEach(
        (element) {
          if ((element as PropertyOptionModel).title.toLowerCase().contains(
                value.toLowerCase(),
              )) {
            newItemsList.add(element);
          }
        },
      );
      _itemList = newItemsList;
      overlayEntry?.markNeedsBuild();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
      child: CompositedTransformTarget(
        link: layerLink,
        child: TextField(
          focusNode: focusNode,
          controller: textController,
          onChanged: (value) {
            updateList(value);
          },
          onEditingComplete: () {
            if (textController.text.isNotEmpty) {
              if (_itemList.isNotEmpty) {
                widget.onTap(
                  itemList: _itemList[0],
                );
                textController.text =
                    (_itemList[0] as PropertyOptionModel).title;
              }
            } else {
              widget.onTap();
            }
            focusNode.unfocus();
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: textController.text.isNotEmpty
                ? textController.text
                : 'Выберите из списка'.tr(),
            hintStyle: AntaresMarketTextTheme.p1grey2Color16w400,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: mainLightColor, width: 1.0),
            ),
            errorText: widget.errorText?.tr(),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffef6f63), width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffef6f63), width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
