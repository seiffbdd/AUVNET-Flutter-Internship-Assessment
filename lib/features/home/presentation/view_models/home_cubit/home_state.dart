part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? errMessage;
  final bool isSuccess;
  final List<ServiceModel> services;
  const HomeState({
    required this.isSuccess,
    required this.isLoading,
    this.errMessage,
    required this.services,
  });

  factory HomeState.initial() {
    return const HomeState(
      isLoading: false,
      errMessage: null,
      isSuccess: false,
      services: [],
    );
  }

  HomeState copyWith({
    bool? isLoading,
    String? errMessage,
    bool? isSuccess,
    List<ServiceModel>? services,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      services: services ?? this.services,
    );
  }

  @override
  List<Object?> get props => [isLoading, errMessage, isSuccess, services];
}
