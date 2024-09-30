import 'package:demo_task/views/country_list/provider/country_provider.dart';
import 'package:provider/provider.dart';

class CountryController {
  void loadCountries(context) {
    Provider.of<CountryProvider>(context, listen: false).loadCountries();
  }
}
