import 'package:flutter/material.dart';
import 'package:wainfih_data/core/utils/screen_util.dart';

import '../../../../core/route/routes.dart';
import 'home_action_card.dart';

class HomeActionGrid extends StatelessWidget {
  const HomeActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(20.toRadius),
      mainAxisSpacing: 20.toWidth,
      crossAxisSpacing: 20.toHeight,
      children: [
        HomeActionCard(
          title: "إضافة مقدم خدمة",
          icon: Icons.person_add_rounded,
          color: Colors.blue,
          onTap: () => Navigator.of(context).pushNamed(Routes.addProvider),
        ),
        HomeActionCard(
          title: "عرض مقدمي الخدمة",
          icon: Icons.list_alt_rounded,
          color: Colors.orange,
          onTap: () => Navigator.of(context).pushNamed(Routes.myProviders),
        ),
      ],
    );
  }
}
