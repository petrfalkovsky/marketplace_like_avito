import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteItemWidget extends StatelessWidget {
  final ProductItemModel productItem;
  final FavoritesBloc favoritesBloc;
  final List<ItemCategoryModel> categories;
  // final bool replace;

  const FavoriteItemWidget({
    Key? key,
    required this.productItem,
    required this.favoritesBloc,
    required this.categories,
    // this.replace = false,
  }) : super(key: key);

  //////
  /// UI
  //////

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(4)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          Get.toNamed(
            AppRoutes.ITEM,
            arguments: {
              'productItem': productItem,
              'categories': categories,
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            height: ScreenUtil().setHeight(140),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: productItem.photosFilenames[0].fiveHundred,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, _) => AntProgressIndicator().center(),
                  cacheManager: AppCacheManager(),
                ).sizedBox(width: ScreenUtil().setWidth(136)),
                SizedBox(width: ScreenUtil().setWidth(8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenUtil().setHeight(8)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productItem.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: grey2Color,
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setHeight(16),
                            fontFamily: 'SF Pro Display',
                          ),
                        )
                            .padding(
                              padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(4),
                              ),
                            )
                            .expanded(),

                        IconButton(
                          onPressed: () {
                            favoritesBloc.add(
                              ChangeFavoritesEvent(
                                productId: productItem.id,
                                favoritesBloc: favoritesBloc,
                              ),
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: heartColor,
                          ),
                          iconSize: ScreenUtil().setHeight(24),
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                        // Icon(
                        //   FontAwesomeIcons.solidHeart,
                        //   color: heartColor,
                        //   size: 24,
                        // ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(4)),
                    Text(
                      productItem.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: blackColor,
                        fontSize: ScreenUtil().setHeight(14),
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    SizedBox(height: ScreenUtil().setHeight(4)),
                    Text(
                      '\$' + productItem.usdPrice.toStringAsFixed(2),
                      style: TextStyle(
                        color: grey2Color,
                        fontWeight: FontWeight.w900,
                        fontSize: ScreenUtil().setHeight(18),
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                    SizedBox(height: 4),
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
                    ).right(),
                    SizedBox(height: ScreenUtil().setHeight(4)),
                  ],
                ).expanded(),
                SizedBox(width: ScreenUtil().setWidth(8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
