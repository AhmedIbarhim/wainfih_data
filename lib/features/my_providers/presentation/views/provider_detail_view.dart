import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/main_button.dart';
import '../../../../core/route/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/provider_list_model.dart';
import '../widgets/request_status_widget.dart';

class ProviderDetailView extends StatelessWidget {
  const ProviderDetailView({super.key, required this.provider});

  final ProviderListModel provider;

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);

    return Scaffold(
      appBar: buildCustomAppBar(context, title: l.providerDetailTitle),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image at top
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status badge + date row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RequestStatusWidget(
                        status:
                            RequestStatus.fromString(provider.state) ??
                            RequestStatus.pending,
                      ),
                      if (provider.createdAt != null)
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
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
                    ],
                  ),
                  const Divider(height: 24),
                  // Provider name
                  if (provider.serviceProviderNameAr != null &&
                      provider.serviceProviderNameAr!.isNotEmpty)
                    _buildInfoRow(
                      Icons.person_outline,
                      l.providerNameAr,
                      provider.serviceProviderNameAr!,
                    ),
                  if (provider.serviceProviderNameEn != null &&
                      provider.serviceProviderNameEn!.isNotEmpty)
                    _buildInfoRow(
                      Icons.person_outline,
                      l.providerNameEn,
                      provider.serviceProviderNameEn!,
                    ),
                  // Mobile
                  if (provider.mobileNumber1 != null &&
                      provider.mobileNumber1!.isNotEmpty)
                    _buildInfoRow(
                      Icons.phone_outlined,
                      l.mobileNumber,
                      provider.mobileNumber1!,
                    ),
                  if (provider.mobileNumber2 != null &&
                      provider.mobileNumber2!.isNotEmpty)
                    _buildInfoRow(
                      Icons.phone_outlined,
                      l.secondMobile,
                      provider.mobileNumber2!,
                    ),
                  // Type
                  if (provider.type != null)
                    _buildInfoRow(
                      Icons.category_outlined,
                      l.serviceType,
                      provider.type!.typeNameAr,
                    ),
                  // District / City
                  if (provider.district != null) ...[
                    _buildInfoRow(
                      Icons.location_on_outlined,
                      l.districtLabel,
                      provider.district!.districtNameAr,
                    ),
                    if (provider.district!.city != null)
                      _buildInfoRow(
                        Icons.location_city_outlined,
                        l.cityLabel,
                        provider.district!.city!.cityNameAr,
                      ),
                  ],
                  // Contact person
                  if (provider.contactPersonName != null &&
                      provider.contactPersonName!.isNotEmpty)
                    _buildInfoRow(
                      Icons.badge_outlined,
                      l.contactPerson,
                      provider.contactPersonName!,
                    ),
                  // Notes
                  if (provider.notes != null && provider.notes!.isNotEmpty)
                    _buildInfoRow(
                      Icons.notes_outlined,
                      l.notes,
                      provider.notes!,
                    ),
                  const SizedBox(height: 24),
                  // Edit button — only when state is PENDING
                  if (provider.state.toUpperCase() == 'PENDING')
                    MainButton(
                      text: l.editButton,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Routes.addProvider,
                          arguments: provider,
                        );
                      },
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final imageUrl = _extractImageUrl();
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return SizedBox(
        height: 220,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: AppColors.background,
            child: const Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => _buildImagePlaceholder(),
        ),
      );
    }
    return _buildImagePlaceholder();
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 180,
      width: double.infinity,
      color: AppColors.background,
      child: const Icon(
        Icons.storefront_outlined,
        size: 80,
        color: AppColors.primaryShadeColor,
      ),
    );
  }

  String? _extractImageUrl() {
    if (provider.image == null) return null;
    // Try common keys: url, path, original_url
    return (provider.image!['url'] ??
            provider.image!['original_url'] ??
            provider.image!['path']) as String?;
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.regular11.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTextStyles.regular13.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
