import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:ocean_hack/api/model/response.dart';
import 'package:ocean_hack/api/service/auth_service.dart';
import 'package:ocean_hack/logger/log_printer.dart';
import 'package:ocean_hack/model/user.dart';
import 'package:ocean_hack/utils/local_storage/constant.dart';
import 'package:ocean_hack/utils/local_storage/local_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Logger logger = getLogger('AuthBloc');

  AuthBloc() : super(AuthInitial()) {
    on<AuthInitialize>(_authInitial);
    on<AuthLogin>(_authLogin);
    on<AuthLogout>(_authLogout);
  }

  void _authInitial(AuthInitialize event, Emitter<AuthState> emit) async {
    logger.i('Initializing auth...');

    String? currentUser =
        await getItemFromLocalStorage(LocalStorageKey.authUser);

    if (currentUser != null) {
      emit(AuthLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      AuthUser user = AuthUser.fromJson(jsonDecode(currentUser));

      logger.i('Auth initialized: ${user.firstName} ${user.lastName}');
      emit(AuthLoginSuccess(user: user));
    } else {
      logger.i('Auth initialized: no user');
      emit(AuthInitial());
    }
  }

  void _authLogout(AuthLogout event, Emitter<AuthState> emit) async {
    String? currentUser =
        await getItemFromLocalStorage(LocalStorageKey.authUser);
    if (currentUser != null) {
      removeItemFromLocalStorage(LocalStorageKey.authUser);
    }
    emit(AuthLogoutSuccess());
  }

  void _authLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    String ic = event.formData['ic'];
    String password = event.formData['password'];

    Response response = await LoginService.login({
      'ic': ic,
      'password': password,
    });

    if (response.success ?? false) {
      String? currentUser =
          await getItemFromLocalStorage(LocalStorageKey.authUser);
      if (currentUser != null) {
        removeItemFromLocalStorage(LocalStorageKey.authUser);
      }
      storeItemInLocalStorage(LocalStorageKey.authUser, response.data!);
      AuthUser user = AuthUser.fromJson(response.data!);
      emit(AuthLoginSuccess(user: user));
    } else {
      emit(AuthError(message: response.message ?? "Something went wrong"));
      emit(AuthInitial());
    }
  }
}
