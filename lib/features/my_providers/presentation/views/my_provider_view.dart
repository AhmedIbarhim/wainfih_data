import 'package:flutter/material.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../details/data/models/city_model.dart';
import '../../../details/data/models/details_model.dart';
import '../../../home/domain/provider_model.dart';
import '../widgets/provider_card.dart';

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
