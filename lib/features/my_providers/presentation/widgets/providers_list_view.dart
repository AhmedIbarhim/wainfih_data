import 'package:flutter/material.dart';

import '../../../details/data/models/city_model.dart';
import '../../../details/data/models/details_model.dart';
import '../../../home/domain/provider_model.dart';
import 'provider_card.dart';

class ProvidersListView extends StatelessWidget {
  final List<ProviderModel> providers;
  const ProvidersListView({super.key, required this.providers});

  @override
  Widget build(BuildContext context) {
    if (providers.isEmpty) {
      return Center(
        child: Text(
          "لا يوجد نتائج",
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
      );
    }
    return ListView.builder(
      itemCount: providers.length,
      padding: const EdgeInsets.only(bottom: 16),
      itemBuilder: (_, index) => ProviderCard(provider: providers[index]),
    );
  }
}

final List<ProviderModel> dummyProviders = [
  ProviderModel(
    createdAt: DateTime.now(),
    status: 'pending',
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
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    status: 'accepted',
    details: DetailsModel(
      name: 'النور للكهرباء',
      category: 'كهرباء',
      description:
          'أعمال كهرباء وتشتشطيبات وصيانة أعطال الكهرباء للمنازل والمحلات',
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
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
    status: 'rejected',
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
    createdAt: DateTime.now().subtract(const Duration(days: 45)),
    status: 'pending',
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
