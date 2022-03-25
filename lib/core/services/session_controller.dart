import 'package:antares_market/core/index.dart';
import 'package:antares_market/core/services/app_preferences.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../injection_container.dart';

class SessionController {
  static AuthAccessLevel get accessLevel {
    final user = AppPreferences.user;
    if (user == null) return AuthAccessLevel.unauthorized;
    return user.emailIsConfirmed
        ? AuthAccessLevel.fullAccess
        : AuthAccessLevel.emailNotConfirmed;
  }

  static Future auth(UserInfoModel user) {
    return AppPreferences.setUser(user);
  }

  static void checkAccess({
    VoidCallback? unauthorized,
    VoidCallback? emailNotConfirmed,
    VoidCallback? fullAccess,
  }) {
    switch (accessLevel) {
      case AuthAccessLevel.unauthorized:
        unauthorized?.call();
        break;
      case AuthAccessLevel.emailNotConfirmed:
        emailNotConfirmed?.call();
        break;
      case AuthAccessLevel.fullAccess:
        fullAccess?.call();
        break;
    }
  }

  static void requestAccess({
    required AuthAccessLevel requiredLevel,
    VoidCallback? onSuccess,
    VoidCallback? onNotSuccess,
  }) {
    if (requiredLevel == AuthAccessLevel.unauthorized) {
      onSuccess?.call();
      return;
    }

    if (requiredLevel == AuthAccessLevel.emailNotConfirmed) {
      if (accessLevel == AuthAccessLevel.emailNotConfirmed ||
          accessLevel == AuthAccessLevel.fullAccess) {
        onSuccess?.call();
        return;
      }

      onNotSuccess?.call();
      Get.toNamed(AppRoutes.AUTH_PAGE);
      return;
    }

    if (requiredLevel == AuthAccessLevel.fullAccess) {
      if (requiredLevel == accessLevel) {
        onSuccess?.call();
        return;
      }
      onNotSuccess?.call();
      Get.toNamed(AppRoutes.AUTH_PAGE);
      return;
    }
  }

  static void checkAuthorization() async {
    // final Dal dal = getIt();
    // dal.authService
    //     .userUpdateDataRequest(
    //       cancelToken: CancelToken(),
    //     )
    //     .then(
    //       (value) => value.fold(
    //         (failure) {
    //           SessionController.logout();
    //         },
    //         (userUpdatedData) {
    //           SessionController.auth(userUpdatedData);
    //         },
    //       ),
    //     );

    getIt<Dal>()
        .authService
        .userUpdateDataRequest(cancelToken: CancelToken())
        .then(
          (value) => value.fold(
            (failure) {
              if (failure is ApiFailure && failure.errors == 'Unauthorized') {
                SessionController.logout();
              }
            },
            (userUpdatedData) => SessionController.auth(userUpdatedData),
          ),
        );
  }

  static Future resetAuth() async {
    await AppPreferences.setUser(null);
  }

  static Future logout() async {
    await resetAuth();
    MessageBus().send(LogoutEvent());
  }
}

enum AuthAccessLevel {
  unauthorized,
  emailNotConfirmed,
  fullAccess,
}
