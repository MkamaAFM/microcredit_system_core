import 'package:creative_flutter/functions/functions.dart' as f;
import 'package:email_validator/email_validator.dart';

abstract class AuthViewState {
  final String password, contactCredential;
  final bool showPassword, activeValidator;

  const AuthViewState(
      {required this.password,
      required this.contactCredential,
      required this.showPassword,
      required this.activeValidator});
  bool get isEmailAddress => EmailValidator.validate(contactCredential);
  bool get isPhoneNumber => f.validPhoneNumber(contactCredential);
  bool get validPassword => f.validPassword(password);
  bool get validContactCredential => isEmailAddress || isPhoneNumber;
  bool get canContinue;
}
