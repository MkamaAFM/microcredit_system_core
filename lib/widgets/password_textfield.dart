import 'package:flutter/material.dart';
import 'creative_textfield.dart';

class PasswordTextField extends StatelessWidget {
  final void Function() changePasswordVisibility;
  final void Function(String) onChanged;
  final bool enabled,
      obsecureText,
      activeValidator,
      validPassword,
      showPassword;
  final String initialValue, label, validatorText;
  const PasswordTextField({
    Key? key,
    required this.changePasswordVisibility,
    required this.onChanged,
    required this.enabled,
    required this.obsecureText,
    required this.activeValidator,
    required this.validPassword,
    required this.showPassword,
    required this.initialValue,
    required this.label,
    required this.validatorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreativeTextField(
      initialValue: initialValue,
      label: label, //password
      enabled: enabled,
      keyboardType: TextInputType.visiblePassword,
      obsecureText: obsecureText,
      activateValidation: activeValidator,
      validator: (text) =>
          validPassword ? null : validatorText, //Invalid password
      prefixIcon: const Icon(Icons.lock_outline_rounded),
      onChanged: (text) => onChanged,
      suffix: IconButton(
        icon: Icon(showPassword
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined),
        onPressed: !enabled ? null : () => changePasswordVisibility,
      ),
      maxLines: 1,
    );
  }
}
