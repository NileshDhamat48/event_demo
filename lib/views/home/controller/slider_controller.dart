import 'package:demo_task/views/home/provider/slider_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SliderController {
  void fetchSliders(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    sliderProvider.fetchSliderData();
  }
}
