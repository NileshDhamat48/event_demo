import 'package:demo_task/views/city_list/data/model/city_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/common_network_image.dart';

class CityGridItem extends StatelessWidget {
  final City city;
  final VoidCallback? onTap;

  const CityGridItem({super.key, required this.city, this.onTap});

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
                  child: CommonNetworkImage(imageUrl: city.image ?? ''))),
          Text(city.title ?? ''),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
