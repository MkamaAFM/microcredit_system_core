import 'package:flutter/material.dart';

class CreativeTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffix, prefix, suffixIcon, prefixIcon;
  final String? label, hint, initialValue;
  final int minLines, maxLines;
  final bool obsecureText, activateValidation, autoFocus, readOnly, enabled;
  final String? Function(String? text)? validator;
  final void Function(String text)? onChanged, onFieldSubmitted;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  const CreativeTextField(
      {Key? key,
      this.controller,
      this.suffix,
      this.prefix,
      this.suffixIcon,
      this.prefixIcon,
      this.label,
      this.hint,
      this.initialValue,
      this.minLines = 1,
      this.maxLines = 2,
      this.readOnly = false,
      this.obsecureText = false,
      this.activateValidation = false,
      this.autoFocus = false,
      this.enabled = true,
      this.validator,
      this.onChanged,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autofocus: autoFocus,
      initialValue: controller == null ? initialValue : null,
      obscureText: obsecureText,
      minLines: minLines,
      readOnly: readOnly,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      autovalidateMode: (activateValidation && validator != null)
          ? AutovalidateMode.always
          : null,
      validator: validator,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffix: suffix,
          prefix: prefix,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder()),
    );
  }
}
