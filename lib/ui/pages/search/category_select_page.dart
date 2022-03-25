import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class CategorySelectPage extends StatefulWidget {
  const CategorySelectPage({
    Key? key,
  }) : super(key: key);

  @override
  _CategorySelectPageState createState() => _CategorySelectPageState();
}

class _CategorySelectPageState extends State<CategorySelectPage>
    with StateUtilsMixin {
  late List<ItemCategoryModel> _categories;

  @override
  void didInitDependencies() {
    super.didInitDependencies();

    final categories =
        args?.checkMapAndGet('categories').asCast<List<ItemCategoryModel>>();
    if (categories == null) {
      throw ArgumentError.notNull('categories');
    }
    _categories = categories;
  }

  //////
  /// UI
  //////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: Offset(0, 2),
                color: Color.fromARGB(25, 0, 146, 169),
              ),
            ],
            color: Colors.white,
          ),
          child: AppBar(
            centerTitle: true,
            title: Text('Все категории').tr(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            elevation: 0,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return MenuItemWidget(
                  category: _categories[index],
                  onSelected: (category) {
                    final searchBloc = BlocProvider.of<SearchBloc>(context);
                    searchBloc.add(OpenCategoryEvent(
                      category: category,
                      search: '',
                    ));
                    Future.delayed(Duration(milliseconds: 100)).then((_) {
                      Get.back();
                    });
                  },
                );
              },
              childCount: _categories.length,
            ),
          ),
          SliverBottomSafeArea(),
        ],
      ),
    );
  }
}
