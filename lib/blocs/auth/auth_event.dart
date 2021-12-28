part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class _NoUserAvailableEvent extends AuthEvent {}

class _AutoSignInEvent extends AuthEvent {
  final AppUser user;
  _AutoSignInEvent(this.user);
}

class EmailSignInEvent extends AuthEvent {
  final String email, password;
  EmailSignInEvent(this.email, this.password);
}

class PhoneSignInEvent extends AuthEvent {
  final String phoneNumber;
  PhoneSignInEvent(this.phoneNumber);
}

class SignOutEvent extends AuthEvent {}
//

class RegisterUsingEmailEvent extends AuthEvent {
  final String email, password, name;
  RegisterUsingEmailEvent(this.email, this.password, this.name);
}
