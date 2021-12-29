import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microcredit_system_core/blocs/login_view/login_view_bloc.dart';
import 'creative_textfield.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginViewBloc>(context);
    return BlocBuilder<LoginViewBloc, LoginViewState>(
        builder: (context, state) {
      final inactive = (state is LoggingIn || state.isPhoneNumber);
      return CreativeTextField(
        initialValue: state.password,
        label: 'Password',
        enabled: !inactive,
        keyboardType: TextInputType.visiblePassword,
        obsecureText: !state.showPassword,
        activateValidation: state.activeValidator,
        validator: (text) => state.validPassword ? null : 'Invalid password',
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        onChanged: (text) => bloc.add(WritePassword(text)),
        suffix: IconButton(
          icon: Icon(state.showPassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined),
          onPressed:
              inactive ? null : () => bloc.add(ChangePasswordVisibility()),
        ),
        maxLines: 1,
      );
    });
  }
}
