import 'package:demo_task/views/home/data/model/category_model.dart';
import 'package:demo_task/views/home/data/datasource/remote/category_api.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryData> _categories = [];
  bool _isLoading = false;

  List<CategoryData> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategoryData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await CategoryApi().fetchCategory();
    } catch (e) {
      // Handle errors
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }
}
