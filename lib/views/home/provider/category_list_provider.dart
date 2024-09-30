import 'package:demo_task/views/home/data/datasource/remote/category_list_api.dart';
import 'package:demo_task/views/home/data/model/category_list.dart';
import 'package:flutter/material.dart';

class CategoryListProvider with ChangeNotifier {
  CategoryList? categoryList;
  bool isLoading = false;

  Future<void> loadCategories(int cityId) async {
    isLoading = true;
    notifyListeners();

    categoryList = await CategoryListApi().fetchCategoryList(cityId);
    isLoading = false;
    notifyListeners();
  }
}
