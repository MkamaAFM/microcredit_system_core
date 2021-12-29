import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microcredit_system_core/blocs/login_view/login_view_bloc.dart';

import 'creative_textfield.dart';


class ContactsCredetentialTextField extends StatelessWidget {
  const ContactsCredetentialTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginViewBloc>(context);
    return BlocBuilder<LoginViewBloc, LoginViewState>(
      builder: (context, state) {
        //
        late final String label;
        late final TextInputType keyboardType;
        late final IconData icon;
        //
        if (state.isEmailAddress) {
          label = 'Email address';
          keyboardType = TextInputType.emailAddress;
          icon = Icons.alternate_email_rounded;
        } else if (state.isPhoneNumber) {
          label = 'Phone number';
          keyboardType = TextInputType.phone;
          icon = Icons.contact_phone_outlined;
        } else {
          label = 'Email or phone number';
          keyboardType = TextInputType.emailAddress;
          icon = Icons.person_outline_rounded;
        }

        //
        return CreativeTextField(
          label: label,
          enabled: state is! LoggingIn,
          keyboardType: keyboardType,
          prefixIcon: Icon(icon),
          activateValidation: state.activeValidator,
          validator: (text) => state.validContactCredential
              ? null
              : 'Invalid email or phone number',
          onChanged: (text) => bloc.add(WriteContactCredential(text)),
        );
      },
    );
  }
}
