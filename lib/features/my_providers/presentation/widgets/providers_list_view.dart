import 'package:flutter/material.dart';
import '../../data/models/provider_list_model.dart';
import 'provider_card.dart';

class ProvidersListView extends StatelessWidget {
  final List<ProviderListModel> providers;
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
