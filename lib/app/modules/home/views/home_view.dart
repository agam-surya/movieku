import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:movieku/app/modules/home/views/test.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';

import '../../../utils/color.dart';
import '../controllers/home_controller.dart';
import '../widgets/carrousel.dart';
import '../widgets/new_movie.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final GlobalKey _sliderKey = GlobalKey();
  HomeController homeController = Get.find<HomeController>();
  void _onItemTapped(int index) {
    homeController.onNavbarTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Obx(
          () => FloatingNavbar(
            items: [
              FloatingNavbarItem(icon: Icons.home, title: 'Beranda'),
              FloatingNavbarItem(icon: Icons.list_alt_outlined, title: 'Menu'),
              FloatingNavbarItem(
                  icon: Icons.shopping_cart_outlined, title: 'Keranjang'),
              FloatingNavbarItem(
                  icon: Icons.notifications_outlined, title: 'Pemberitahuan'),
              FloatingNavbarItem(
                  icon: Icons.person_pin_circle_outlined, title: 'Akun'),
            ],
            currentIndex: homeController.selectedIndex.value,
            selectedItemColor: Colors.purple,
            onTap: _onItemTapped,
            backgroundColor: Color.fromARGB(61, 0, 0, 0),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: blueColor,
                    size: 40,
                  )),
            )
          ],
        ),
        body: Obx(
          () => homeController.selectedIndex.value == 0
              ? Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height * 0.35,
                        color: Colors.black,
                        child: CarouselSlider.builder(
                          key: _sliderKey,
                          itemCount: homeController.movieCarrousel.length,
                          unlimitedMode: true,
                          slideBuilder: (index) {
                            var movie = homeController.movieCarrousel[index];
                            return CarrouselMovie(
                                image: movie.image,
                                title: movie.title,
                                desc: movie.desc,
                                point: movie.point);
                          },
                          enableAutoSlider: true,
                          autoSliderDelay: const Duration(seconds: 7),
                          slideIndicator: CircularSlideIndicator(
                              indicatorRadius: 4,
                              itemSpacing: 15,
                              currentIndicatorColor: blueColor,
                              indicatorBackgroundColor: Colors.white,
                              padding: const EdgeInsets.only(bottom: 10)),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                      color: blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.5,
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  removeBottom: true,
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 4 / 6,
                                        crossAxisCount: 3,
                                      ),
                                      itemCount: homeController.newMovie.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        var movie =
                                            homeController.newMovie[index];
                                        return GridAnimatorWidget(
                                          child: NewMovie(
                                              image: movie.image,
                                              title: movie.title,
                                              rating: movie.point.toString()),
                                        );
                                      }),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10),
                                child: Text(
                                  "Popular",
                                  style: TextStyle(
                                      color: blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.5,
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  removeBottom: true,
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 4 / 6,
                                        crossAxisCount: 3,
                                      ),
                                      itemCount: homeController.newMovie.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        var movie =
                                            homeController.newMovie[index];
                                        return GridAnimatorWidget(
                                          child: NewMovie(
                                              image: movie.image,
                                              title: movie.title,
                                              rating: movie.point.toString()),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Test(),
        ));
  }
}
