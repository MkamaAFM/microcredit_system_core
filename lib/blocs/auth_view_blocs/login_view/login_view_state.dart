part of 'login_view_bloc.dart';

@immutable
abstract class LoginViewState extends AuthViewState {
  const LoginViewState(
      {required String password,
      required String contactCredential,
      required bool showPassword,
      required bool activeValidator})
      : super(
            password: password,
            contactCredential: contactCredential,
            showPassword: showPassword,
            activeValidator: activeValidator);

  @override
  bool get canContinue =>
      (credentialInputType == ContactCredentialInputType.email &&
          validPassword) ||
      credentialInputType == ContactCredentialInputType.phone;

  LoginViewState.copyWith(LoginViewState state,
      {String? password,
      String? contactCredential,
      bool? showPassword,
      bool? activeValidator})
      : super(
            password: password ?? state.password,
            contactCredential: contactCredential ?? state.contactCredential,
            showPassword: showPassword ?? state.showPassword,
            activeValidator: activeValidator ?? state.activeValidator);
}

class InitialState extends LoginViewState {
  const InitialState()
      : super(
            activeValidator: false,
            password: '',
            showPassword: false,
            contactCredential: '');
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
