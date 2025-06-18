part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class UserAutenticated extends SplashState {}

final class UserNotAutenticated extends SplashState {}

final class OnboardingNotFinished extends SplashState {}
