
import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entinties/user.dart';
import 'package:blog_app/features/auth/domain/useCases/current_user.dart';
import 'package:blog_app/features/auth/domain/useCases/user_login.dart';
import 'package:blog_app/features/auth/domain/useCases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required CurrentUser currentUser,
    required UserLogin userLogin,
    required UserSignUp userSignUp,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
          on<AuthEvent>((_,emit)=>emit(AuthLoaing()));
    on<AuthLogin>(_onAuthlogin);
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }
  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
   

    final response = await _userSignUp.call(
      UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );

    response.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => _emitAuthSuccess(r, emit));
    
  }

  void _onAuthlogin(AuthLogin event, Emitter<AuthState> emit) async {
    
    final res = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold((l) => emit(AuthFailure(message: l.message)),
        (r) => _emitAuthSuccess(r, emit));
  }

  void _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) {
        _emitAuthSuccess(r, emit);
      },
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
