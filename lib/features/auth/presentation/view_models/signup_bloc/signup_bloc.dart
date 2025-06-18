import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/auth/data/models/user_model.dart';
import 'package:nawel/features/auth/domain/use_cases/signup_use_case.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState.initial()) {
    on<SignupSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errMessage: null, isSuccess: false));
      final result = await locator.get<SignupUseCase>().call(
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
    on<SignupReset>((event, emit) {
      emit(SignupState.initial());
    });
  }
}
