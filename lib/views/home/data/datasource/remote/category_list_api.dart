import 'package:demo_task/core/strings.dart';
import 'package:demo_task/services/app_api.dart';
import 'package:demo_task/views/home/data/model/category_list.dart';

import '../../../../../services/api_helper.dart';

class CategoryListApi {
  final ApiHelper _apiHelper = ApiHelper();

  Future<CategoryList> fetchCategoryList(int cityId) async {
    final response = await _apiHelper.getRequest('${AppApi.getEvents}$cityId');
    if (response.statusCode == 200) {
      return CategoryList.fromJson(response.data['responsedata']);
    } else {
      throw Exception(Strings.exceptionLoadEvents);
    }
  }
}
