import 'package:demo_task/views/home/provider/category_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/category_provider.dart';

class CategoryController {
  void fetchCategories(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.fetchCategoryData();
  }
}
class CategoryListController {
  void fetchCategorieList(BuildContext context, int cityId) {
    final categoryProvider =
        Provider.of<CategoryListProvider>(context, listen: false);
    categoryProvider.loadCategories(cityId);
  }
}
