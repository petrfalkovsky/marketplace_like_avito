import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:flutex/flutex.dart';

class MainPage extends StatefulWidget {
  const MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with StateUtilsMixin, CancelMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;
  late SearchBloc _searchBloc;
  late FavoritesBloc _favoritesBloc;
  // late MessageBloc _messageBloc;
  late ProfileBloc _profileBloc;
  late CreateAdBloc _createAdBloc;

  bool closeApp = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _searchBloc = BlocProvider.of<SearchBloc>(context);
    _favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    // _messageBloc = BlocProvider.of<MessageBloc>(context);
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _createAdBloc = BlocProvider.of<CreateAdBloc>(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop(BuildContext context) {
    switch (_tabController.index) {
      case 0:
        if (!closeApp) {
          closeApp = true;
          AlertManager.showShortToast(
              'Нажмите ещё раз, чтобы закрыть приложение');
          Future.delayed(Duration(seconds: 2), () {
            closeApp = false;
          });
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      case 1:
        _tabController.animateTo(0);
        return Future.value(false);
      case 2:
        _tabController.animateTo(0);
        continue _default;

      case 3:
        if (_profileBloc.state.switcher != ProfileSwitcher.menu) {
          _profileBloc.add(MenuProfileEvent());
        } else {
          _tabController.animateTo(0);
        }
        return Future.value(false);
      case 4:
        switch (_createAdBloc.state.switcher) {
          case CreateAdSwitcher.TextPart:
            _tabController.animateTo(_tabController.previousIndex);
            break;
          case CreateAdSwitcher.CategoryPart:
            _createAdBloc.add(CreateAdStartedEvent());
            break;
          case CreateAdSwitcher.PhotoPart:
            _createAdBloc.add(CreateAdTextPartFilledEvent(
              titleAd: _createAdBloc.state.titleAd,
              descriptionAd: _createAdBloc.state.descriptionAd,
            ));
            break;
          case CreateAdSwitcher.MoneyPart:
            _createAdBloc.add(CreateAdCategoriesPartFilledEvent());
            break;
          default:
        }
        continue _default;
      _default:
      default:
        return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop(context);
      },
      child: PageBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.purpleAccent,
          // backgroundColor: Colors.redAccent,
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ProductListState(
                searchBloc: _searchBloc,
              ),
              FavoritesStateWidget(
                favoritesBloc: _favoritesBloc,
              ),
              MessagesStateWidget(),
              ProfileStateWidget(
                profileBloc: _profileBloc,
              ),
              CreateAdStateWidget(
                createAdBloc: _createAdBloc,
                tabController: _tabController,
              ),
            ],
          ),
          bottomNavigationBar: BottomBar(
            controller: _tabController,
            color: Colors.grey[400]!,
            selectedColor: Colors.black,
            iconSize: ScreenUtil().setWidth(25),
            notchedShape: CircularNotchedRectangle(),
            items: [
              BottomBarItem(
                iconData: Icons.shopping_cart_outlined,
                text: 'Поиск'.tr(),
                onPressed: () {
                  // _searchBloc.add(OpenCategoryEvent(
                  //   category: null,
                  //   search: '',
                  // ));
                },
              ),
              BottomBarItem(
                iconData: FontAwesomeIcons.heart,
                text: 'Избранное'.tr(),
                onPressed: () {
                  SessionController.requestAccess(
                    requiredLevel: AuthAccessLevel.emailNotConfirmed,
                    onSuccess: () {
                      if (!_tabController.indexIsChanging)
                        _favoritesBloc.add(UploadFavoritesEvent());
                      // _tabController.animateTo(1);
                    },
                    onNotSuccess: () {
                      _tabController.animateTo(_tabController.previousIndex);
                    },
                  );
                  // if (SessionController.accessLevel ==
                  //     AuthAccessLevel.unauthorized) {
                  //   _tabController.animateTo(0);
                  // }
                },
              ),
              BottomBarItem(
                iconData: FontAwesomeIcons.commentDots,
                text: 'Сообщения'.tr(),
                onPressed: () {
                  SessionController.requestAccess(
                    requiredLevel: AuthAccessLevel.fullAccess,
                    onSuccess: () {},
                    onNotSuccess: () {
                      _tabController.animateTo(_tabController.previousIndex);
                    },
                  );
                  // if (SessionController.accessLevel ==
                  //     AuthAccessLevel.unauthorized) {
                  //   _tabController.animateTo(0);
                  // }
                },
              ),
              BottomBarItem(
                iconData: FontAwesomeIcons.user,
                text: 'Профиль'.tr(),
                onPressed: () {
                  SessionController.requestAccess(
                    requiredLevel: AuthAccessLevel.emailNotConfirmed,
                    onSuccess: () {
                      if (!_tabController.indexIsChanging)
                        _profileBloc.add(MenuProfileEvent());
                    },
                    onNotSuccess: () {
                      _tabController.animateTo(_tabController.previousIndex);
                    },
                  );
                },
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              onPressed: () {
                SessionController.requestAccess(
                  requiredLevel: AuthAccessLevel.fullAccess,
                  onSuccess: () {
                    _tabController.animateTo(4);
                    if (!_tabController.indexIsChanging)
                      _createAdBloc.add(CreateAdDataClearedEvent());
                    if (_createAdBloc.state.switcher ==
                        CreateAdSwitcher.CreatedAdPart) {
                      _createAdBloc.add(CreateAdDataClearedEvent());
                    }
                  },
                  onNotSuccess: () {
                    _tabController.animateTo(_tabController.previousIndex);
                  },
                );
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                child: Icon(
                  Icons.add,
                  size: 35,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xFF4ad3b4),
                    Color(0xFF62e683),
                  ]),
                ),
              ),
              elevation: 2.0,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
