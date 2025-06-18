import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/core/storage/shared_prefs_helper.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/splash/domain/use_cases/listen_to_auth_changes_use_case.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> startAuthListen() async {
    Future.delayed(const Duration(seconds: 2), () {
      if (!locator.get<SharedPrefsHelper>().isOnboardingCompleted()) {
        emit(OnboardingNotFinished());
      } else {
        locator.get<ListenToAuthChangesUseCase>().call().listen((User? user) {
          if (user == null) {
            emit(UserNotAutenticated());
          } else {
            emit(UserAutenticated());
          }
        });
      }
    });
  }
}
