import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/auth/data/models/user_model.dart';
import 'package:nawel/features/auth/domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errMessage: null, isSuccess: false));
      final result = await locator.get<LoginUseCase>().call(
        params: UserModel(email: event.email, password: event.password),
      );

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, errMessage: failure));
        },
        (message) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
        },
      );
    });
    on<LoginReset>((event, emit) {
      emit(LoginState.initial());
    });
  }
}
