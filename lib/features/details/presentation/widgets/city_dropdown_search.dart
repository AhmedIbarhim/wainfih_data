// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/utils/screen_util.dart';
// import '../../data/models/city_model.dart';
// import '../controllers/fields_cubit/fields_cubit.dart';

// class CityDropdownSearch extends StatefulWidget {
//   const CityDropdownSearch({
//     super.key,
//     required this.label,
//     required this.onChanged,
//     this.value,
//     this.validate = true,
//     this.citiesFetcher,
//   });

//   final String label;
//   final CityModel? value;
//   final ValueChanged<CityModel?> onChanged;
//   final bool validate;
//   final Future<List<CityModel>> Function(String? searchQuery)? citiesFetcher;

//   @override
//   State<CityDropdownSearch> createState() => _CityDropdownSearchState();
// }

// class _CityDropdownSearchState extends State<CityDropdownSearch> {
//   final GlobalKey<FormFieldState<CityModel>> _formFieldKey =
//       GlobalKey<FormFieldState<CityModel>>();
//   late final FocusNode _focusNode = FocusNode();
//   late final ValueNotifier<bool> _isFocused = ValueNotifier(false);
//   final TextEditingController _searchController = TextEditingController();
//   final int _take = 10;
//   String? _currentFilter;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       _isFocused.value = _focusNode.hasFocus;
//     });
//   }

//   Widget _buildItem(
//     BuildContext context,
//     CityModel item,
//     bool isSelected,
//     bool isDisabled,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         item.cityNameAr,
//         style: TextStyle(
//           fontSize: 14.toFont,
//           fontWeight: FontWeight.w600,
//           color: AppColors.textPrimary,
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     _searchController.dispose();
//     _isFocused.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FieldsCubit, FieldsState>(
//       builder: (context, state) {
//         return Container(
//           margin: EdgeInsets.only(bottom: 16.toHeight),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16.toRadius),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.05),
//                 blurRadius: 10,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: FormField<CityModel>(
//             key: _formFieldKey,
//             initialValue: widget.value,

//             validator: widget.validate
//                 ? (CityModel? value) =>
//                       value == null ? "الرجاء إدخال المدينة" : null
//                 : null,
//             builder: (FormFieldState<CityModel> formFieldState) {
//               return GestureDetector(
//                 onTap: () => _isFocused.value = true,

//                 child: ValueListenableBuilder<bool>(
//                   valueListenable: _isFocused,
//                   builder: (context, isFocused, child) {
//                     final hasError = formFieldState.hasError;
//                     final borderColor = hasError
//                         ? Colors.red
//                         : (isFocused
//                               ? AppColors.primaryColor
//                               : AppColors.basicBorderColor.withValues(
//                                   alpha: 0.3,
//                                 ));
//                     final borderWidth = (isFocused || (hasError && isFocused))
//                         ? 2.0
//                         : 1.5;
//                     return DropdownSearch<CityModel>(
//                       key: const ValueKey('city_dropdown'),
//                       selectedItem: widget.value,
//                       decoratorProps: DropDownDecoratorProps(
//                         decoration: InputDecoration(
//                           labelText: widget.label,
//                           errorText: formFieldState.errorText,

//                           labelStyle: TextStyle(
//                             color: AppColors.primaryColor.withValues(
//                               alpha: 0.7,
//                             ),
//                             fontSize: 12.toFont,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           errorStyle: TextStyle(
//                             fontSize: 10.toFont,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16.toRadius),
//                             borderSide: BorderSide(
//                               color: borderColor,
//                               width: borderWidth,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16.toRadius),
//                             borderSide: BorderSide(
//                               color: borderColor,
//                               width: borderWidth,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16.toRadius),
//                             borderSide: BorderSide(
//                               color: borderColor,
//                               width: borderWidth,
//                             ),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16.toRadius),
//                             borderSide: BorderSide(
//                               color: borderColor,
//                               width: borderWidth,
//                             ),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16.toRadius),
//                             borderSide: BorderSide(
//                               color: borderColor,
//                               width: borderWidth,
//                             ),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 20.toWidth,
//                             vertical: 16.toHeight,
//                           ),
//                         ),
//                       ),
//                       suffixProps: DropdownSuffixProps(
//                         dropdownButtonProps: DropdownButtonProps(
//                           iconClosed: Icon(
//                             Icons.keyboard_arrow_down_rounded,
//                             color: AppColors.primaryColor,
//                             size: 24.toFont,
//                           ),
//                         ),
//                       ),
//                       items: (String filter, LoadProps? loadProps) async {
//                         if (widget.citiesFetcher != null) {
//                           return await widget.citiesFetcher!(
//                             filter.isNotEmpty ? filter : null,
//                           );
//                         }

