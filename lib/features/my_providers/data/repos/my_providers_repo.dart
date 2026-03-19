import 'package:wainfih_data/core/networking/api_client.dart';

import '../../../adding_new_provider/domain/provider_model.dart';

class MyProvidersRepo {
  final APIClient apiClient;
  MyProvidersRepo({required this.apiClient});

  Future<List<ProviderModel>> getMyProviders() async {
    try {
      final response = await apiClient.get('/provider/my-providers');
      return response.data.map((x) => ProviderModel.fromJson(x)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
