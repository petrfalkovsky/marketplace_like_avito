import 'dart:ui';

import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutex/flutex.dart';

class ProductWidget extends StatelessWidget {
  final ProductItemModel productItem;
  final List<ItemCategoryModel> categories;
  final bool replace;

  const ProductWidget({
    Key? key,
    required this.productItem,
    required this.categories,
    this.replace = false,
  }) : super(key: key);

  //////
  /// UI
  //////
  @override
  Widget build(BuildContext context) {
    final itemBloc = BlocProvider.of<ItemBloc>(context);
    final purchaseBloc = BlocProvider.of<PurchaseBloc>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(5),
        vertical: ScreenUtil().setHeight(5),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          itemBloc.add(LoadingItemEvent());
          itemBloc.add(AddPreviousItemEvent(item: productItem));
          if (!replace) {
            Get.toNamed(
              AppRoutes.ITEM,
              arguments: {
                'productItem': productItem,
                'categories': categories,
              },
            );
          } else {
            itemBloc.add(GetItemEvent(uri: productItem.uri));
            purchaseBloc.add(ClearPurchaseEvent());
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CachedNetworkImage(
                imageUrl: productItem.photosFilenames.first.fiveHundred,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, _) => AntProgressIndicator().center(),
                cacheManager: AppCacheManager(),
              ).expanded(flex: 136),
              Text(
                productItem.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: grey2Color,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              )
                  .padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(8),
                    ),
                  )
                  .left()
                  .expanded(flex: 40),
              _priceWidget(usdPrice: productItem.usdPrice)
                  .left()
                  .expanded(flex: 32),
              Text(
                DateFormat.MMMd(
                  context.locale.languageCode,
                ).add_jm().format(
                      productItem.created ?? DateTime(0),
                    ),
                style: TextStyle(
                  color: grey3Color,
                  fontSize: 12,
                ),
              )
                  .padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(8),
                    ),
                  )
                  .left()
                  .expanded(flex: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _priceWidget({double? usdPrice}) {
    String _usdPrice = '-';
    if (usdPrice != null) {
      _usdPrice = '\$' + usdPrice.toStringAsFixed(2);
    }
    return InnerShadow(
      blur: 4,
      color: Color.fromARGB(25, 0, 149, 169),
      offset: const Offset(1, 1),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(8),
        ),
        child: Text(
          _usdPrice,
          style: TextStyle(
            color: mainColor,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ).left(),
      ),
    );
  }
}

class InnerShadow extends SingleChildRenderObjectWidget {
  final double blur;
  final Color color;
  final Offset offset;

  const InnerShadow({
    Key? key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderInnerShadow renderObject,
  ) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  double blur = 0;
  Color color = Colors.transparent;
  double dx = 0;
  double dy = 0;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child!, offset);
    context.canvas..restore()..restore()..restore();
  }
}