//                         final incomingFilter = filter.isNotEmpty
//                             ? filter
//                             : null;

//                         final lp = loadProps as dynamic;
//                         if (lp != null) {
//                           final int requestedSkip = lp.skip ?? 0;
//                           final int requestedTake = lp.take ?? _take;
//                           final int requestedPage = requestedTake > 0
//                               ? (requestedSkip ~/ requestedTake) + 1
//                               : 1;

//                           // try {
//                           //   final result = await APIsManager().send(
//                           //     request: GetAllCitiesRequest(
//                           //       page: requestedPage,
//                           //       size: requestedTake,
//                           //       search: incomingFilter ?? _currentFilter,
//                           //     ),
//                           //     responseFromMap: (json) =>
//                           //         (json['content'] as List)
//                           //             .map((e) => CityModel.fromJson(e))
//                           //             .toList(),
//                           //   );

//                           //   return result.fold(
//                           //     (l) => <CityModel>[],
//                           //     (list) => list,
//                           //   );
//                           // } catch (_) {
//                           //   return <CityModel>[];
//                           // }
//                         }

//                         // Fallback: no loadProps provided — load first page.
//                         // final result = await APIsManager().send(
//                         //   request: GetAllCitiesRequest(
//                         //     page: 1,
//                         //     size: _take,
//                         //     search: incomingFilter,
//                         //   ),
//                         //   responseFromMap: (json) => (json['content'] as List)
//                         //       .map((e) => CityModel.fromJson(e))
//                         //       .toList(),
//                         // );

//                         // return result.fold(
//                         //   (l) => <CityModel>[],
//                         //   (list) => list,
//                         // );
//                       },
//                       itemAsString: (CityModel city) => city.cityNameAr,
//                       compareFn: (CityModel item1, CityModel item2) =>
//                           item1.id == item2.id,
//                       onChanged: (CityModel? newValue) {
//                         formFieldState.didChange(newValue);
//                         widget.onChanged(newValue);
//                       },
//                       dropdownBuilder: (context, selectedItem) {
//                         return Text(
//                           selectedItem != null ? selectedItem.cityNameAr : '',
//                           style: TextStyle(
//                             fontSize: 12.toFont,
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.textPrimary,
//                           ),
//                         );
//                       },
//                       popupProps: PopupProps.menu(
//                         showSearchBox: true,
//                         // when using infiniteScrollProps we must disable internal filter
//                         // and handle filtering ourselves via the items callback
//                         disableFilter: true,
//                         menuProps: MenuProps(
//                           borderRadius: BorderRadius.circular(16.toRadius),
//                         ),
//                         // enable built-in infinite scroll so the popup requests pages
//                         infiniteScrollProps: InfiniteScrollProps(
//                           loadProps: LoadProps(take: _take),
//                           loadingMoreBuilder: (context, search) {
//                             return Center(
//                               child: Padding(
//                                 padding: EdgeInsets.all(12.toRadius),
//                                 child: CircularProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     AppColors.primaryColor,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         itemBuilder: _buildItem,
//                         searchFieldProps: TextFieldProps(
//                           style: TextStyle(
//                             fontSize: 14.toFont,
//                             color: AppColors.textPrimary,
//                           ),
//                           controller: _searchController,
//                           onChanged: (v) {},
//                           decoration: InputDecoration(
//                             hintText: "ابحث",
//                             hintStyle: TextStyle(
//                               fontSize: 12.toFont,
//                               color: Colors.grey,
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 16.toWidth,
//                               vertical: 12.toHeight,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16.toRadius),
//                               borderSide: BorderSide.none,
//                             ),
//                             filled: true,
//                             fillColor: Colors.grey.shade50,
//                           ),
//                         ),
//                         // Let the package manage the internal scroll controller
//                         listViewProps: const ListViewProps(),
//                         emptyBuilder:
//                             (BuildContext context, String? searchEntry) {
//                               return Center(
//                                 child: Padding(
//                                   padding: EdgeInsets.all(16.toRadius),
//                                   child: Text(
//                                     "لا يوجد نتائج",
//                                     style: TextStyle(
//                                       fontSize: 12.toFont,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                         loadingBuilder:
//                             (BuildContext context, String? searchEntry) {
//                               return Center(
//                                 child: Padding(
//                                   padding: EdgeInsets.all(16.toRadius),
//                                   child: CircularProgressIndicator(
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       AppColors.primaryColor,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
