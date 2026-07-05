import 'package:equatable/equatable.dart';
import '../../../../core/enums/fitler_period_enum.dart';
import '../../data/models/provider_list_model.dart';

class MyProvidersState extends Equatable {
  final List<ProviderListModel> providers;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? activeFilter;
  final FilterPeriod activePeriod;
  final String? error;

  const MyProvidersState({
    this.providers = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 1,
    this.activeFilter,
    this.activePeriod = FilterPeriod.all,
    this.error,
  });

  MyProvidersState copyWith({
    List<ProviderListModel>? providers,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? activeFilter,
    FilterPeriod? activePeriod,
    String? error,
  }) {
    return MyProvidersState(
      providers: providers ?? this.providers,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      activeFilter: activeFilter ?? this.activeFilter,
      activePeriod: activePeriod ?? this.activePeriod,
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
        activePeriod,
        error,
      ];
}
