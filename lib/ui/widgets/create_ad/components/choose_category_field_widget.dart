import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../index.dart';

class ChooseCategoryFieldWidget extends StatefulWidget {
  final CreateAdBloc createAdBloc;

  const ChooseCategoryFieldWidget({
    Key? key,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<ChooseCategoryFieldWidget> createState() =>
      _ChooseCategoryFieldWidgetState();
}

class _ChooseCategoryFieldWidgetState extends State<ChooseCategoryFieldWidget> {
  final focusNode = FocusNode();
  final layerLink = LayerLink();
  final textController = TextEditingController();
  final scrollController = ScrollController();
  late List<ItemCategoryModel> _categoriesList;

  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    _categoriesList = widget.createAdBloc.state.categories ?? [];

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        hideOverlay();
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

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: buildOverlay(maxHeight: size.height * 3),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
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
              itemCount: _categoriesList.length,
              itemBuilder: (context, index) {
                final String title = _categoriesList[index].name;
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    textController.text = title;
                    widget.createAdBloc.add(
                      CreateAdInsertedCategoryEvent(
                        category: _categoriesList[index],
                      ),
                    );
                    hideOverlay();
                    focusNode.unfocus();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(12),
                      vertical: ScreenUtil().setHeight(10),
                    ),
                    child: Text(
                      title,
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

  @override
  Widget build(BuildContext context) {
    textController.text = widget.createAdBloc.state.category?.name ?? '';
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        focusNode: focusNode,
        controller: textController,
        onChanged: (value) {
          final List<ItemCategoryModel>? allCategories =
              widget.createAdBloc.state.categories;
          List<ItemCategoryModel> newCategoriesList = [];
          Future(() {
            allCategories?.forEach(
              (element) {
                if (element.name.toLowerCase().contains(value.toLowerCase())) {
                  newCategoriesList.add(element);
                }
              },
            );
            _categoriesList = newCategoriesList;
            entry?.markNeedsBuild();
          });
        },
        onEditingComplete: () {
          textController.text = widget.createAdBloc.state.category?.name ?? '';
          focusNode.unfocus();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Выберите категорию'.tr(),
          hintStyle: AntaresMarketTextTheme.p1grey2Color16w400,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: mainLightColor, width: 1.0),
          ),
          errorText: widget.createAdBloc.state.categoryError?.tr(),
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
