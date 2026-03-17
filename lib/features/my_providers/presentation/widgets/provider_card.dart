import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/domain/provider_model.dart';
import 'request_status_widget.dart';

class ProviderCard extends StatelessWidget {
  final ProviderModel provider;

  const ProviderCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final d = provider.details;

    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, Routes.addProvider, arguments: provider);
      },
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
                      d?.serviceProviderNameAr ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (d?.category != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryShadeColor.withValues(
                          alpha: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        d!.category!,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              if (d?.description != null)
                Text(
                  d!.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 18),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${d?.district?.districtNameAr ?? ''} - ${d?.address ?? ''}',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (d?.mobileNumber1 != null)
                Row(
                  children: [
                    const Icon(Icons.phone_outlined, size: 18),
                    const SizedBox(width: 6),
                    Text(d!.mobileNumber1!),
                  ],
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
                          '${provider.createdAt!.year}-${provider.createdAt!.month.toString().padLeft(2, '0')}-${provider.createdAt!.day.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  // if (provider.status != null)
                  RequestStatusWidget(
                    status:
                        RequestStatus.fromString(provider.status) ??
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
