part of 'login_view_bloc.dart';

@immutable
abstract class LoginViewEvent {}

class _AuthEvent extends LoginViewEvent{}

class ChangePasswordVisibility extends LoginViewEvent {}

class WritePassword extends LoginViewEvent {
  final String password;
  WritePassword(this.password);
}

class WriteContactCredential extends LoginViewEvent {
  final String contactCredential;
  WriteContactCredential(this.contactCredential);
}

class LoginAttempt extends LoginViewEvent {}
