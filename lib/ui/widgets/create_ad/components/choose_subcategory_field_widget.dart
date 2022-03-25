import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../index.dart';

class ChooseSubCategoryFieldWidget extends StatefulWidget {
  final CreateAdBloc createAdBloc;

  const ChooseSubCategoryFieldWidget({
    Key? key,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<ChooseSubCategoryFieldWidget> createState() =>
      _ChooseSubCategoryFieldWidgetState();
}

class _ChooseSubCategoryFieldWidgetState
    extends State<ChooseSubCategoryFieldWidget> {
  final focusNode = FocusNode();
  final layerLink = LayerLink();
  late List<ItemCategoryModel> _subCategoriesList;

  late TextEditingController _controller;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    _subCategoriesList =
        widget.createAdBloc.state.category?.subCategories ?? [];

    _controller = TextEditingController();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _subCategoriesList =
            widget.createAdBloc.state.category?.subCategories ?? [];
        showOverlay();
      } else {
        hideOverlay();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: buildOverlay(),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  Widget buildOverlay() => Material(
        color: Colors.transparent,
        child: Material(
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
              border: Border.all(
                color: mainLightColor,
                width: 1,
              ),
            ),
            constraints: BoxConstraints(maxHeight: 140),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  _subCategoriesList.isEmpty ? 1 : _subCategoriesList.length,
              //  Todo: для Алекса (14.10.2021): заменить на:  _subCategoriesList.length, чтобы нул не поймать
              itemBuilder: (context, index) {
                if (_subCategoriesList.isEmpty) {
                  return InkWell(
                    onTap: () {},
                    child: Text(
                      _controller.text.isEmpty
                          ? 'Выберите подкателгорию'.tr()
                          : 'Результаты не найдены'.tr(),
                    ),
                  );
                } else {
                  final String title = _subCategoriesList[index].name;
                  return InkWell(
                    onTap: () {
                      _controller.text = title;
                      widget.createAdBloc.add(
                        CreateAdInsertedSubCategoryEvent(
                          subCategory: _subCategoriesList[index],
                        ),
                      );
                      hideOverlay();
                      focusNode.unfocus();
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: Text(
                        title,
                        style: AntaresMarketTextTheme.h6grey2Color16w500,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.createAdBloc.state.subCategory?.name ?? '';
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        enabled: widget.createAdBloc.state.category?.subCategories.isNotEmpty ??
            false,
        focusNode: focusNode,
        controller: _controller,
        onChanged: (value) {
          final List<ItemCategoryModel>? allSubCategoriesList =
              widget.createAdBloc.state.category?.subCategories;
          List<ItemCategoryModel> newSubCategoriesList = [];
          Future(() {
            allSubCategoriesList?.forEach(
              (element) {
                if (element.name.toLowerCase().contains(value.toLowerCase())) {
                  newSubCategoriesList.add(element);
                }
              },
            );
            _subCategoriesList = newSubCategoriesList;
            entry?.markNeedsBuild();
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: mainLightColor, width: 1.0),
          ),
          // errorBorder: InputBorder.none,
          // disabledBorder: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          hintText: 'Выберите подкатегорию'.tr(),
          hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
          errorText: widget.createAdBloc.state.subCategoryError?.tr(),
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
    );
  }
}
