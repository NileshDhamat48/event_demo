import 'package:demo_task/core/strings.dart';
import 'package:demo_task/services/app_api.dart';
import 'package:demo_task/views/city_list/data/model/city_model.dart';

import '../../../../../services/api_helper.dart';

class CityApi {
  final ApiHelper _apiHelper = ApiHelper();

  Future<List<City>> fetchCities(int countryId) async {
    final response = await _apiHelper.getRequest('${AppApi.getCity}$countryId');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['responsedata'];
      return data.map((item) => City.fromJson(item)).toList();
    } else {
      throw Exception(Strings.exceptionLoadCities);
    }
  }
}
