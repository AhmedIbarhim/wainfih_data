import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/category_model.dart';
import '../models/city_model.dart';
import '../models/district_model.dart';

class LookupsCache {
  final List<CityModel> cities;
  final List<DistrictModel> districts;
  final List<CategoryModel> categories;

  LookupsCache({
    required this.cities,
    required this.districts,
    required this.categories,
  });

  Map<String, dynamic> toJson() => {
        'cities': cities.map((c) => c.toJson()).toList(),
        'districts': districts.map((d) => d.toJson()).toList(),
        'categories': categories.map((c) => c.toJson()).toList(),
      };

  factory LookupsCache.fromJson(Map<String, dynamic> json) => LookupsCache(
        cities: (json['cities'] as List)
            .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        districts: (json['districts'] as List)
            .map((e) => DistrictModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        categories: (json['categories'] as List)
            .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class LookupsLocalDataSource {
  static const _fileName = 'lookups_cache.json';

  Future<File> get _file async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  Future<void> saveCache(LookupsCache cache) async {
    final file = await _file;
    await file.writeAsString(jsonEncode(cache.toJson()));
  }

  Future<LookupsCache?> loadCache() async {
    try {
      final file = await _file;
      if (!await file.exists()) return null;
      final content = await file.readAsString();
      return LookupsCache.fromJson(
        jsonDecode(content) as Map<String, dynamic>,
      );
    } catch (_) {
      return null;
    }
  }

  Future<bool> get hasCache async {
    final file = await _file;
    return file.exists();
  }
}
