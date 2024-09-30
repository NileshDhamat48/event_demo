import 'package:demo_task/views/country_list/data/model/country_model.dart';
import 'package:demo_task/utils/common_network_image.dart';
import 'package:flutter/material.dart';

class CountryGridItem extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryGridItem(
      {super.key, required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CommonNetworkImage(imageUrl: country.image ?? ''))),
          Text(country.title ?? ''),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
