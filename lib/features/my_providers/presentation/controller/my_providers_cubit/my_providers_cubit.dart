import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_providers_state.dart';

class MyProvidersCubit extends Cubit<MyProvidersState> {
  MyProvidersCubit() : super(MyProvidersInitial());
}
