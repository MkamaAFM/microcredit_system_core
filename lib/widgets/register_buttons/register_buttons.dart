import 'package:flutter/material.dart';
import 'package:microcredit_system_core/blocs/auth_view_blocs/register_view/register_view_bloc.dart';
import '../../../microcredit_system_core.dart';
part 'desktop.dart';
part 'mobile.dart';

class RegisterButtons extends StatelessWidget {
  final void Function() registerRouteFunction;
  const RegisterButtons({Key? key, required this.registerRouteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RegisterViewBloc>(context);
    return BlocBuilder<RegisterViewBloc, RegisterViewState>(
        builder: (context, state) {
      void Function()? login, register;

      final String registerButtonText = state is Registering
          ? 'Please wait...'
          : state is RegisteringError
              ? 'Retry'
              : 'Register';
      final Widget registerButtonIcon = state is Registering
          ? const InButtonProgressIndicator()
          : const Icon(Icons.login_rounded);

      if (state is! Registering) {
        login = () => bloc.add(RegisterAttempt());
        register = registerRouteFunction;
      }

      return CreativeResponsiveWidget(
          desktop: _Desktop(
            registerButtonText: registerButtonText,
            registerButtonIcon: registerButtonIcon,
            login: login,
            register: register,
          ),
          mobile: _Mobile(
            registerButtonText: registerButtonText,
            registerButtonIcon: registerButtonIcon,
            login: login,
            register: register,
          ));
    });
  }
}

//
//

abstract class _RegisterButtons extends StatelessWidget {
  final void Function()? login, register;
  final String registerButtonText;
  final Widget registerButtonIcon;
  const _RegisterButtons(
      {Key? key,
      this.login,
      this.register,
      required this.registerButtonText,
      required this.registerButtonIcon})
      : super(key: key);
}
