import 'package:demo_task/core/strings.dart';
import 'package:demo_task/services/app_api.dart';
import 'package:demo_task/views/country_list/data/model/country_model.dart';

import '../../../../../services/api_helper.dart';

class CountryApi {
  final ApiHelper _apiHelper = ApiHelper();

  Future<List<Country>> fetchCountries() async {
    final response = await _apiHelper.getRequest(AppApi.getCountry);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['responsedata'];
      return data.map((item) => Country.fromJson(item)).toList();
    } else {
      throw Exception(Strings.exceptionLoadCountries);
    }
  }
}
