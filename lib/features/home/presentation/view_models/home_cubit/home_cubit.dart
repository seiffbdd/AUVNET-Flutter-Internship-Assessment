import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/home/data/models/service_model.dart';
import 'package:nawel/features/home/domain/use_cases/fetch_services_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  Future<void> fetchServices() async {
    emit(state.copyWith(isLoading: true, errMessage: null, isSuccess: false));
    final result = await locator.get<FetchServicesUseCase>().call();
    result.fold(
      (failure) {
        log(failure);
        emit(state.copyWith(isLoading: false, errMessage: failure));
      },
      (services) {
        emit(
          state.copyWith(isLoading: false, isSuccess: true, services: services),
        );
      },
    );
  }
}
