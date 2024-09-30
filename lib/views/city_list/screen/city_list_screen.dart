import 'package:demo_task/core/strings.dart';
import 'package:demo_task/views/city_list/provider/city_provider.dart';
import 'package:demo_task/views/home/screen/home_screen.dart';
import 'package:demo_task/views/city_list/widgets/city_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/city_controller.dart';

class CityListScreen extends StatelessWidget {
  final int countryId;

  const CityListScreen({super.key, required this.countryId});

  @override
  Widget build(BuildContext context) {
    CityController().loadCities(context, countryId);

    return Scaffold(
      appBar: AppBar(title: const Text(Strings.titleCityScreen)),
      body: Consumer<CityProvider>(
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
              itemCount: provider.cities.length,
              itemBuilder: (context, index) {
                final city = provider.cities[index];
                return CityGridItem(
                  city: city,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(cityId: city.id!),
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
