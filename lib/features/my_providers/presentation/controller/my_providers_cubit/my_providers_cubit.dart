import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../adding_new_provider/domain/provider_model.dart';

part 'my_providers_state.dart';

class MyProvidersCubit extends Cubit<MyProvidersState> {
  MyProvidersCubit() : super(MyProvidersInitial());
}
