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
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Get.width,
                        height: 50,
                        margin: const EdgeInsets.only(left: 10, bottom: 20),
                        child: Obx(
                          () => Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "New ${homeController.categories[homeController.movieCategory.value]}",
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2.5,
                                    color: Colors.transparent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    shadows: [
                                      Shadow(
                                          color: blueColor,
                                          offset: Offset(0, -10))
                                    ],
                                    decorationColor: blueColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: homeController.categories.length,
                                    itemBuilder: (context, index) {
                                      var cat =
                                          homeController.categories[index];
                                      var isActive =
                                          homeController.movieCategory.value ==
                                              index;

                                      return GestureDetector(
                                        onTap: () {
                                          homeController.category(index);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          margin: const EdgeInsets.only(
                                              bottom: 12, right: 3),
                                          decoration: BoxDecoration(
                                              color: isActive
                                                  ? blueColor
                                                  : Colors.black,
                                              border: Border.all(
                                                  color: blueColor, width: 2)),
                                          child: Center(
                                              child: Text(
                                            cat,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: GridView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 4 / 7,
                                crossAxisCount: 3,
                              ),
                              itemCount: homeController.movies.length,
                              itemBuilder: (BuildContext ctx, index) {
                                var movie = homeController.movies[index];
                                return GridAnimatorWidget(
                                  child: NewMovie(
                                    id: movie.id,
                                    image: movie.image,
                                    title: movie.title,
                                    rating: movie.point.toString(),
                                    year: movie.year,
                                    durasi: movie.durasi,
                                    desc: movie.desc,
                                    tag: movie.tag,
                                   
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                )
              : Test(),
        ));
  }
}
