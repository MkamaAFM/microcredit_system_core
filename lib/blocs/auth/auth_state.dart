part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class SigningIn extends AuthState {}

class Registering extends AuthState {}

class SigningOut extends AuthState {}

class SignedOut extends AuthState {}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}

class UserAvailable extends AuthState {
  final AppUser user;
  UserAvailable(this.user);
  bool get belongToOrganization => user.oid.isNotEmpty;
}
