import 'package:flutter/material.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/enums/fitler_period_enum.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/domain/provider_model.dart';
import '../../../../core/utils/date_filter_utils.dart';
import '../widgets/providers_list_view.dart';

class MyProviderView extends StatefulWidget {
  const MyProviderView({super.key});

  @override
  State<MyProviderView> createState() => _MyProviderViewState();
}

class _MyProviderViewState extends State<MyProviderView> {
  FilterPeriod selectedPeriod = FilterPeriod.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: "مقدمي الخدمة الخاصة بي"),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _buildFilterChip("الكل", FilterPeriod.all),
                const SizedBox(width: 8),
                _buildFilterChip("اليوم", FilterPeriod.day),
                const SizedBox(width: 8),
                _buildFilterChip("هذا الأسبوع", FilterPeriod.week),
                const SizedBox(width: 8),
                _buildFilterChip("هذا الشهر", FilterPeriod.month),
              ],
            ),
          ),
          Expanded(child: ProvidersListView(providers: filteredProviders)),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, FilterPeriod period) {
    final isSelected = selectedPeriod == period;
    final count = _getCountForPeriod(period);

    return ChoiceChip(
      label: Text('$label ($count)'),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            selectedPeriod = period;
          });
        }
      },
      selectedColor: AppColors.primaryColor,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
        ),
      ),
    );
  }

  List<ProviderModel> get filteredProviders {
    return dummyProviders.where((provider) {
      if (provider.createdAt == null) return selectedPeriod == FilterPeriod.all;

      switch (selectedPeriod) {
        case FilterPeriod.all:
          return true;
        case FilterPeriod.day:
          return DateFilterUtils.isToday(provider.createdAt!);
        case FilterPeriod.week:
          return DateFilterUtils.isThisWeek(provider.createdAt!);
        case FilterPeriod.month:
          return DateFilterUtils.isThisMonth(provider.createdAt!);
      }
    }).toList();
  }

  int _getCountForPeriod(FilterPeriod period) {
    return dummyProviders.where((provider) {
      if (provider.createdAt == null) return period == FilterPeriod.all;

      switch (period) {
        case FilterPeriod.all:
          return true;
        case FilterPeriod.day:
          return DateFilterUtils.isToday(provider.createdAt!);
        case FilterPeriod.week:
          return DateFilterUtils.isThisWeek(provider.createdAt!);
        case FilterPeriod.month:
          return DateFilterUtils.isThisMonth(provider.createdAt!);
      }
    }).length;
  }
}
