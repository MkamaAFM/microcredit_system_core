part of 'register_view_bloc.dart';

@immutable
abstract class RegisterViewState extends AuthViewState {
  final String confirmPassword;

  @override
  bool get canContinue =>
      passwordMatch && validPassword && validContactCredential;

  bool get passwordMatch => confirmPassword == password;

  const RegisterViewState(
      {required String password,
      required String contactCredential,
      required bool activeValidator,
      required bool showPassword,
      required this.confirmPassword})
      : super(
            password: password,
            contactCredential: contactCredential,
            activeValidator: activeValidator,
            showPassword: showPassword);

  RegisterViewState.copyWith(RegisterViewState state,
      {String? password,
      String? contactCredential,
      bool? activeValidator,
      bool? showPassword,
      String? confirmPassword})
      : confirmPassword = confirmPassword ?? state.confirmPassword,
        super(
          password: password ?? state.password,
          contactCredential: contactCredential ?? state.contactCredential,
          activeValidator: activeValidator ?? state.activeValidator,
          showPassword: showPassword ?? state.showPassword,
        );
}

//

class RegisterViewInitial extends RegisterViewState {
  const RegisterViewInitial()
      : super(
            password: '',
            confirmPassword: '',
            contactCredential: '',
            showPassword: false,
            activeValidator: false);

  RegisterViewInitial.withPreviousData(RegisterViewState state)
      : super.copyWith(state);
}

class Registered extends RegisterViewState {
  Registered(RegisterViewState state) : super.copyWith(state);
}

class RegisteringError extends RegisterViewState {
  final String error;
  RegisteringError(RegisterViewState state, this.error) : super.copyWith(state);
}

class Registering extends RegisterViewState {
  Registering(RegisterViewState state) : super.copyWith(state);
}

class ContactCredentialUpdated extends RegisterViewState {
  ContactCredentialUpdated(RegisterViewState state, String contactCredential)
      : super.copyWith(state, contactCredential: contactCredential);
}

class PasswordUpdated extends RegisterViewState {
  PasswordUpdated(RegisterViewState state, String password)
      : super.copyWith(state, password: password);
}

class ConfirmPasswordUpdated extends RegisterViewState {
  ConfirmPasswordUpdated(RegisterViewState state, String password)
      : super.copyWith(state, confirmPassword: password);
}

class PasswordVisisbilityChanged extends RegisterViewState {
  PasswordVisisbilityChanged(RegisterViewState state)
      : super.copyWith(state, showPassword: !state.showPassword);
}
