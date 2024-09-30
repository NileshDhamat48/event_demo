import 'package:demo_task/views/home/data/model/banner_model.dart';
import 'package:demo_task/views/home/data/datasource/remote/slider_api.dart';
import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  List<SliderData> _sliders = [];
  bool _isLoading = false;

  List<SliderData> get sliders => _sliders;
  bool get isLoading => _isLoading;

  Future<void> fetchSliderData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _sliders = await SliderApi().fetchBanner();
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }
}
