import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:microcredit_system_core/blocs/auth/auth_bloc.dart' as auth;
import 'package:microcredit_system_core/blocs/auth_view_blocs/auth_view_state.dart';

part 'register_view_event.dart';
part 'register_view_state.dart';

class RegisterViewBloc extends Bloc<RegisterViewEvent, RegisterViewState> {
  final auth.AuthBloc _authBloc;
  RegisterViewBloc(this._authBloc) : super(const RegisterViewInitial()) {
    _authBloc.stream.listen((event) => add(_AuthEvent()));
    //
    on<_AuthEvent>((event, emit) => _onAuthEvent(emit));
    on<WriteContactCredential>((event, emit) =>
        emit(ContactCredentialUpdated(state, event.contactCredential)));
    on<WritePassword>(
        (event, emit) => emit(PasswordUpdated(state, event.password)));
    on<WriteConfirmPassword>(
        (event, emit) => ConfirmPasswordUpdated(state, event.password));
    on<ChangePasswordVisibility>(
        (event, emit) => emit(PasswordVisisbilityChanged(state)));
  }

  void _onAuthEvent(Emitter<RegisterViewState> emit) {
    final authState = _authBloc.state;
    if (authState is auth.UserAvailable) {
      emit(Registered(state));
    } else if (authState is auth.AuthError) {
      emit(RegisteringError(state, authState.error));
    } else if (authState is auth.Registering || authState is auth.SigningIn) {
      emit(Registering(state));
    } else {
      emit(RegisterViewInitial.withPreviousData(state));
    }
  }
}
