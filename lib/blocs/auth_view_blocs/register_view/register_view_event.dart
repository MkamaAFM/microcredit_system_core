part of 'register_view_bloc.dart';

@immutable
abstract class RegisterViewEvent {}

class _AuthEvent extends RegisterViewEvent {}

class WriteContactCredential extends RegisterViewEvent {
  final String contactCredential;
  WriteContactCredential(this.contactCredential);
}

class WritePassword extends RegisterViewEvent {
  final String password;
  WritePassword(this.password);
}

class WriteConfirmPassword extends RegisterViewEvent {
  final String password;
  WriteConfirmPassword(this.password);
}

class ChangePasswordVisibility extends RegisterViewEvent{}

class RegisterAttempt extends RegisterViewEvent{}
