import 'package:card_swiper/card_swiper.dart';
import 'package:demo_task/core/app_colors.dart';
import 'package:demo_task/core/strings.dart';
import 'package:demo_task/utils/common_network_image.dart';
import 'package:demo_task/views/auth/screen/login_screen.dart';
import 'package:demo_task/views/home/controller/category_controller.dart';
import 'package:demo_task/views/home/controller/slider_controller.dart';
import 'package:demo_task/views/home/provider/category_list_provider.dart';
import 'package:demo_task/views/home/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/slider_provider.dart';

class HomeScreen extends StatelessWidget {
  final int cityId;

  const HomeScreen({super.key, required this.cityId});

  @override
  Widget build(BuildContext context) {
    SliderController().fetchSliders(context);
    CategoryController().fetchCategories(context);

    CategoryListController().fetchCategorieList(context, cityId);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleHome),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Consumer<SliderProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (provider.sliders.isEmpty) {
                    return const Center(child: Text(Strings.emptySliders));
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Swiper(
                        autoplay: true,
                        itemCount: provider.sliders.length,
                        itemBuilder: (context, index) {
                          final slider = provider.sliders[index];
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CommonNetworkImage(
                                imageUrl: slider.image ?? '',
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ));
                        },
                        pagination: const SwiperPagination(
                          margin: EdgeInsets.only(top: 4),
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                              color: AppColors.colorGrey,
                              activeColor: AppColors.colorWhite,
                              size: 6,
                              activeSize: 6),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Consumer<CategoryProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.categories.isEmpty) {
                  return const Center(child: Text(Strings.emptyList));
                }
                if (provider.categories.isEmpty) {
                  return const SizedBox();
                }
                return _buildCategory(
                    Strings.titleCategories, provider.categories);
              },
            ),
            SizedBox(
              child: Consumer<CategoryListProvider>(
                builder: (context, controller, child) {
                  if (controller.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.categoryList == null) {
                    return const Center(child: Text(Strings.emptyList));
                  }

                  return Column(
                    children: [
                      _buildCategoryList(
                          'Popular', controller.categoryList!.popular),
                      _buildCategoryList(
                          'Upcoming', controller.categoryList!.upcoming),
                      _buildCategoryList(
                          'Indoor', controller.categoryList!.indoor),
                      _buildCategoryList(
                          'Outdoor', controller.categoryList!.outdoor),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList(String title, List<dynamic>? categoryItems) {
    if (categoryItems == null || categoryItems.isEmpty) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryItems.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    width: 100,
                    margin: const EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CommonNetworkImage(
                            imageUrl: categoryItems[index].banner ?? ''))),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategory(String title, List<dynamic>? categoryItems) {
    if (categoryItems == null || categoryItems.isEmpty) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryItems.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    width: 100,
                    margin: const EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CommonNetworkImage(
                            imageUrl: categoryItems[index].image ?? ''))),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           Container(
            color: AppColors.primaryColor,
            height: 200,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('isLoggedIn'); // Remove the login state
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
