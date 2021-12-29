import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:microcredit_system_core/objects/user.dart';
import 'package:microcredit_system_core/repos/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(SigningIn()) {
    _authRepo.userState().listen((user) {
      if (user != null) {
        add(_AutoSignInEvent(user));
      } else {
        add(_NoUserAvailableEvent());
      }
    });
    on<_NoUserAvailableEvent>((event, emit) => emit(SignedOut()));
    on<_AutoSignInEvent>((event, emit) => emit(UserAvailable(event.user)));
    on<EmailSignInEvent>(
        (event, emit) async => await _emailSignIn(event, emit));
    on<PhoneSignInEvent>((event, emit) =>
        emit(AuthError('Phone number signin has not been implemented yet')));
    on<SignOutEvent>((event, emit) async => await _signOut(emit));
    on<RegisterUsingEmailEvent>(
        (event, emit) async => await _emailRegister(event, emit));
  }

  Future<void> _emailSignIn(
      EmailSignInEvent event, Emitter<AuthState> emit) async {
    emit(SigningIn()); //TODO:try to remove this
    await _authRepo.auth
        .signInWithEmailAndPassword(
            email: event.email, password: event.password)
        .catchError((error) {
      emit(AuthError(error.toString()));
    });
  }

  Future<void> _emailRegister(
      RegisterUsingEmailEvent event, Emitter<AuthState> emit) async {
    emit(Registering());
    _authRepo
        .createUserWithEmail(
            email: event.email, password: event.password, name: event.name)
        .catchError((error) {
      emit(AuthError(error.toString()));
    });
  }

  Future<void> _signOut(Emitter<AuthState> emit) async {
    emit(SigningOut());
    await _authRepo.auth.signOut().catchError((error) {
      emit(AuthError(error.toString()));
    });
  }
}
