import 'package:flutter/material.dart';
import 'package:microcredit_system_core/blocs/login_view/login_view_bloc.dart';
import '../../microcredit_system_core.dart';
import '../in_button_progress_indicator.dart';
part 'desktop.dart';
part 'mobile.dart';

class LoginButtons extends StatelessWidget {
  final void Function() registerRouteFunction;
  const LoginButtons({Key? key, required this.registerRouteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginViewBloc>(context);
    return BlocBuilder<LoginViewBloc, LoginViewState>(
        builder: (context, state) {
      void Function()? login, resetPassword, register;

      final String loginButtonText = state is LoggingIn
          ? 'Please wait...'
          : state is LoginError
              ? 'Retry'
              : 'Login';
      final Widget loginButtonIcon = state is LoggingIn
          ? const InButtonProgressIndicator()
          : const Icon(Icons.login_rounded);

      if (!(state is LoggingIn || state is LoggedIn)) {
        login = () => bloc.add(LoginAttempt());
        register = registerRouteFunction;
        resetPassword = () => {};
      }

      return CreativeResponsiveWidget(
          desktop: _Desktop(
            loginButtonText: loginButtonText,
            loginButtonIcon: loginButtonIcon,
            login: login,
            register: register,
            resetPassword: resetPassword,
          ),
          mobile: _Mobile(
            loginButtonText: loginButtonText,
            loginButtonIcon: loginButtonIcon,
            login: login,
            register: register,
            resetPassword: resetPassword,
          ));
    });
  }
}

//
//

abstract class _LoginButtons extends StatelessWidget {
  final void Function()? login, resetPassword, register;
  final String loginButtonText;
  final Widget loginButtonIcon;
  const _LoginButtons(
      {Key? key,
      this.login,
      this.register,
      this.resetPassword,
      required this.loginButtonText,
      required this.loginButtonIcon})
      : super(key: key);
}
