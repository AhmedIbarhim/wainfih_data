part of 'my_providers_cubit.dart';

sealed class MyProvidersState extends Equatable {
  const MyProvidersState();

  @override
  List<Object> get props => [];
}

final class MyProvidersInitial extends MyProvidersState {}

final class MyProvidersLoading extends MyProvidersState {}

final class MyProvidersError extends MyProvidersState {
  final String message;

  const MyProvidersError({required this.message});

  @override
  List<Object> get props => [message];
}
