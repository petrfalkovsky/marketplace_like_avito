import 'dart:ui';

import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class LoginPanelPage extends StatefulWidget {
  const LoginPanelPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPanelPageState createState() => _LoginPanelPageState();
}

class _LoginPanelPageState extends State<LoginPanelPage>
    with CancelMixin, StateUtilsMixin {
  late LoginBloc _loginBloc;
  late GlobalKey<FormState> _registerFormKey;
  late GlobalKey<FormState> _loginFormKey;
  late GlobalKey<FormState> _recoveryFormKey;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    SessionController.checkAccess(
      unauthorized: () => _loginBloc.add(GoToLoginEvent()),
      emailNotConfirmed: () => _loginBloc.add(ConfirmEmailEvent()),
    );

    _registerFormKey = GlobalKey<FormState>();
    _loginFormKey = GlobalKey<FormState>();
    _recoveryFormKey = GlobalKey<FormState>();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    cancel();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  void _clearControllers() {
    _lastNameController.text = '';
    _firstNameController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _rePasswordController.text = '';
  }

  //////
  /// UI
  //////
  @override
  Widget build(BuildContext context) {
    return PageBackground(
      colored: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: _content(),
      ),
    );
  }

  Widget _content() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            ScreenUtil().setWidth(30),
          ),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: ScreenUtil().setWidth(20),
            color: mainOpacityColor,
          ),
        ],
      ),
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(16),
        top: ScreenUtil().setHeight(48),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            CancelButtonLogo().padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setWidth(24),
                right: ScreenUtil().setWidth(16),
              ),
            ),
            FillBodyWidget(
              scrollPadding: EdgeInsets.only(
                left: ScreenUtil().setWidth(16),
                right: ScreenUtil().setWidth(32),
              ),
              child: _body(),
            ).expanded(),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (context, state) {
        switch (state.status) {
          case LoginStatus.login:
            return _loginStack(loginState: state);
          case LoginStatus.register:
            return _registerStack(loginState: state);
          case LoginStatus.recovery:
            return _recoveryStack(loginState: state);
          case LoginStatus.confirmEmail:
            return _confirmEmailStack();
          case LoginStatus.recoveryEmail:
            return _recoveryEmailStack();
          default:
            return Container(
              child: Center(
                child: AntProgressIndicator(),
              ),
            );
        }
      },
    );
  }

  Widget _alertButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Не зарегистрированы?'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: () {
                unfocusCurrent();
                _loginBloc.add(GoToRegisterEvent());
              },
              style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              child: Text(
                'Регистрация'.tr(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: mainFlatColor,
                ),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            unfocusCurrent();

            _loginBloc.add(GoToRecoveryEvent());
          },
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Забыли пароль?'.tr(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: mainFlatColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _registerStack({required LoginState loginState}) {
    return Column(
      children: [
        LoginMottoWidget(),
        RegisterStateWidget(
          registerFormKey: _registerFormKey,
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
          emailController: _emailController,
          passwordController: _passwordController,
          rePasswordController: _rePasswordController,
          onPressed: () {
            unfocusCurrent();
            _loginBloc.add(
              RegisterAttemptEvent(
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                email: _emailController.text,
                password: _passwordController.text,
                rePassword: _rePasswordController.text,
                cancelToken: cancel(),
              ),
            );
          },
        ),
        Spacer(),
        SizedBox(height: 20),
        GoLoginButton(
          onPressed: () {
            unfocusCurrent();
            _loginBloc.add(GoToLoginEvent());
          },
        ),
        SizedBox(height: 70),
      ],
    );
  }

  Widget _loginStack({required LoginState loginState}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoginMottoWidget(),
        LoginStateWidget(
          loginFormKey: _loginFormKey,
          emailController: _emailController,
          passwordController: _passwordController,
          onPressed: () {
            unfocusCurrent();
            _loginBloc.add(LoginAttemptEvent(
              email: _emailController.text,
              password: _passwordController.text,
              cancelToken: cancel(),
            ));
          },
        ),
        Spacer(),
        SizedBox(height: 20),
        _alertButtons(),
        SizedBox(height: 70),
      ],
    );
  }

  Widget _recoveryStack({required LoginState loginState}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoginMottoWidget(),
            RecoveryStateWidget(
              recoveryFormKey: _recoveryFormKey,
              emailController: _emailController,
              onPressed: () {
                unfocusCurrent();
                _loginBloc.add(RecoveryAttemptEvent(
                  email: _emailController.text,
                  cancelToken: cancel(),
                ));
              },
            ),
          ],
        ),
        Spacer(),
        SizedBox(height: 20),
        GoLoginButton(
          onPressed: () {
            unfocusCurrent();
            _loginBloc.add(GoToLoginEvent());
          },
        ),
        SizedBox(height: 70),
      ],
    );
  }

  Column _confirmEmailStack() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LoginMottoWidget(),
        RegisterSuccessStateWidget(
          onPressed: () {
            Get.back();
          },
          buttonText: 'На главную',
        ),
        Spacer(),
        _resendEmailButtons(
          onPressed: () {
            if (_emailController.text.isEmpty) {
              print('isEmpty');
              final user = AppPreferences.user;
              if (user != null) {
                _loginBloc.add(
                  ResendEmailEvent(
                    email: user.email,
                    cancelToken: cancel(),
                  ),
                );
              }
            } else {
              _loginBloc.add(
                RecoveryAttemptEvent(
                  email: _emailController.text,
                  cancelToken: cancel(),
                ),
              );
            }
          },
        ),
        SizedBox(height: 70),
      ],
    );
  }

  Column _recoveryEmailStack() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LoginMottoWidget(),
        PasswordRecoveryStateWidget(
          onPressed: () {
            Get.back();
          },
          buttonText: 'На главную',
        ),
        Spacer(),
        _resendEmailButtons(
          onPressed: () {
            _loginBloc.add(RecoveryAttemptEvent(
              email: _emailController.text,
              cancelToken: cancel(),
            ));
          },
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

Widget _resendEmailButtons({required void Function()? onPressed}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'Не пришло письмо?'.tr(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          'Выслать письмо повторно'.tr(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: mainFlatColor,
          ),
        ),
      ),
    ],
  );
}
