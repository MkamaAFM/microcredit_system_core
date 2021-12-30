import 'package:flutter/material.dart';
import 'creative_textfield.dart';

class ContactCredetentialTextField extends StatelessWidget {
  final ContactCredentialInputType inputType;
  final bool enabled, validContactCredential, activeValidator;
  final void Function(String) onChanged;
  const ContactCredetentialTextField(
      {Key? key,
      required this.inputType,
      required this.enabled,
      required this.validContactCredential,
      required this.activeValidator,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final String label;
    late final TextInputType keyboardType;
    late final IconData icon;
    //
    switch (inputType) {
      case ContactCredentialInputType.email:
        label = 'Email address';
        keyboardType = TextInputType.emailAddress;
        icon = Icons.alternate_email_rounded;
        break;
      case ContactCredentialInputType.phone:
        label = 'Phone number';
        keyboardType = TextInputType.phone;
        icon = Icons.contact_phone_outlined;
        break;
      case ContactCredentialInputType.unknown:
        label = 'Email or phone number';
        keyboardType = TextInputType.emailAddress;
        icon = Icons.person_outline_rounded;
        break;
    }
    //
    return CreativeTextField(
      label: label,
      enabled: enabled,
      keyboardType: keyboardType,
      prefixIcon: Icon(icon),
      activateValidation: activeValidator,
      validator: (text) =>
          validContactCredential ? null : 'Invalid email or phone number',
      onChanged: onChanged,
    );
  }
}

enum ContactCredentialInputType { email, phone, unknown }
