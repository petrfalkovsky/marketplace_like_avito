import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../index.dart';

class ChooseCityFieldWidget extends StatefulWidget {
  final CreateAdBloc createAdBloc;
  const ChooseCityFieldWidget({
    Key? key,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<ChooseCityFieldWidget> createState() => _ChooseCityFieldWidgetState();
}

class _ChooseCityFieldWidgetState extends State<ChooseCityFieldWidget> {
  final focusNode = FocusNode();
  final layerLink = LayerLink();
  List<CityAssetModel> _curentCitiesList = [];

  late TextEditingController controller;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    // controller.text = widget.createAdBloc.state.city?.en ?? '';
    controller.value =
        TextEditingValue(text: widget.createAdBloc.state.city?.en ?? '');

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
    controller.dispose();

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
          child: buildOverlay(height: size.height),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  Widget buildOverlay({required double height}) => Material(
        elevation: 4.0,
        color: Colors.transparent,
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
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: _curentCitiesList.length,
            itemBuilder: (context, index) {
              final String title = _curentCitiesList[index].en;
              return InkWell(
                onTap: () {
                  widget.createAdBloc.add(
                    CreateAdInsertedCityEvent(city: _curentCitiesList[index]),
                  );
                  controller.text = title;

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
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: (value) {
          final List<CityAssetModel>? _citiesList =
              widget.createAdBloc.state.cityList;
          List<CityAssetModel> newCitiesList = [];
          Future(() {
            _citiesList?.forEach(
              (element) {
                if (element.ru.toLowerCase().contains(value.toLowerCase()) ||
                    element.en.toLowerCase().contains(value.toLowerCase())) {
                  newCitiesList.add(element);
                }
              },
            );
            _curentCitiesList = newCitiesList;
            entry?.markNeedsBuild();
          });
        },
        decoration: InputDecoration(
          hintText: 'Выберите город'.tr(),
          hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
          errorText: widget.createAdBloc.state.cityError?.tr(),
        ),
      ),
    );
  }
}
