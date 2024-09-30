import 'package:demo_task/views/city_list/data/model/city_model.dart';
import 'package:demo_task/views/city_list/data/datasource/remote/city_api.dart';
import 'package:flutter/material.dart';

class CityProvider extends ChangeNotifier {
  List<City> _cities = [];
  bool _isLoading = false;

  List<City> get cities => _cities;
  bool get isLoading => _isLoading;

  Future<void> loadCities(int countryId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _cities = await CityApi().fetchCities(countryId);
    } catch (e) {
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }
}
