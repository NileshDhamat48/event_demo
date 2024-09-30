import 'package:demo_task/views/city_list/provider/city_provider.dart';

import 'package:provider/provider.dart';

class CityController {
  void loadCities(context, int countryId) {
    Provider.of<CityProvider>(context, listen: false).loadCities(countryId);
  }
}
