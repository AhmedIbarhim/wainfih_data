import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_providers_state.dart';

// Legacy cubit — superseded by presentation/cubit/my_providers_cubit.dart
class MyProvidersCubit extends Cubit<MyProvidersState> {
  MyProvidersCubit() : super(MyProvidersInitial());
}
