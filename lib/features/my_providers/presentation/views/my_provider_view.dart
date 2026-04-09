import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/route/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/provider_list_model.dart';
import '../cubit/my_providers_cubit.dart';
import '../cubit/my_providers_state.dart';
import '../widgets/request_status_widget.dart';

class MyProviderView extends StatefulWidget {
  const MyProviderView({super.key});

  @override
  State<MyProviderView> createState() => _MyProviderViewState();
}

class _MyProviderViewState extends State<MyProviderView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<MyProvidersCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);

    return Scaffold(
      appBar: buildCustomAppBar(context, title: l.myProvidersTitle),
      body: Column(
        children: [
          _buildFilterChips(context, l),
          Expanded(
            child: BlocBuilder<MyProvidersCubit, MyProvidersState>(
              builder: (context, state) {
                if (state.isLoading && state.providers.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.error != null && state.providers.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.error!, style: AppTextStyles.regular13),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () =>
                              context.read<MyProvidersCubit>().refresh(),
                          child: Text(l.retryButton),
                        ),
                      ],
                    ),
                  );
                }

                if (state.providers.isEmpty) {
                  return Center(
                    child: Text(
                      l.noProviders,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => context.read<MyProvidersCubit>().refresh(),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: state.providers.length + (state.hasMore ? 1 : 0),
                    padding: const EdgeInsets.only(bottom: 16),
                    itemBuilder: (_, index) {
                      if (index >= state.providers.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      return _ProviderCard(
                        provider: state.providers[index],
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.providerDetail,
                            arguments: state.providers[index],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context, S l) {
    return BlocBuilder<MyProvidersCubit, MyProvidersState>(
      buildWhen: (prev, curr) => prev.activeFilter != curr.activeFilter,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              _buildChip(context, l.filterAll, null, state.activeFilter),
              const SizedBox(width: 8),
              _buildChip(
                  context, l.filterPending, 'PENDING', state.activeFilter),
              const SizedBox(width: 8),
              _buildChip(
                  context, l.filterApproved, 'APPROVED', state.activeFilter),
              const SizedBox(width: 8),
              _buildChip(
                  context, l.filterDeclined, 'DECLINED', state.activeFilter),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChip(
    BuildContext context,
    String label,
    String? filterValue,
    String? activeFilter,
  ) {
    final isSelected = activeFilter == filterValue;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => context.read<MyProvidersCubit>().setFilter(filterValue),
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
}

/// Provider card adapted for ProviderListModel
class _ProviderCard extends StatelessWidget {
  const _ProviderCard({required this.provider, required this.onTap});

  final ProviderListModel provider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      provider.serviceProviderNameAr ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (provider.type != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color:
                            AppColors.primaryShadeColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        provider.type!.typeNameAr,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              if (provider.notes != null && provider.notes!.isNotEmpty)
                Text(
                  provider.notes!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 12),
              if (provider.district != null)
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 18),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${provider.district!.districtNameAr}'
                        '${provider.district!.city != null ? ' - ${provider.district!.city!.cityNameAr}' : ''}',
                      ),
                    ),
                  ],
                ),
              if (provider.mobileNumber1 != null &&
                  provider.mobileNumber1!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.phone_outlined, size: 18),
                      const SizedBox(width: 6),
                      Text(provider.mobileNumber1!),
                    ],
                  ),
                ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (provider.createdAt != null)
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${provider.createdAt!.year}-'
                          '${provider.createdAt!.month.toString().padLeft(2, '0')}-'
                          '${provider.createdAt!.day.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  RequestStatusWidget(
                    status: RequestStatus.fromString(provider.state) ??
                        RequestStatus.pending,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
