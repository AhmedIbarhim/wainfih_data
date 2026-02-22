import 'package:flutter/material.dart';
import 'package:wainfih_data/Core/utils/app_text_styles.dart';
import 'package:wainfih_data/core/theme/app_colors.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../../../details/data/models/city_model.dart';
import '../../../details/data/models/details_model.dart';
import '../../domain/provider_model.dart';

class MyProviderView extends StatelessWidget {
  const MyProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: "مقدمي الخدمة الخاصة بي"),
      body: ProvidersListView(),

      // Center(
      //   child: Text(
      //     "لم يتم إضافة مقدمي خدمة بعد",
      //     style: AppTextStyles.semiBold16.copyWith(color: Colors.grey),
      //   ),
      // ),
    );
  }
}

final List<ProviderModel> dummyProviders = [
  ProviderModel(
    details: DetailsModel(
      name: 'سباك السلام',
      category: 'سباكة',
      description: 'خدمات سباكة وصيانة لجميع المنازل والشركات بأسعار مناسبة',
      phone: '01012345678',
      email: 'alsalam.plumbing@gmail.com',
      address: 'مدينة نصر',
      city: CityModel(id: 1, cityNameAr: 'القاهرة', cityNameEn: 'Cairo'),
    ),
  ),
  ProviderModel(
    details: DetailsModel(
      name: 'النور للكهرباء',
      category: 'كهرباء',
      description:
          'أعمال كهرباء وتشطيبات وصيانة أعطال الكهرباء للمنازل والمحلات',
      phone: '01198765432',
      address: 'سموحة',
      city: CityModel(
        id: 1,
        cityNameAr: 'الإسكندرية',
        cityNameEn: 'Alexandria',
      ),
    ),
  ),
  ProviderModel(
    details: DetailsModel(
      name: 'النجار ',
      category: 'نجارة',
      description: 'تصنيع وتركيب الأثاث المودرن والكلاسيك بأفضل الخامات',
      phone: '01234567890',
      address: 'الدقي',
      city: CityModel(id: 1, cityNameAr: 'الجيزة', cityNameEn: 'Giza'),
    ),
  ),
  ProviderModel(
    details: DetailsModel(
      name: 'الهدى للتكييفات',
      category: 'تكييف وتبريد',
      description: 'تركيب وصيانة جميع أنواع التكييفات بخدمة سريعة وضمان',
      phone: '01055556666',
      address: 'شبرا',
      city: CityModel(id: 1, cityNameAr: 'القاهرة', cityNameEn: 'Cairo'),
    ),
  ),
];

class ProvidersListView extends StatelessWidget {
  const ProvidersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyProviders.length,
      itemBuilder: (_, index) => ProviderCard(provider: dummyProviders[index]),
    );
  }
}

class ProviderCard extends StatelessWidget {
  final ProviderModel provider;

  const ProviderCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final d = provider.details;

    return Card(
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
                    d?.name ?? '',
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
                      color: AppColors.primaryShadeColor.withValues(alpha: 0.3),
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
                Expanded(child: Text('${d?.city ?? ''} - ${d?.address ?? ''}')),
              ],
            ),
            const SizedBox(height: 8),
            if (d?.phone != null)
              Row(
                children: [
                  const Icon(Icons.phone_outlined, size: 18),
                  const SizedBox(width: 6),
                  Text(d!.phone!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
