import 'package:creative_flutter/functions/functions.dart' as f;
import 'package:email_validator/email_validator.dart';
import 'package:microcredit_system_core/widgets/contact_credential_textfield.dart';

abstract class AuthViewState {
  final String password, contactCredential;
  final bool showPassword, activeValidator;

  const AuthViewState(
      {required this.password,
      required this.contactCredential,
      required this.showPassword,
      required this.activeValidator});

  ContactCredentialInputType get credentialInputType {
    if (f.validPhoneNumber(contactCredential)) {
      return ContactCredentialInputType.phone;
    } else if (EmailValidator.validate(contactCredential)) {
      return ContactCredentialInputType.email;
    } else {
      return ContactCredentialInputType.unknown;
    }
  }

  bool get validPassword => f.validPassword(password);
  bool get validContactCredential =>
      credentialInputType != ContactCredentialInputType.unknown;
  bool get canContinue;
}
