part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isLoading;
  final String? errMessage;
  final bool isSuccess;
  const LoginState({
    required this.email,
    required this.password,
    required this.isLoading,
    required this.isSuccess,
    this.errMessage,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      isLoading: false,
      errMessage: null,
      isSuccess: false,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    String? errMessage,
    bool? isSuccess,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isLoading,
    errMessage,
    isSuccess,
  ];
}
