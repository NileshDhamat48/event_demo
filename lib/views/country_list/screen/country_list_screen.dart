import 'package:demo_task/core/strings.dart';
import 'package:demo_task/views/country_list/provider/country_provider.dart';
import 'package:demo_task/views/city_list/screen/city_list_screen.dart';
import 'package:demo_task/views/country_list/widgets/country_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/country_controller.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CountryController().loadCountries(context);
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.titleCountryList)),
      body: Consumer<CountryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: provider.countries.length,
              itemBuilder: (context, index) {
                final country = provider.countries[index];
                return CountryGridItem(
                  country: country,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CityListScreen(countryId: country.id!),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
