part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final String email;
  final String password;
  final bool isLoading;
  final String? errMessage;
  final bool isSuccess;
  const SignupState({
    required this.email,
    required this.password,
    required this.isLoading,
    required this.isSuccess,
    this.errMessage,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      isLoading: false,
      errMessage: null,
      isSuccess: false,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    String? errMessage,
    bool? isSuccess,
  }) {
    return SignupState(
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
