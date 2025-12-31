import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wainfih_data/features/home/presentation/views/details_section.dart';
import 'package:wainfih_data/features/home/presentation/views/image_section.dart';
import 'package:wainfih_data/features/map/presentation/manager/location_cubit.dart';
import 'package:wainfih_data/features/map/presentation/views/map_section.dart';

import '../../../map/data/location_remote_data_source.dart';
import '../../../map/data/location_repo_impl.dart';

class AddingProviderPageView extends StatelessWidget {
  const AddingProviderPageView({
    super.key,
    required this.pageController,
    required this.formKey,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: _addingSteps().length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _addingSteps()[index],
      ),
    );
  }

  List<Widget> _addingSteps() => [
    const DetailsSection(),
    const ImageSection(),
    BlocProvider(
      create: (context) =>
          LocationCubit(LocationRepoImpl(LocationRemoteDataSourceImpl())),
      child: const MapSection(),
    ),
  ];
}
