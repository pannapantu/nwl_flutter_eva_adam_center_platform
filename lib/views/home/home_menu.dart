import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/constants/app_constants.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/widgets/list_menu_card.dart';

class HomeMenu extends ConsumerStatefulWidget {
  const HomeMenu({super.key});

  @override
  ConsumerState<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends ConsumerState<HomeMenu> {
  int currentPage = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mainMenuState = ref.watch(mainMenuViewModelProvider);

    if (mainMenuState.listOfMenu.isEmpty) {
      return const Center(
        child: Text("No List Menu "),
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      width: double.infinity,
      height: 220.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: CarouselSlider.builder(
                carouselController: carouselController,
                itemCount: mainMenuState.listOfMenu.length,
                itemBuilder: (context, index, realIndex) {
                  final item = mainMenuState.listOfMenu[index];
                  return ListMenuCard(item: item);
                },
                options: CarouselOptions(
                  padEnds: false,
                  viewportFraction: screenWidth > maxDesktopScreenWidth
                      ? 0.13
                      : 0.2, // Adjust gap between lists
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  scrollPhysics: const BouncingScrollPhysics(),
                  initialPage: currentPage,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                )),
          ),
          Positioned(
              top: 40.0,
              left: 10.0,
              child: IconButton(
                  onPressed:
                      currentPage == 0 ? null : carouselController.previousPage,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 22.0,
                    color: currentPage == 0
                        ? AppColor.blackDisabled
                        : AppColor.blackPrimary,
                  ))),
          Positioned(
              top: 40.0,
              right: 10.0,
              child: IconButton(
                  onPressed: screenWidth > maxDesktopScreenWidth
                      ? currentPage == 1
                          ? null
                          : carouselController.nextPage
                      : currentPage == 4
                          ? null
                          : carouselController.nextPage,
                  icon: Icon(Icons.arrow_forward_ios_rounded,
                      size: 22.0,
                      color: screenWidth > maxDesktopScreenWidth
                          ? currentPage == 1
                              ? AppColor.blackDisabled
                              : AppColor.blackPrimary
                          : currentPage == 4
                              ? AppColor.blackDisabled
                              : AppColor.blackPrimary))),
          Positioned(
            right: 1 / 2,
            left: 1 / 2,
            bottom: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  screenWidth > maxDesktopScreenWidth ? 2 : 5, (index) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(index),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColor.blackAlpha45Primary, width: 0.5),
                        color: currentPage == index
                            ? AppColor.blackAlpha45Primary
                            : AppColor.whiteButton),
                    margin: const EdgeInsets.only(left: 10.0),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
