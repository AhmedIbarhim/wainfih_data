import '../../../../core/enums/fitler_period_enum.dart';
import '../../../../core/utils/date_filter_utils.dart';
import '../../data/models/provider_list_model.dart';

List<ProviderListModel> filterProvidersByPeriod(
  List<ProviderListModel> providers,
  FilterPeriod period,
) {
  if (period == FilterPeriod.all) {
    return providers;
  }

  return providers.where((provider) {
    final createdAt = provider.createdAt;
    if (createdAt == null) return false;

    switch (period) {
      case FilterPeriod.day:
        return DateFilterUtils.isToday(createdAt);
      case FilterPeriod.week:
        return DateFilterUtils.isThisWeek(createdAt);
      case FilterPeriod.month:
        return DateFilterUtils.isThisMonth(createdAt);
      case FilterPeriod.all:
        return true;
    }
  }).toList();
}
