part of 'my_providers_cubit.dart';

sealed class MyProvidersState extends Equatable {
  const MyProvidersState();

  @override
  List<Object> get props => [];
}

final class MyProvidersInitial extends MyProvidersState {}
