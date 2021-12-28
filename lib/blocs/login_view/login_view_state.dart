part of 'login_view_bloc.dart';

@immutable
abstract class LoginViewState {
  final String password, contactCredential;
  final bool showPassword, activeValidator;
  bool get isEmailAddress => EmailValidator.validate(contactCredential);
  bool get isPhoneNumber => validPhoneNumber(contactCredential);
  bool get validPassword => f.validPassword(password);
  bool get validContactCredential => isEmailAddress || isPhoneNumber;
  bool get canLogin => (isEmailAddress && validPassword) || isPhoneNumber;
  const LoginViewState.initial()
      : password = '',
        contactCredential = '',
        showPassword = false,
        activeValidator = false;

  LoginViewState.copyWith(LoginViewState state,
      {String? password,
      String? contactCredential,
      bool? showPassword,
      bool? loggingIn,
      bool? activeValidator,
      bool? activeButtons})
      : password = password ?? state.password,
        contactCredential = contactCredential ?? state.contactCredential,
        showPassword = showPassword ?? state.showPassword,
        activeValidator = activeValidator ?? state.activeValidator;
}

class InitialState extends LoginViewState {
  const InitialState() : super.initial();
}

class PasswordUpdated extends LoginViewState {
  PasswordUpdated(LoginViewState state, String password)
      : super.copyWith(state, password: password);
}

class ContactCredentialUpdated extends LoginViewState {
  ContactCredentialUpdated(LoginViewState state, String contactCredential)
      : super.copyWith(state, contactCredential: contactCredential);
}

class PasswordVisibilityUpdated extends LoginViewState {
  PasswordVisibilityUpdated(LoginViewState state)
      : super.copyWith(state, showPassword: !state.showPassword);
}

class LoggingIn extends LoginViewState {
  LoggingIn(LoginViewState state) : super.copyWith(state);
}

class LoggedIn extends LoginViewState {
  LoggedIn(LoginViewState state) : super.copyWith(state);
}

class LoginError extends LoginViewState {
  final String error;
  LoginError(LoginViewState state, this.error) : super.copyWith(state);
}

class InvalidCredentials extends LoginViewState {
  InvalidCredentials(LoginViewState state)
      : super.copyWith(state, activeValidator: true);
}
