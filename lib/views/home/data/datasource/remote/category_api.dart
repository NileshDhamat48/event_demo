import 'package:demo_task/core/strings.dart';
import 'package:demo_task/services/app_api.dart';
import 'package:demo_task/views/home/data/model/category_model.dart';

import '../../../../../services/api_helper.dart';

class CategoryApi {
  final ApiHelper _apiHelper = ApiHelper();

  Future<List<CategoryData>> fetchCategory() async {
    final response = await _apiHelper.getRequest(AppApi.getCategories);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['responsedata'];
      return data.map((item) => CategoryData.fromJson(item)).toList();
    } else {
      throw Exception(Strings.exceptionLoadCategory);
    }
  }
}
