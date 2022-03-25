import 'package:antares_market/core/index.dart';
import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileStateWidget extends StatefulWidget {
  final ProfileBloc profileBloc;
  const ProfileStateWidget({
    Key? key,
    required this.profileBloc,
  }) : super(key: key);

  @override
  _ProfileStateWidgetState createState() => _ProfileStateWidgetState();
}

class _ProfileStateWidgetState extends State<ProfileStateWidget>
    with StateUtilsMixin, AutomaticKeepAliveClientMixin {
  late ProfileBloc _profileBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _profileBloc = widget.profileBloc;
    _profileBloc.add(MenuProfileEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      builder: (context, state) {
        switch (state.status) {
          case ProfileStatus.error:
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                child: Text(
                  state.error,
                  textAlign: TextAlign.center,
                ).tr().center(),
              ),
            );
          case ProfileStatus.loading:
            return AntProgressIndicator().center();
          case ProfileStatus.normal:
            switch (state.switcher) {
              case ProfileSwitcher.profile:
                return UserProfileStateWidget(
                  userId: state.user!.id,
                  onBackPressed: () {
                    _profileBloc.add(MenuProfileEvent());
                  },
                );
              case ProfileSwitcher.ads:
              // return MyAdvertsStateWidget(
              //   onBackPressed: () {
              //     _profileBloc.add(MenuProfileEvent());
              //   },
              // );
              case ProfileSwitcher.reviews:
              // return MyRewiewsStateWidget(
              //   onBackPressed: () {
              //     _profileBloc.add(MenuProfileEvent());
              //   },
              // );
              case ProfileSwitcher.requests:
              // return MyRewiewsStateWidget(
              //   onBackPressed: () {
              //     _profileBloc.add(MenuProfileEvent());
              //   },
              // );

              case ProfileSwitcher.wallets:
              // return MyWalletsStateWidget(
              //   onBackPressed: () {
              //     _profileBloc.add(MenuProfileEvent());
              //   },
              // );
              case ProfileSwitcher.settings:
              // return SettingsStateWidget(
              //   onBackPressed: () {
              //     _profileBloc.add(MenuProfileEvent());
              //   },
              // );
              case ProfileSwitcher.menu:
              default:
                return menuProfileStateWidget(user: state.user!);
            }

          default:
            return Container(
              child: Center(
                child: Column(
                  children: [
                    Text('Please, await...'),
                    AntProgressIndicator(),
                  ],
                ),
              ),
            );
        }
      },
    );
  }

  Widget menuProfileStateWidget({required UserInfoModel user}) {
    return CustomScrollView(
      slivers: [
        MenuSliverAppBarWidget(
          userName: user.firstName,
          avatarUrl: user.avatar,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            MenuItemsWidget(
              text: 'Профиль',
              iconSvgPath: 'assets/icons/person_profile.svg',
              onTap: () {
                SessionController.requestAccess(
                  requiredLevel: AuthAccessLevel.emailNotConfirmed,
                  onSuccess: () {
                    _profileBloc.add(MyUserProfileEvent());
                  },
                );
              },
            ),
            MenuItemsWidget(
              text: 'Мои объявления',
              iconSvgPath: 'assets/icons/megafon.svg',
              onTap: () {
                SessionController.requestAccess(
                  requiredLevel: AuthAccessLevel.fullAccess,
                  onSuccess: () {
                    _profileBloc.add(MyAdsEvent());
                  },
                );
              },
            ),
            MenuItemsWidget(
              text: 'Мои отзывы',
              iconSvgPath: 'assets/icons/my_reviews.svg',
              onTap: () {
                SessionController.requestAccess(
                  requiredLevel: AuthAccessLevel.emailNotConfirmed,
                  onSuccess: () {
                    _profileBloc.add(MyReviewsEvent());
                  },
                );
              },
            ),
            MenuItemsWidget(
              text: 'Мои заявки',
              iconSvgPath: 'assets/icons/my_requests.svg',
              onTap: () {
                SessionController.requestAccess(
                  requiredLevel: AuthAccessLevel.fullAccess,
                  onSuccess: () {
                    _profileBloc.add(MyRequestsEvent());
                  },
                );
              },
            ),
            MenuItemsWidget(
              text: 'Мои кошельки',
              iconSvgPath: 'assets/icons/wallet.svg',
              onTap: () {
                SessionController.requestAccess(
                  requiredLevel: AuthAccessLevel.emailNotConfirmed,
                  onSuccess: () {
                    _profileBloc.add(MyWalletsEvent());
                  },
                );
              },
            ),
            MenuItemsWidget(
              text: 'Настройки',
              iconSvgPath: 'assets/icons/settings.svg',
              onTap: () async {
                SessionController.requestAccess(
                  requiredLevel: AuthAccessLevel.fullAccess,
                  onSuccess: () {
                    _profileBloc.add(SettingsEvent());
                  },
                );

                PackageInfo packageInfo = await PackageInfo.fromPlatform();

                String version = packageInfo.version;
                String buildNumber = packageInfo.buildNumber;

                showAboutDialog(
                  context: context,
                  applicationVersion: "Version: $version \nBuild: $buildNumber",
                  applicationIcon: Image.asset(
                    "assets/icons/logo-small.png",
                    scale: 3,
                  ),
                  applicationLegalese: "© 2021",
                );
              },
            ),
            MenuItemsWidget(
              text: 'Выход',
              iconSvgPath: 'assets/icons/log_out.svg',
              onTap: () {
                _profileBloc.add(GoOutEvent());
                SessionController.logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.MAIN, (route) => false);
              },
            ),
          ]),
        ),
      ],
    );
  }
}
