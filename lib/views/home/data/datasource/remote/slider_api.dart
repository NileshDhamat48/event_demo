import 'package:demo_task/core/strings.dart';
import 'package:demo_task/services/app_api.dart';
import 'package:demo_task/views/home/data/model/banner_model.dart';

import '../../../../../services/api_helper.dart';

class SliderApi {
  final ApiHelper _apiHelper = ApiHelper();

  Future<List<SliderData>> fetchBanner() async {
    final response = await _apiHelper.getRequest(AppApi.getSliders);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['responsedata'];
      return data.map((item) => SliderData.fromJson(item)).toList();
    } else {
      throw Exception(Strings.exceptionLoadSlider);
    }
  }
}
