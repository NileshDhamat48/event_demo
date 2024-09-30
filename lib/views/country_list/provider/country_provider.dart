import 'package:demo_task/views/country_list/data/model/country_model.dart';
import 'package:demo_task/views/country_list/data/datasource/remote/country_api.dart';
import 'package:flutter/material.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> _countries = [];
  bool _isLoading = false;

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;

  Future<void> loadCountries() async {
    _isLoading = true;
    notifyListeners();
    try {
      _countries = await CountryApi().fetchCountries();
    } catch (e) {
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }
}
