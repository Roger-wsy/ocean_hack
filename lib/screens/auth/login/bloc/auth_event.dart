part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialize extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final Map<String, dynamic> formData;

  const AuthLogin({
    required this.formData,
  });

  @override
  List<Object> get props => [formData];
}

class AuthLogout extends AuthEvent {}
