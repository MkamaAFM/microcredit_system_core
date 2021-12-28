import 'package:creative_theme/theme_state/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:microcredit_system_core/blocs/auth/auth_bloc.dart';
import 'package:microcredit_system_core/blocs/login_view/login_view_bloc.dart';
import 'package:microcredit_system_core/microcredit_system_core.dart';
import 'package:microcredit_system_core/repos/auth.dart';
import 'package:microcredit_system_core/themes/themes.dart';

class InitializeBlocs extends StatelessWidget {
  final Widget child;
  const InitializeBlocs({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AuthBloc(RepositoryProvider.of<AuthRepo>(context))),
        BlocProvider(
            create: (context) =>
                LoginViewBloc(BlocProvider.of<AuthBloc>(context))),
        BlocProvider(create: (context) => ThemeBloc(themes))
      ],
      child: child,
    );
  }
}
