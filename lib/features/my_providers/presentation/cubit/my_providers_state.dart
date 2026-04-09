import 'package:equatable/equatable.dart';
import '../../data/models/provider_list_model.dart';

class MyProvidersState extends Equatable {
  final List<ProviderListModel> providers;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? activeFilter;
  final String? error;

  const MyProvidersState({
    this.providers = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 1,
    this.activeFilter,
    this.error,
  });

  MyProvidersState copyWith({
    List<ProviderListModel>? providers,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? activeFilter,
    String? error,
  }) {
    return MyProvidersState(
      providers: providers ?? this.providers,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      activeFilter: activeFilter,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        providers,
        isLoading,
        hasMore,
        currentPage,
        activeFilter,
        error,
      ];
}
